;;; -*- coding: utf-8-unix; -*-

(require 'rvm)
(require 'ansi-color)

;; Flymake
(require 'flymake-shell)
(add-hook 'sh-mode-hook 'flymake-shell-load)
(add-hook 'shell-script-mode-hook 'flymake-shell-load)

;;; ----------------------------------------------------------------------------
;;; - Completions
;;;
(setq shell-cmpl-cycle-completions nil
      shell-save-history-on-exit t
      shell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

;;; ----------------------------------------------------------------------------
;;; - escape the shell
;;;
(add-hook 'shell-mode-hook
          '(lambda nil
             (setq comint-prompt-read-only)
             (rvm-activate-corresponding-ruby)
             (ansi-color-for-comint-mode-on)
             (setq show-trailing-whitespace nil)))

(add-hook 'shell-filter-hook 'colorize-compilation-buffer)

(provide 'jp-eshell)