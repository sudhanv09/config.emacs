(setq package-enable-at-startup nil)
(setq package-install-upgrade-built-in t)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq user-emacs-directory (expand-file-name "~/.config/emacs/"))
(defconst emacs-data-dir  (expand-file-name "~/.local/share/emacs/"))
(defconst emacs-cache-dir (expand-file-name "~/.cache/emacs/"))
(setq package-user-dir
      (expand-file-name "elpa/" emacs-data-dir))
(setq package-gnupghome-dir
      (expand-file-name "gnupg/" emacs-data-dir))

(setq
 native-comp-eln-load-path
  (list (expand-file-name "eln-cache/" emacs-cache-dir))

 backup-directory-alist
  `(("." . ,(expand-file-name "backups/" emacs-cache-dir)))
 
  auto-save-list-file-prefix
        (expand-file-name "auto-save-list/.saves-"
                          emacs-cache-dir)
 auto-save-file-name-transforms
 `((".*" ,(expand-file-name "auto-save/" emacs-cache-dir) t)))

;; GC tuning for startup
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))))

(setq savehist-file (expand-file-name "savehist" emacs-data-dir))
(savehist-mode)

(setq recentf-save-file (expand-file-name "recentf" emacs-data-dir))
(recentf-mode)

(setq bookmark-default-file
      (expand-file-name "bookmarks" emacs-data-dir))
