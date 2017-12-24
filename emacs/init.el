(require 'org)
(package-initialize)
(org-babel-load-file (expand-file-name
		      "~/.emacs.d/CONFIG.org"
		      user-emacs-directory))

