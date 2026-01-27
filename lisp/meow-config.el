;;; -*- lexical-binding: t; -*-

(use-package meow
  :ensure t
  :demand t
  :init
  (setq meow-use-clipboard t)
  (setq emacs-local-leader-prefix "SPC")
  (setq meow-local-leader-prefix "/")
  (setq meow-local-leader-insert-prefix "C-/")
  (setq meow-expand-hint-remove-delay 3.0)

  ;; Set cursor types
  (setq meow-cursor-type-normal 'box
        meow-cursor-type-insert '(bar . 2)
        meow-cursor-type-beacon 'hollow
        meow-cursor-type-motion 'box)

  (add-hook 'git-commit-mode-hook 'meow-insert-mode)

  :config
  (require 'keybinds)
  (my/meow-setup)
  (meow-global-mode 1)
  )

(provide 'meow-config)