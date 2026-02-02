(use-package eglot
  :ensure nil
  :defer t
  :init
  (setq eglot-sync-connect 1)
  :hook
  ((python-base-mode . eglot-ensure)
   (go-ts-mode . eglot-ensure))
  
  :config
  (add-to-list 'eglot-server-programs
               '(python-base-mode
                 . ("ruff" "server")))
  (add-to-list 'eglot-server-programs '(go-ts-mode . ("gopls")))
  (add-to-list 'eglot-server-programs
               '((rustic-mode rust-ts-mode) . ("rust-analyzer" :initializationOptions (:checkOnSave (:command "clippy")))))

  )

(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
(add-to-list 'auto-mode-alist '("/go\\.mod\\'" . go-mod-ts-mode))

(provide 'lsp)
