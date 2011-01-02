;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
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

;;; ---------------------------------------------------------
;;; - Browser
;;;
;; (setq browse-url-browser-function 'browse-url-firefox)
;; (setq browse-url-browser-function 'browse-default-macosx-browser)
;; (setq browse-url-browser-function 'browse-default-windows-browser)
;; (setq browse-url-browser-function 'browse-default-kde)
;; (setq browse-url-browser-function 'browse-default-epiphany)
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "~/src/conkeror/conkeror")
(setq browse-url-browser-function 'browse-default-w3m)
;;; ----------------------------------------------------------------------------
;;; - Custom Configs
;;;

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
;;(menu-bar-mode -1)

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

;;; ---------------------------------------------------------
;;; - ido-mode is like magic pixie dust!
;;;
(when (> emacs-major-version 21)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point t
        ido-max-prospects 10))

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(defalias 'yes-or-no-p 'y-or-n-p)
(random t) ;; Seed the random-number generator

;;; ---------------------------------------------------------
;;; - Don't clutter up directories with files~
;;;
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

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
(global-linum-mode)
(setq line-number-mode t)
(setq column-number-mode t)

;;; ---------------------------------------------------------
;;; - insert date into buffer at point
;;; - optained from http://www.chrislott.org/geek/emacs/dotemacs.html
;;;
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%a %Y-%m-%d - %l:%M %p")))

;;; ---------------------------------------------------------
;;; - Kills live buffers, leaves some emacs work buffers
;;; - optained from http://www.chrislott.org/geek/emacs/dotemacs.html
;;;
(defun nuke-some-buffers (&optional list)
  "For each buffer in LIST, kill it silently if unmodified. Otherwise ask.
LIST defaults to all existing live buffers."
  (interactive)
  (if (null list)
      (setq list (buffer-list)))
  (while list
    (let* ((buffer (car list))
           (name (buffer-name buffer)))
      (and (not (string-equal name ""))
           ;(not (string-equal name "*Messages*"))
          ;; (not (string-equal name "*Buffer List*"))
           ;(not (string-equal name "*buffer-selection*"))
           ;(not (string-equal name "*Shell Command Output*"))
           (not (string-equal name "*scratch*"))
           (/= (aref name 0) ? )
           (if (buffer-modified-p buffer)
               (if (yes-or-no-p
                    (format "Buffer %s has been edited. Kill? " name))
                   (kill-buffer buffer))
             (kill-buffer buffer))))
    (setq list (cdr list))))

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
(add-to-list 'load-path (concat vendor-dir "/dosbat"))
(require 'dosbat)
(add-to-list 'auto-mode-alist '("\\.bat$" . bat-mode))

;;; ---------------------------------------------------------
;;; - Find-recursive
;;;
(require 'find-recursive)

;;; ----------------------------------------------------------------------------
;;; - zsh
;;;
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(setq initial-scratch-message "")

;;; ----------------------------------------------------------------------------
;;; - Coffeescript mode
;;;
(add-to-list 'load-path (concat vendor-dir "/coffee-mode"))
(require 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"

  (imenu-add-to-menubar "IMENU")

  ;; CoffeeScript uses two spaces.
  (set (make-local-variable 'tab-width) 2)

  ;; If you don't want your compiled files to be wrapped
  (setq coffee-args-compile '("-c" "--bare"))

  ;; *Messages* spam
  (setq coffee-debug-mode t)

  ;; Emacs key binding
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
  (define-key coffee-mode-map [(meta R)] 'coffee-compile-region)

  ;; Compile '.coffee' files on every save
  (add-hook 'after-save-hook
      '(lambda ()
         (when (string-match "\.coffee$" (buffer-name))
          (coffee-compile-file)))))

(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))

;;; ----------------------------------------------------------------------------
;;; - temp - tests
;;;
;; (setq debug-on-error 0)
;; (setq debug-on-error nil)
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")
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
 '(w3m-arrived-file "~/Dropbox/.w3m/.arrived")
 '(w3m-bookmark-file "~/Dropbox/.w3m/bookmark.html")
 '(w3m-default-save-directory "~/Dropbox/.w3m")
 '(w3m-form-textarea-directory "~/Dropbox/.w3m/.textarea")
 '(w3m-profile-directory "~/Dropbox/.w3m")
 '(w3m-session-file "~/Dropbox/.w3m/.sessions")
 '(fill-column 80)
 '(font-lock-mode-maximum-decoration t)
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(scroll-preserve-screen-position t))

 (require 'ansi-color)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'ri-mode-hook 'ansi-color-for-comint-mode-on)

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'ri-filter-hook 'colorize-compilation-buffer)

(provide 'jp-misc)