
(add-to-list 'load-path
  (expand-file-name "lisp" user-emacs-directory))

(require 'elpaca)
(require 'ui)
(require 'packages)
(require 'meow-config)

(elpaca-wait)

(require 'lsp)

(require 'uniquify)
(electric-pair-mode t)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(save-place-mode t)
(global-auto-revert-mode t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)


