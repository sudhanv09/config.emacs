(use-package which-key
  :init
  (which-key-mode))

(use-package easysession
  :ensure t
  :init
  (add-hook 'emacs-startup-hook #'easysession-save-mode 103))


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

(use-package consult
  :ensure t
  :bind
  (("C-x b" . consult-buffer)
   ("M-y"   . consult-yank-pop)

   ;; Searching
   ("M-s l" . consult-line)
   ("M-s g" . consult-ripgrep)
   ("M-s i" . consult-imenu)

   ;; Navigation
   ("M-g g" . consult-goto-line)
   ("M-g o" . consult-outline)))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :ensure t
  :after (embark consult))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles basic partial-completion)))))

(use-package nerd-icons-corfu
  :ensure t)

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2)
  (completion-styles '(flex basic)))

(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-symbol))

(use-package transient
  :ensure t)

(use-package magit
  :ensure t
  :after transient
  :bind (("C-c g" . magit-status)))

(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode +1))

(use-package highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character)
  :hook
  (add-hook 'prog-mode 'highlight-indent-guides-mode))

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(use-package dashboard
  :ensure t
  :config
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (dashboard-setup-startup-hook))

(provide 'packages)
