;; - Autosave dir
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

;;; ----------------------------------------------------------------------------
;;; - backups dir
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;; we speak utf-8 here
(prefer-coding-system 'utf-8)
(if (not (assoc "UTF-8" language-info-alist))
    (set-language-environment "utf-8")
  (set-language-environment "utf-8")
  (set-keyboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (prefer-coding-system 'utf-8))

;; Helpers
(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(custom-set-variables '(vc-follow-symlinks t))
(tool-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode 1)
(column-number-mode t)
(set-scroll-bar-mode 0)
(global-hl-line-mode t)
(line-number-mode t)
(transient-mark-mode t)
(global-font-lock-mode t)
(recentf-mode t)
(auto-compression-mode t)
(setq truncate-partial-width-windows 0)
(setq uniquify-buffer-name-style 'forward)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq save-place-file (concat dotfiles-dir "places"))
(setq visible-bell t)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-message t)
(setq blink-cursor t)
(setq font-lock-maximum-decoration t)
(setq font-lock-maximum-size 512000)
(setq tab-width 2)
(setq default-tab-width 2)
(setq delete-selection-mode t)
(setq delete-by-moving-to-trash t)
(setq shift-select-mode nil)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(add-to-list 'load-path (concat misc-dir "/cheat-fu-mode"))
(add-to-list 'load-path (concat misc-dir "/emacs-w3m"))

;;; Stuff to run only on window systems.
(when window-system
  (load-file (concat misc-dir "/mmm-mode/mmm-mode.el"))
  ;;----------------------------------------------------------------------
  ;; - Multiple major modes
  (require 'mmm-auto)
  (setq mmm-global-mode 'buffers-with-submode-classes)
  (setq mmm-submode-decoration-level 2)

  (mouse-wheel-mode t)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1));;; - when window-system

;; ---------------------------------------------------------------------
;; - Highlighting
(require 'highlight-parentheses)
(require 'highlight-symbol)

;; ---------------------------------------------------------------------
;; - Cheat-fu
(require 'cheat-fu)
(setq cheat-fu-root "/home/jpablobr/.cheat_fu_sheets/")

;; --------------------------------------------------------------------
;; - Textmate
(require 'textmate)
(textmate-mode)

;; - mode-compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

;; ---------------------------------------------------------------------
;; - CUA enhanced functionality for the standard emacs bindings
(cua-mode 'emacs)
(setq CUA-mode-normal-cursor-color "red")
(setq CUA-mode-overwrite-cursor-color "yellow")
(setq CUA-mode-read-only-cursor-color "green")

;; ---------------------------------------------------------------------
;; - xclip - for kill/yank from terminal.
(require 'xclip)
(turn-on-xclip)

;; ---------------------------------------------------------------------
;; - Regex builder
(require 're-builder)
(setq reb-re-syntax 'string)

;; ---------------------------------------------------------------------
;; emacs hacks/workarounds
(setq warning-suppress-types nil)
(setq org-directory nil)

;; ---------------------------------------------------------------------
;; General
(require 'autopair)
(add-hook 'emacs-lisp-mode-hook       #'(lambda () (autopair-mode)))
(add-hook 'lisp-mode-hook             #'(lambda () (autopair-mode)))
(add-hook 'lisp-interaction-mode-hook #'(lambda () (autopair-mode)))
(add-hook 'scheme-mode-hook           #'(lambda () (autopair-mode)))
(add-hook 'ruby-mode-hook             #'(lambda () (autopair-mode)))

(require 'isearch+)
(add-hook 'isearch-mode-hook
          '(lambda ()
             (define-key isearch-mode-map "\M-i" 'isearch-repeat-forward)))

(require 'deft)
(require 'cheat-fu-deft)
(autoload 'change-case "change-case" t)

(setq uniquify-buffer-name-style 'forward)
(require 'uniquify)

(setq recentf-auto-cleanup 'never)

(autoload 'xrdb-mode "xrdb-mode" "Mode for editing X resource files" t)

(setq auto-mode-alist
      (append '(("\\.Xdefaults$"    . xrdb-mode)
                ("\\.Xenvironment$" . xrdb-mode)
                ("\\.xrdb$"         . xrdb-mode)
                ("\\.Xresources$"   . xrdb-mode)
                ("*.\\.ad$"         . xrdb-mode)
                )
              auto-mode-alist))

(custom-set-faces
 '(hl-line ((t (:background "#4f4f4f"))))
 '(isearch ((((class color) (min-colors 8)) (:background "green" :foreground "black")))))

;; (setq debug-on-error t)

(provide 'jp-misc)