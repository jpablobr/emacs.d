;;; -*- coding: utf-8-unix; -*-

(require 'rvm)

(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")
(autoload 'flymake-shell-load "flymake-shell" "On-the-fly syntax checking of shell scripts" t)
(add-hook 'sh-mode-hook 'flymake-shell-load)

;;; ----------------------------------------------------------------------------
;;; - Completions
;;;
(setq shell-cmpl-cycle-completions nil
      shell-save-history-on-exit t
      shell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

;;; ----------------------------------------------------------------------------
;;; - colorful shell
;;;
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; ----------------------------------------------------------------------------
;;; - escape the shell
;;;
(add-hook 'shell-mode-hook
          '(lambda nil
             (setq comint-prompt-read-only)
             (rvm-activate-corresponding-ruby)
             (setq test-failure "red" )
             (setq show-trailing-whitespace nil)
             (local-set-key [(meta P)] 'mouse-buffer-menu)
             (local-set-key [(meta up)] 'beginning-of-buffer)))

(add-hook 'shell-filter-hook 'colorize-compilation-buffer)

(provide 'jp-eshell)