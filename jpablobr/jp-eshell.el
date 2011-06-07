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
      (rvm-use-default))
  (progn))

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

(eval-after-load 'esh-opt
  '(progn
     (require 'em-prompt)
     (require 'em-term)
     (require 'em-cmpl)
     (require 'eshell-vc)
     (setenv "PAGER" "less")
     (setenv "GEM_EDITOR" "emacsclient")
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

;;; ----------------------------------------------------------------------------
;;; - provides 'clear' command
;;;
(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(eval-after-load "tramp"
  '(progn
     (defvar sudo-tramp-prefix
       "/sudo::"
       (concat "Prefix to be used by sudo commands when building tramp path "))

     (defun sudo-file-name (filename) (concat sudo-tramp-prefix filename))

     (defun sudo-find-file (filename &optional wildcards)
       "Calls find-file with filename with sudo-tramp-prefix prepended"
       (interactive "fFind file with sudo ")
       (let ((sudo-name (sudo-file-name filename)))
         (apply 'find-file
                (cons sudo-name (if (boundp 'wildcards) '(wildcards))))))

     (defun sudo-reopen-file ()
       "Reopen file as root by prefixing its name with sudo-tramp-prefix and by clearing buffer-read-only"
       (interactive)
       (let*
           ((file-name (expand-file-name buffer-file-name))
            (sudo-name (sudo-file-name file-name)))
         (progn
           (setq buffer-file-name sudo-name)
           (rename-buffer sudo-name)
           (setq buffer-read-only nil)
           (message (concat "Set file name to " sudo-name)))))))

(setq eshell-prompt-function
      (lambda ()
        (concat (getenv "USER") "@"
                (car (split-string (getenv "HOSTNAME") "[.]"))
                (if (= (user-uid) 0) " # " " $ "))))

(provide 'jp-eshell)