
(use-package emacs
  :ensure nil
  :straight (:type built-in)
  :config
  (require 'default))

;; Projectile
(use-package projectile
  :config
  (require 'projectile-config)
)

;; Which key
(use-package which-key
  :init
  (setq which-key-idle-delay 0.5) ; Open after .5s instead of 1s
  :config
  (which-key-mode))

(use-package meow
  :demand t
  :config 
  (meow-global-mode 1)
  (require 'meow-config)
  )

;; Theme
(use-package doom-themes
  :demand t
  :config
  (load-theme 'doom-challenger-deep t))

;; Modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package nerd-icons)

(use-package ace-window
  :init (setq aw-scope 'global))

(use-package dired
  :straight (:type built-in)
  :ensure nil
  :custom
  (dired-listing-switches "-lah --group-directories-first")
  (dired-dwim-target t)
  (dired-kill-when-opening-new-dired-buffer t))

(use-package org)

(use-package magit)

(use-package vertico
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :init
  (vertico-mode))

(use-package marginalia
  :after vertico
  :init
  (marginalia-mode))

(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 0)
  (completion-styles '(basic)))


(use-package orderless
  :after vertico                              ;; Ensure Vertico is loaded before Orderless.
  :init
  (setq completion-styles '(orderless basic)  ;; Set the completion styles.
        completion-category-defaults nil      ;; Clear default category settings.
        completion-category-overrides '((file (styles partial-completion))))) ;; Customize file completion styles.


(use-package diff-hl
  :hook
  (find-file . (lambda ()
                 (global-diff-hl-mode)           ;; Enable Diff-HL mode for all files.
                 (diff-hl-flydiff-mode)          ;; Automatically refresh diffs.
                 (diff-hl-margin-mode)))         ;; Show diff indicators in the margin.
  :custom
  (diff-hl-side 'left)                           ;; Set the side for diff indicators.
  (diff-hl-margin-symbols-alist '((insert . "┃") ;; Customize symbols for each change type.
                                  (delete . "-")
                                  (change . "┃")
                                  (unknown . "┆")
                                  (ignored . "i"))))


(use-package indent-guide
  :hook
  (prog-mode . indent-guide-mode)  ;; Activate indent-guide in programming modes.
  :config
  (setq indent-guide-char "│"))


(use-package lsp-ui)
(use-package treesit-auto
    :custom
    (treesit-auto-install 'prompt)
    :config
    (treesit-auto-add-to-auto-mode-alist 'all)
    (global-treesit-auto-mode))

(provide 'packages)
