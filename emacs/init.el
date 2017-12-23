(require 'package) 
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24) ; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))) 
(package-initialize) 
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))


;; Programming Modes
(use-package haskell-mode :ensure t
  :init
  :config
  )
(use-package anaconda-mode :ensure t
  :init
  :config
  )

;; Completion Manager
(use-package helm :ensure t
  :init (helm-mode 1)
  :diminish helm-mode
  :bind (("M-x"     . helm-M-x)
         ("M-y"     . helm-show-kill-ring)
         ("C-x b"   . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("C-h f"   . helm-apropos)
         ("C-h g"   . helm-google-suggest)
         ("C-h SPC" . helm-all-mark-rings)
         ("M-s o"   . helm-occur))
  :config
  ;; to escape
  (key-chord-define minibuffer-local-map "jk" 'helm-like-unite/body)
  )
(use-package hydra :ensure t
  :config
  (defhydra helm-like-unite (:hint nil
                            :color pink)
    "
    Nav ^^^^^^^^^        Mark ^^          Other ^^       Quit
    ^^^^^^^^^^------------^^----------------^^----------------------
    _K_ ^ ^ _k_ ^ ^     _m_ark           _v_iew         _i_: cancel
    ^↕^ _h_ ^✜^ _l_     _t_oggle mark    _H_elp         _o_: quit
    _J_ ^ ^ _j_ ^ ^     _U_nmark all     _d_elete
    ^^^^^^^^^^                           _f_ollow: %(helm-attr 'follow)
    "
    ;; arrows
    ("h" helm-beginning-of-buffer)
    ("j" helm-next-line)
    ("k" helm-previous-line)
    ("l" helm-end-of-buffer)
    ;; beginning/end
    ("g" helm-beginning-of-buffer)
    ("G" helm-end-of-buffer)
    ;; scroll
    ("K" helm-scroll-other-window-down)
    ("J" helm-scroll-other-window)
    ;; mark
    ("m" helm-toggle-visible-mark)
    ("t" helm-toggle-all-marks)
    ("U" helm-unmark-all)
    ;; exit
    ("<escape>" keyboard-escape-quit "" :exit t)
    ("o" keyboard-escape-quit :exit t)
    ("i" nil)
    ;; sources
    ("}" helm-next-source)
    ("{" helm-previous-source)
    ;; rest
    ("H" helm-help)
    ("v" helm-execute-persistent-action)
    ("d" helm-persistent-delete-marked)
    ("f" helm-follow-mode))
    )
(use-package helm-company :ensure t
  :defer t
  :init 
  :config
  )
(use-package company :ensure t
  :defer t
  :init (global-company-mode 1)
  :config
  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                          ; remove annoying blinking
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
  )
(use-package company-go :ensure t
  :defer t
  :init
  )

(use-package which-key 
  :ensure t
  :init (which-key-mode)
  :config  
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05)
  :diminish which-key-mode
  )
(use-package bind-key :ensure t
  :init
  )

;; Evil Mode
(use-package evil
  :ensure t
  :init (evil-mode 1)
  :config ; Better vim remaps
  (define-key evil-motion-state-map (kbd ":") 'evil-ex)
  (define-key evil-motion-state-map (kbd ";") 'evil-ex)
  (evil-ex-define-cmd "q[uit]" 'kill-buffer-and-window)
  )

;; General Keymaps
(use-package key-chord :ensure t
  :init (key-chord-mode 1)
  :diminish key-chord-mode
  )
(use-package general :ensure t
  :init (general-evil-setup t)
  :config
  (general-define-key
   :states '(normal emacs)
   :prefix ","
   :non-normal-prefix ",")
  (general-define-key
   :states '(normal motion emacs)
   :prefix "SPC"
   "r"    'redraw-display
   "f"    'helm-find-files
   "o"    'helm-recentf
   "SPC"  'helm-M-x
   "l"    'helm-buffers-list
   "TAB"  'next-buffer
   "d"    'sp-splice-sexp
   "x"    'org-export-dispatch
   "i"    'org-insert-link
   "co" '((lambda () (interactive) (find-file "~/.emacs.d/")) :wk "Open Config")
   "cr" '((lambda () (interactive) (load-file "~/.emacs.d/init.el")) :wk "Reload Config"))
  (general-define-key :keymaps 'evil-insert-state-map
		      (general-chord "jk") 'evil-normal-state
		      (general-chord "kj") 'evil-normal-state)
  )

;; UI
; Theme and Font
(use-package spacemacs-common
  :ensure spacemacs-theme
  :config (load-theme 'spacemacs-dark t)
  )
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 150 
                    :weight 'normal 
                    :width 'normal)
; Graphical
(use-package diminish :ensure t
  :init
  )
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
; Buffer Management
(use-package midnight :ensure t
  :init (midnight-mode 1)
  )
; Point Completion at Minibuffer
(bind-key "TAB" 'completion-at-point read-expression-map)
; Smart Parens
(use-package smartparens :ensure t
  :diminish smartparens-mode
  :init
  (use-package evil-smartparens :ensure t
    :diminish evil-smartparens-mode
    :config (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))
  (require 'smartparens-config)
  (smartparens-global-mode)
  (show-smartparens-global-mode)
  ;(smartparens-global-strict-mode)
  )
; Misc
(defalias 'yes-or-no-p 'y-or-n-p)

;; Tabbing Settings
(use-package dtrt-indent :ensure t
  :init (dtrt-indent-mode 1)
  :config
  (setq dtrt-indent-min-quality 70.0)
  )
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; Spell Checking and Linting
(use-package flyspell :ensure t
  :defer t
  :init
  ;; Config Stolen : make this nicer
  ;; if (aspell installed) { use aspell}
  ;; else if (hunspell installed) { use hunspell }
  ;; whatever spell checker I use, I always use English dictionary
  ;; I prefer use aspell because:
  ;; 1. aspell is older
  ;; 2. looks Kevin Atkinson still get some road map for aspell:
  ;; @see http://lists.gnu.org/archive/html/aspell-announce/2011-09/msg00000.html
  (defun flyspell-detect-ispell-args (&optional run-together)
    "if RUN-TOGETHER is true, spell check the CamelCase words."
    (let (args)
      (cond
      ((string-match  "aspell$" ispell-program-name)
        ;; Force the English dictionary for aspell
        ;; Support Camel Case spelling check (tested with aspell 0.6)
        (setq args (list "--sug-mode=ultra" "--lang=en_AU"))
        (if run-together
            (setq args (append args '("--run-together" "--run-together-limit=5" "--run-together-min=2")))))
      ((string-match "hunspell$" ispell-program-name)
        ;; Force the English dictionary for hunspell
        (setq args "-d en_AU")))
      args))

  (cond
  ((executable-find "aspell")
    ;; you may also need `ispell-extra-args'
    (setq ispell-program-name "aspell"))
  ((executable-find "hunspell")
    (setq ispell-program-name "hunspell")

    ;; Please note that `ispell-local-dictionary` itself will be passed to hunspell cli with "-d"
    ;; it's also used as the key to lookup ispell-local-dictionary-alist
    ;; if we use different dictionary
    (setq ispell-local-dictionary "en_AU")
    (setq ispell-local-dictionary-alist
          '(("en_AU" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_AU") nil utf-8))))
  (t (setq ispell-program-name nil)))

  ;; ispell-cmd-args is useless, it's the list of *extra* arguments we will append to the ispell process when "ispell-word" is called.
  ;; ispell-extra-args is the command arguments which will *always* be used when start ispell process
  ;; Please note when you use hunspell, ispell-extra-args will NOT be used.
  ;; Hack ispell-local-dictionary-alist instead.
  (setq-default ispell-extra-args (flyspell-detect-ispell-args t))
  ;; (setq ispell-cmd-args (flyspell-detect-ispell-args))
  (defadvice ispell-word (around my-ispell-word activate)
    (let ((old-ispell-extra-args ispell-extra-args))
      (ispell-kill-ispell t)
      (setq ispell-extra-args (flyspell-detect-ispell-args))
      ad-do-it
      (setq ispell-extra-args old-ispell-extra-args)
      (ispell-kill-ispell t)
      ))

  (defadvice flyspell-auto-correct-word (around my-flyspell-auto-correct-word activate)
    (let ((old-ispell-extra-args ispell-extra-args))
      (ispell-kill-ispell t)
      ;; use emacs original arguments
      (setq ispell-extra-args (flyspell-detect-ispell-args))
      ad-do-it
      ;; restore our own ispell arguments
      (setq ispell-extra-args old-ispell-extra-args)
      (ispell-kill-ispell t)
      ))

  (defun text-mode-hook-setup ()
    ;; Turn off RUN-TOGETHER option when spell check text-mode
    (setq-local ispell-extra-args (flyspell-detect-ispell-args)))
  (add-hook 'text-mode-hook 'text-mode-hook-setup)
  :config
  )
(use-package flycheck :ensure t
  :init (flycheck-mode 1)
 )

;;Org Mode
; Publishing
(use-package ox-twbs :ensure t
  :init
  :config
  )
'(org-twbs-head
    "<link  href=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css\" rel=\"stylesheet\">
  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>
  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js\"></script>
  <link rel=\"stylesheet\" href=\"~/.org/custom.css\">")
(use-package org :ensure t
  :init
  (org-babel-do-load-languages
    'org-babel-load-languages
    '((python . t)))
  :config
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  (add-hook 'org-mode-hook
    '(lambda ()
      (delete '("\\.pdf\\'" . default) org-file-apps)
      (add-to-list 'org-file-apps '("\\.pdf\\'" . "zathura %s"))))
  (add-to-list 'org-latex-classes
      '("article"
              "\\documentclass{org-cls}"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  )
(provide 'init) 
