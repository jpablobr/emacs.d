;;; -*- coding: utf-8-unix; -*-
;;jp-eshell.el ---------------------------------------------------------
;;; - Making the defaults a bit saner
;;;

;;; ----------------------------------------------------------------------------
;;; - Manually set PATH for use by eshell
;;; - $JAVA_HOME
(when (string-match "jpablobr" (getenv "USER"))
(if (eq system-type 'gnu/linux)
    (progn
      (require 'rvm)
      ;; (rvm-use-default)
      )
  (progn))

(setenv "EMACS_SHELL" "emacs")

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
      (setq path (concat "/usr/local/mysql/bin:"
                         "/home/jpablobr/bin:"
                         "/usr/local/bin:"
                         "/usr/local/sbin:"
                         "/home/jpablobr/.rvm/bin:"
                         "/usr/bin:"
                         "/bin:"
                         "/home/jpablobr/.rvm/gems/ruby-1.9.2-p136/bin:"
                         "/home/jpablobr/.rvm/gems/ruby-1.9.2-p136@global/bin:"
                         gem-bin-path))
      (setenv "PATH" path)))))

(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

(autoload 'flymake-shell-load "flymake-shell" "On-the-fly syntax checking of shell scripts" t)
(add-hook 'sh-mode-hook 'flymake-shell-load)

;;; ----------------------------------------------------------------------------
;;; - Completions
;;;
(setq eshell-cmpl-cycle-completions nil
      eshell-save-history-on-exit t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

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
  '(lambda nil
     (local-set-key "\C-u" 'eshell-kill-input)
     (local-set-key [(meta P)] 'mouse-buffer-menu)
     (local-set-key [(meta up)] 'beginning-of-buffer)))

(setq eshell-prompt-function
      (lambda ()
        (concat (getenv "USER") "@"
                (car (split-string (getenv "HOSTNAME") "[.]"))
                (if (= (user-uid) 0) " # " " $ "))))

(provide 'jp-eshell)