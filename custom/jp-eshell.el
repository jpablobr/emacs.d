;;; -*- coding: utf-8-unix; -*-
;;; jp-eshell.el ---------------------------------------------------------
;;;

;;; ----------------------------------------------------------------------------
;;; - Manually set PATH for use by eshell
(when (string-match "jpablobr" (getenv "USER"))
(if (eq system-type 'gnu/linux)
    (progn
      (require 'rvm))
  (progn))

(setenv "EMACS_SHELL" "emacs")

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
                         "/home/jpablobr/bin/sh:"
                         "/home/jpablobr/bin/ruby:"
                         "/home/jpablobr/bin/python:"
                         "/home/jpablobr/bin/perl:"
                         "/usr/local/bin:"
                         "/usr/local/sbin:"
                         "/home/jpablobr/.rvm/bin:"
                         "/usr/bin:"
                         "/bin:"))
      (setenv "PATH" path)))))

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
             (local-set-key [(meta P)] 'mouse-buffer-menu)
             (local-set-key [(meta up)] 'beginning-of-buffer)))

(provide 'jp-eshell)