(setq gc-cons-threshold #x40000000)
(setq read-process-output-max (* 1024 1024 4))

(setq user-emacs-directory (file-name-directory load-file-name))
(defvar user-cache-directory (concat user-emacs-directory "cache/"))
(add-to-list 'load-path "~/.config/emacs/lisp")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


(electric-pair-mode t)
(show-paren-mode 1)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(global-auto-revert-mode t)
(global-font-lock-mode t)
(winner-mode 1)

(setq auto-save-default nil)
(setq font-lock-maximum-decoration t)
(setq select-enable-clipboard t)
(setq save-interprogram-paste-before-kill t)

(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 120)

(setq package-enable-at-startup nil) ;; Disables the default package manager.
(setq straight-check-for-modifications nil)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package '(project :type built-in))
(straight-use-package 'use-package)

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package darcula-theme
  :ensure t
  :config
  (load-theme 'darcula t))

(use-package dired
  :ensure nil
  :custom
  (dired-listing-switches "-lah --group-directories-first")
  (dired-dwim-target t)
  (dired-guess-shell-alist-user
   '(("\\.\\(png\\|jpe?g\\|tiff\\)" "feh" "xdg-open" "open") ;; Open image files with `feh' or the default viewer.
     ("\\.\\(mp[34]\\|m4a\\|ogg\\|flac\\|webm\\|mkv\\)" "mpv" "xdg-open" "open") ;; Open audio and video files with `mpv'.
     (".*" "open" "xdg-open")))                              ;; Default opening command for other files.
  (dired-kill-when-opening-new-dired-buffer t) )

(use-package vc
  :ensure nil                        ;; This is built-in, no need to fetch it.
  :defer t
  :bind
  (("C-x v d" . vc-dir)              ;; Open VC directory for version control status.
   ("C-x v =" . vc-diff)             ;; Show differences for the current file.
   ("C-x v D" . vc-root-diff)        ;; Show differences for the entire repository.
   ("C-x v v" . vc-next-action))     ;; Perform the next version control action.
  :config
  ;; Better colors for <leader> g b  (blame file)
  (setq vc-annotate-color-map
        '((20 . "#f5e0dc")
          (40 . "#f2cdcd")
          (60 . "#f5c2e7")
          (80 . "#cba6f7")
          (100 . "#f38ba8")
          (120 . "#eba0ac")
          (140 . "#fab387")
          (160 . "#f9e2af")
          (180 . "#a6e3a1")
          (200 . "#94e2d5")
          (220 . "#89dceb")
          (240 . "#74c7ec")
          (260 . "#89b4fa")
          (280 . "#b4befe"))))

(use-package org
  :ensure nil
  :defer t)

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :init
  (vertico-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :init
  (marginalia-mode))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 0)
  (completion-styles '(basic)))


(use-package orderless
  :ensure t
  :straight t
  :defer t                                    ;; Load Orderless on demand.
  :after vertico                              ;; Ensure Vertico is loaded before Orderless.
  :init
  (setq completion-styles '(orderless basic)  ;; Set the completion styles.
        completion-category-defaults nil      ;; Clear default category settings.
        completion-category-overrides '((file (styles partial-completion))))) ;; Customize file completion styles.

(use-package magit
  :ensure t
)

(use-package meow
  :ensure t
  :demand t
  :config
  (require 'meow-config)
  (require 'keybinds)
  (meow-global-mode 1))

(use-package json)

(use-package lsp-mode
  :defer t
  :commands lsp)

(use-package darcula-theme
  :ensure t)

(defvar user-cache-directory (expand-file-name "cache/" user-emacs-directory))
(make-directory user-cache-directory t)

(use-package projectile
  :ensure t
  :straight t
  :demand t
  :init
  (setq projectile-project-search-path '("~/code"))
  ;; ensure projectile saves its files in a nice location
  (setq projectile-cache-file
        (concat user-cache-directory "projectile.cache"))
  (setq projectile-known-projects-file
        (concat user-cache-directory "projectile-bookmarks.eld"))
 
  :config
  (projectile-mode 1)
 (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (setq projectile-globally-ignored-file-suffixes
        '(
          ;; images
          ".png" ".xcf" ".jpg" ".jpeg" ".tif"
          ;; fonts
          ".ttf"
          ;; misc
          ".pdf"
          ))
  (setq projectile-indexing-method 'hybrid))

(use-package super-save
  :ensure t
  :config
  (super-save-mode +1))
