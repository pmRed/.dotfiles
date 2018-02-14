(require 'org)
(package-initialize)
(org-babel-load-file (expand-file-name
		      "~/.emacs.d/CONFIG.org"
		      user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (adaptive-wrap which-key use-package spacemacs-theme python-mode ox-twbs key-chord hydra helm-company haskell-mode guess-language general flycheck evil-surround evil-smartparens evil-leader evil-indent-textobject dtrt-indent diminish counsel company-go bind-map anaconda-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
