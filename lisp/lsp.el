(use-package eglot
  :ensure nil
  :defer t
  :init
  (setq eglot-sync-connect nil)
  (defun my/python-eglot-maybe ()
    "Start Eglot if ruff is available."
    (when (executable-find "ty")
      (eglot-ensure)))
  (add-hook 'python-mode-hook #'my/python-eglot-maybe)
  :config
  (add-to-list 'eglot-server-programs
             '(python-mode
               . (("ty" "server")
                  ("ruff" "server")
                  )))
)

(provide 'lsp)
