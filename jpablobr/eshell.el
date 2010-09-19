;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Making the defaults a bit saner
;;;

;;; ----------------------------------------------------------------------------
;;; - Manually set PATH for use by eshell, rspec-mode, etc.
;;;
(let ((path))
  (setq path (concat "~/.gem/ruby/1.8/bin:"
                     "~/bin:"
                     "~/src/homebrew/bin:"
                     "/usr/local/bin:"
                     "/usr/bin:"
                     "/bin"))
  (setenv "PATH" path))

(setq eshell-cmpl-cycle-completions nil
      eshell-save-history-on-exit t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

(eval-after-load 'esh-opt
  '(progn
     (require 'em-prompt)
     (require 'em-term)
     (require 'em-cmpl)
     (require 'eshell-vc)
     (setenv "PAGER" "cat")
     (set-face-attribute 'eshell-prompt nil :foreground "turquoise1")
     (add-hook 'eshell-mode-hook ;; for some reason this needs to be a hook
	       '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-bol)))
     (add-to-list 'eshell-visual-commands "ssh")
     (add-to-list 'eshell-visual-commands "tail")
     (add-to-list 'eshell-command-completions-alist
                  '("gunzip" "gz\\'"))
     (add-to-list 'eshell-command-completions-alist
                  '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))
     (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)))

;;; ----------------------------------------------------------------------------
;;; - autocomplete
;;;
(setq eshell-cmpl-cycle-completions nil)
(setq eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

;;; ----------------------------------------------------------------------------
;;; - history
;;;
(setq eshell-save-history-on-exit t)

;;; ----------------------------------------------------------------------------
;;; - dont write over prompt
;;;
(setq comint-prompt-read-only)

;;; ----------------------------------------------------------------------------
;;; - scroll to bottom on output, more like a terminal
;;;
(setq eshell-scroll-to-bottom-on-output t)
(setq eshell-scroll-show-maximum-output t)

;;; ----------------------------------------------------------------------------
;;; - colorful shell
;;;
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; ----------------------------------------------------------------------------
;;; - escape the shell
;;;
(add-hook 'eshell-mode-hook
  '(lambda nil (local-set-key "\C-u" 'eshell-kill-input)))

;;; ----------------------------------------------------------------------------
;;; - provides 'clear' command
;;;
(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(provide 'eshell)