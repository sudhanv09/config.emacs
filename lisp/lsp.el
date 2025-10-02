(use-package lsp-mode
  :commands (lsp lsp-deferred)
  
  :init
  (setq lsp-keymap-prefix "C-c l")

  :hook
  ;; Language-specific hooks
  ((js-mode typescript-mode typescript-ts-mode js-ts-mode) . lsp-deferred)
  ((html-mode mhtml-mode) . lsp-deferred)
  (css-mode . lsp-deferred)
  ((python-mode python-ts-mode) . lsp-deferred)
  (nim-mode . lsp-deferred)

  (lsp-mode . lsp-enable-which-key-integration)
  
  :custom
  (lsp-idle-delay 0.5)
  (lsp-log-io nil)
  (lsp-completion-provider :none)
  (lsp-headerline-breadcrumb-enable nil)

  :config
  (add-hook 'lsp-completion-mode-hook
            (lambda ()
              (setq-local completion-category-defaults
                          (assoc-delete-all 'lsp-capf completion-category-defaults))))
  
  
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection (lambda () (list "ruff" "server")))
    :activation-fn (lsp-activate-on "python")
    :priority 2
    :server-id 'ruff)))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-delay 0.5)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-code-actions t))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

(provide 'lsp-config)
