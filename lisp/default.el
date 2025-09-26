 (setq initial-scratch-message nil)
 (defun display-startup-echo-area-message ()
    (message ""))

 (defalias 'yes-or-no-p 'y-or-n-p)

 (set-charset-priority 'unicode)
 (setq locale-coding-system 'utf-8
        coding-system-for-read 'utf-8
        coding-system-for-write 'utf-8)
 (set-terminal-coding-system 'utf-8)
 (set-keyboard-coding-system 'utf-8)
 (set-selection-coding-system 'utf-8)
 (prefer-coding-system 'utf-8)
 (setq default-process-coding-system '(utf-8-unix . utf-8-unix))
 (setq-default tab-width 4)

 (set-face-attribute 'default nil 
    :font "Iosevka Nerd Font" 
    :height 160)

 (defun ab/enable-line-numbers ()
    "Enable relative line numbers"
    (interactive)
    (display-line-numbers-mode)
    (setq display-line-numbers 'relative))
 (add-hook 'prog-mode-hook #'ab/enable-line-numbers)

(setq electric-pair-mode t)
(setq auto-save-default nil)
(setq select-enable-clipboard t)
(setq save-interprogram-paste-before-kill t)

(provide 'default)
