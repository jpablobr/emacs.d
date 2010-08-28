;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Meta
;;;

;;; ----------------------------------------------------------------------------
;;; - Autosave dir
;;; - Save backups in one place
;;; - Put autosave files (ie #foo#) in one place, *not*
;;; - scattered all over the file system!
;;;
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))

;;; ----------------------------------------------------------------------------
;;; - backups dir
;;; - Put backup files (ie foo~) in one place too. (The backup-directory-alist
;;; - list contains regexp=>directory mappings; filenames matching a regexp are
;;; - backed up in the corresponding directory. Emacs will mkdir it if
;;; - necessary.)
;;;
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;;; ----------------------------------------------------------------------------
;;; - White spaces
;;;
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq default-tab-width 4)
(setq tab-width 4)

;;; ----------------------------------------------------------------------------
;;; - Makes load time faster.
;;;
(defun byte-recompile-home ()
  (interactive)
  (byte-recompile-directory "~/.emacs.d" 0))

;;; ----------------------------------------------------------------------------
;;; - Full screen toggle
;;;
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))
(global-set-key (kbd "M-`") 'toggle-fullscreen)

(defun recenter-to-top ()
  "Take the current point and scroll it to within a
   few lines of the top of the screen."
  (interactive)
  (recenter 3))
(global-set-key [(control shift l)] 'recenter-to-top)

(prefer-coding-system 'utf-8)

(server-start)

(require 'line-num)

(provide 'meta)
