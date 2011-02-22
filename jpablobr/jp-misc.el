 ;;; -*- coding: utf-8-unix; -*-
;;jp-misc.el ---------------------------------------------------------
;;; - Things that don't fit anywhere else
;;;
(add-to-list 'load-path (concat misc-dir "/maxframe"))
(add-to-list 'load-path (concat misc-dir "/ultratex-0.80/lisp"))
(add-to-list 'load-path (concat misc-dir "/icicles"))
(add-to-list 'load-path (concat misc-dir "/yac-mode"))
(add-to-list 'load-path (concat misc-dir "/emacs-w3m"))

;; Git
(setq git-dir (concat vendor-dir "/git"))
(add-to-list 'load-path git-dir)
(add-to-list 'load-path (concat git-dir "/magit"))

(require 'magit)
(require 'gist)
(setq gist-view-gist t)
(setq gist-use-curl t)

(require 'diff-mode-)

(when window-system
  (mouse-wheel-mode t)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1))

(setq visible-bell t
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      delete-by-moving-to-trash t
      shift-select-mode nil
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat dotfiles-dir "places"))

;;; Ultratex settings
(require 'light)
(require 'ultex-setup)

;;; - Smoother scrolling
(setq
 scroll-margin 0
  scroll-conservatively 100000
  scroll-preserve-screen-position 1)
  (put 'scroll-left 'disabled nil)

;;; - Transparently open compressed files
(auto-compression-mode t)

;;; - Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;;; - X11 Copy & Paste to/from Emacs
(setq x-select-enable-clipboard t) ; as above
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;; - Save a list of recent files visited.
(recentf-mode 1)

;;; - Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;;; - Hippie expand: at times perhaps too hip
(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)

;;; ----------------------------------------------------------------------------
;;; - Whitespace mode
;;; - http://xahlee.org/emacs/whitespace-mode.html
(global-whitespace-mode 1)
(setq whitespace-style '(trailing))

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)

(defalias 'yes-or-no-p 'y-or-n-p)
(random t) ;; Seed the random-number generator

;;; ---------------------------------------------------------
;;; - Cosmetics
;;;
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;;; ---------------------------------------------------------
;;; - linu and column default counters
;;;
(require 'linum)
;; (global-linum-mode)
(setq line-number-mode t)
(setq column-number-mode t)

;;; ----------------------------------------------------------
;;; - Grep edit
;;;
(require 'grep-edit)

;;; ---------------------------------------------------------
;;; - Textmate
;;;
(require 'textmate)
(textmate-mode)

;;; ---------------------------------------------------------
;;; -Redo
;;;
(require 'redo)
(global-set-key [(control -)] 'redo)

;;; ---------------------------------------------------------
;;; - Windows dotbat batch files mode
;;;
;; (add-to-list 'load-path (concat vendor-dir "/dosbat"))
;; (require 'dosbat)
;; (add-to-list 'auto-mode-alist '("\\.bat$" . bat-mode))

;;; ---------------------------------------------------------
;;; - Find-recursive
;;;
 (require 'find-recursive)

;;; ----------------------------------------------------------------------------
;;; - Dictionary
;;; - % sudo apt-get install dictionary-el
;;;
(autoload 'dictionary-search "dictionary"
  "Ask for a word and search it in all dictionaries" t)
(autoload 'dictionary-match-words "dictionary"
  "Ask for a word and search all matching words in the dictionaries" t)
(autoload 'dictionary-lookup-definition "dictionary"
  "Unconditionally lookup the word at point." t)
(autoload 'dictionary "dictionary"
  "Create a new dictionary buffer" t)
(autoload 'dictionary-mouse-popup-matching-words "dictionary"
  "Display entries matching the word at the cursor" t)
(autoload 'dictionary-popup-matching-words "dictionary"
  "Display entries matching the word at the point" t)
(autoload 'dictionary-tooltip-mode "dictionary"
  "Display tooltips for the current word" t)
(autoload 'global-dictionary-tooltip-mode "dictionary"
  "Enable/disable dictionary-tooltip-mode for all buffers" t)

;;; ----------------------------------------------------------------------------
;;; - Global custom variables
;;;
(custom-set-variables
 '(user-full-name '"José Pablo Barrantes R.")
 '(user-mail-address '"xjpablobrx@gmail.com")
 '(user-details '"José Pablo Barrantes R. http://jpablobr.com")
 '(user-login-name "jpablobr")
 '(github-user "jpablobr")
 '(w3m-arrived-file "~/Dropbox/private-dotfiles/w3m/.arrived")
 '(w3m-bookmark-file "~/Dropbox/private-dotfiles/w3m/bookmark.html")
 '(w3m-default-save-directory "~/Dropbox/private-dotfiles/w3m")
 '(w3m-form-textarea-directory "~/Dropbox/private-dotfiles/w3m/.textarea")
 '(w3m-profile-directory "~/Dropbox/private-dotfiles/w3m")
 '(w3m-session-file "~/Dropbox/private-dotfiles/w3m/.sessions")
 '(fill-column 80)
 '(font-lock-mode-maximum-decoration t)
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(scroll-preserve-screen-position t))

(require 'template)
(template-initialize)

(defface egoge-display-time
  '((((type x w32 mac))
     ;; #060525 is the background colour of my default face.
     (:foreground "green" :inherit bold))
    (((type tty))
     (:foreground "green")))
  "Face used to display the time in the mode line.")

;; This causes the current time in the mode line to be displayed in
;; `egoge-display-time-face' to make it stand out visually.
(setq display-time-string-forms
      '((propertize (concat " " 12-hours ":" minutes " ")
                    'face 'egoge-display-time)))

(display-time-mode t)

(require 'sudo-save)

;;mode-compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

;; Chrome emacs edit
;; (require 'edit-server)
;; (edit-server-start)
;; (if (locate-library "edit-server")
;;     (progn
;;       (require 'edit-server)
;;       (setq edit-server-new-frame nil)
;;       (edit-server-start)))

;;; ----------------------------------------------------------------------------
;;; - header2
;;;
(require 'header2)
(add-hook 'write-file-hooks 'auto-update-file-header)
(add-hook 'emacs-lisp-mode-hook 'auto-make-header)
(add-hook 'c-mode-common-hook   'auto-make-header)
(add-hook 'ruby-mode-common-hook   'auto-make-header)
(add-hook 'perl-mode-common-hook   'auto-make-header)
(add-hook 'sh-mode-common-hook   'auto-make-header)

;;; ----------------------------------------------------------------------------
;;; - CUA enhanced functionality for the standard emacs bindings
(cua-mode 'emacs)
(setq CUA-mode-normal-cursor-color "red")
(setq CUA-mode-overwrite-cursor-color "yellow")
(setq CUA-mode-read-only-cursor-color "green")

;;; Icicles
(require 'icicles)
(icy-mode t)

(provide 'jp-misc)
