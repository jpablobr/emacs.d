;; jp-meta.el ---------------------------------------------------------
;; ------------------------------------------------------------------
;; - Autosave dir
;; - Save backups in one place
;; - Put autosave files (ie #foo#) in one place, *not*
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

;; (defun make-auto-save-file-name ()
;;   (concat autosave-dir
;;           (if buffer-file-name
;;               (concat "#" (file-name-nondirectory buffer-file-name) "#")
;;             (expand-file-name
;;              (concat "#%" (buffer-name) "#")))))

;;; ----------------------------------------------------------------------------
;;; - backups dir
;;; - Put backup files (ie foo~) in one place too. (The backup-directory-alist
;;; - list contains regexp=>directory mappings; filenames matching a regexp are
;;; - backed up in the corresponding directory. Emacs will mkdir it if
;;; - necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;; we speak utf-8 here
(prefer-coding-system 'latin-1)
(if (not (assoc "UTF-8" language-info-alist))
    (set-language-environment "latin-1")
  (set-language-environment "utf-8")
  (set-keyboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (prefer-coding-system 'utf-8))

;; Helpers
(setq tab-width 2)
(show-paren-mode 1)
(setq line-number-mode t)
(delete-selection-mode 1)
(setq default-tab-width 2)
(setq column-number-mode t)
(global-hl-line-mode)
(tool-bar-mode 0)
(menu-bar-mode 0)
(transient-mark-mode t)
(set-scroll-bar-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(custom-set-variables
'(vc-follow-symlinks t))

(provide 'jp-meta)
