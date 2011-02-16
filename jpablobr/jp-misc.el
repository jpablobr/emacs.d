 ;;; -*- coding: utf-8-unix; -*-
;;jp-misc.el ---------------------------------------------------------
;;; - Things that don't fit anywhere else
;;;
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
      whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      oddmuse-directory (concat dotfiles-dir "oddmuse")
      save-place-file (concat dotfiles-dir "places"))

;;; ----------------------------------------------------------------------------
;;; - Git Blame
;; (autoload 'git-blame-mode "git-blame"
  ;; "Minor mode for incremental blame for Git.")

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

;;; - Menu bar settings
(menu-bar-mode -1)

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
;;; -  make whitespace-mode use “¶” for newline and “▷” for tab.
;;;
(global-whitespace-mode 1)
(setq whitespace-display-mappings '(
   (space-mark 32 [183] [46]) ; normal space
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [182 10]) ; newlne
   (tab-mark 9 [9655 9] [92 9])))

   (setq whitespace-line 'underline)

;;; ---------------------------------------------------------
;;; - ido-mode is like magic pixie dust!
;;;
;; (when (> emacs-major-version 21)
;;   (ido-mode t)
;;   (setq ido-enable-prefix nil
;;         ido-enable-flex-matching t
;;         ido-create-new-buffer 'always
;;         ido-use-filename-at-point t
;;         ido-max-prospects 10))

;; (set-default 'indent-tabs-mode nil)
;; (set-default 'indicate-empty-lines t)
;; (set-default 'imenu-auto-rescan t)

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

;;; ----------------------------------------------------------------------------
;;; - Mathematica
;;;
;; (autoload 'mma-mode "mma.el" "Mathematica package file mode" t)
;; (setq auto-mode-alist
;;       (cons '("\\.m\\'" . mma-mode) auto-mode-alist))
;; (load-library "mathematica")
;; (setq mathematica-never-start-kernel-with-mode t)
;; (setq auto-mode-alist
;;       (cons '("\\.m\\'" . mathematica-mode) auto-mode-alist))

;;; ----------------------------------------------------------
;;; - Grep edit
;;;
(require 'grep-edit)

;;; ---------------------------------------------------------
;;; - Textmate
;;;
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)

;;; ---------------------------------------------------------
;;; - IRC
;;;
(require 'erc)
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#github" "#greasemonkey" "#emacs" "#heroku" "#sinatra")))

;;; ---------------------------------------------------------
;;; - Cheat
;;;
(add-to-list 'auto-mode-alist '("\\.cheat$" . cheat))

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
;; (require 'find-recursive)

;;; ----------------------------------------------------------------------------
;;; - Coffeescript mode
;;;
;; (add-to-list 'load-path (concat vendor-dir "/coffee-mode"))
;; (require 'coffee-mode)

;; (defun coffee-custom ()
;;   "coffee-mode-hook"

;;   (imenu-add-to-menubar "IMENU")

;;   ;; CoffeeScript uses two spaces.
;;   (set (make-local-variable 'tab-width) 2)

;;   ;; If you don't want your compiled files to be wrapped
;;   (setq coffee-args-compile '("-c" "--bare"))

;;   ;; *Messages* spam
;;   (setq coffee-debug-mode t)

;;   ;; Emacs key binding
;;   (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
;;   (define-key coffee-mode-map [(meta R)] 'coffee-compile-region)

;;   ;; Compile '.coffee' files on every save
;;   (add-hook 'after-save-hook
;;       '(lambda ()
;;          (when (string-match "\.coffee$" (buffer-name))
;;           (coffee-compile-file)))))

;; (add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))

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

(require 'gist)
(setq gist-view-gist t)
(setq gist-use-curl t)

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
(require 'edit-server)
(edit-server-start)
(if (locate-library "edit-server")
    (progn
      (require 'edit-server)
      (setq edit-server-new-frame nil)
      (edit-server-start)))

(setq load-path (cons "~/.emacs.d/vendor/ultratex-0.80/lisp"
                      load-path))

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

(require 'light)
(require 'ultex-setup)

(add-to-list 'load-path "~/.emacs.d/vendor/yac-mode")
(require 'yac)

(add-to-list 'load-path "~/.emacs.d/vendor/icicles")
(require 'icicles)
(icy-mode 1)

(require 'less)
(provide 'jp-misc)
