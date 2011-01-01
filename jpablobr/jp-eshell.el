;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Making the defaults a bit saner
;;;

;;; ----------------------------------------------------------------------------
;;; - Manually set PATH for use by eshell
;;; - $JAVA_HOME
(setq gem-bin-path (when (string-match "@global" (getenv "GEM_PATH"))
  (replace-match "/bin" nil nil (getenv "GEM_PATH"))))

(if (eq system-type 'windows-nt)
    (progn
      (let ((JAVA_HOME))
        (setq path (concat "C:\j2sdk1.6.0_16"))
        (setenv "JAVA_HOME" path)))
  (progn
    (let ((JAVA_HOME))
      (setq path (concat "/usr/lib/jvm/java-6-sun"))
      (setenv "JAVA_HOME" path))
    (let ((path))
      (setq path (concat ".:"
                         "/usr/local/mysql/bin:"
                         "/home/jpablobr/bin:"
                         "/usr/local/bin:"
                         "/usr/local/sbin:"
                         "/home/jpablobr/.rvm/bin:"
                         "/usr/bin:"
                         "/bin:"
                         "/home/jpablobr/.rvm/gems/ruby-1.9.2-p136@global/bin:"
                         gem-bin-path))
      (setenv "PATH" path))))

;;; ----------------------------------------------------------------------------
;;; - Completions
;;;
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
	       '(lambda ()
              (define-key eshell-mode-map "\C-a" 'eshell-bol)))
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

(auto-complete-mode 0)

(provide 'jp-eshell)
