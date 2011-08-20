;; jp-misc.el ---------------------------------------------------------
;; - Things that don't fit anywhere else
(require 'thingatpt)
(require 'imenu)

(add-to-list 'load-path (concat misc-dir "/icicles"))
(add-to-list 'load-path (concat misc-dir "/cheat-fu-mode"))
(add-to-list 'load-path (concat misc-dir "/emacs-w3m"))

;;; Stuff to run only on window systems.
(when window-system
  (add-to-list 'load-path (concat misc-dir "/maxframe"))
  (add-to-list 'load-path (concat misc-dir "/mmm-mode"))

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
;; - Git
(setq git-dir (concat vendor-dir "/git"))
(add-to-list 'load-path git-dir)
(add-to-list 'load-path (concat git-dir "/magit"))

(require 'magit)
(require 'gist)
(setq gist-view-gist t)
(setq gist-use-curl t)

(require 'diff-mode-)

;; ---------------------------------------------------------------------
;; - Highlighting
(require 'highlight-parentheses)
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)
(global-set-key [(control meta f3)] 'highlight-symbol-query-replace)

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

;; - Smoother scrolling
(setq
 scroll-margin 0
  scroll-conservatively 100000
  scroll-preserve-screen-position 1)
  (put 'scroll-left 'disabled nil)

;; - Transparently open compressed files
(auto-compression-mode t)

;; - Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; - X11 Copy & Paste to/from Emacs
(setq x-select-enable-clipboard t) ; as above
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; - Save a list of recent files visited.
(recentf-mode 1)

;; - Hippie expand: at times perhaps too hip
(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)

;; --------------------------------------------------------------------
;; - Cosmetics
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; --------------------------------------------------------------------
;; - Autopair edit
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers
(setq autopair-autowrap t)

;; ---------------------------------------------------------------------
;; - Cheat-fu
(require 'cheat-fu)
(setq cheat-fu-root "/home/jpablobr/.cheat_fu_sheets/")

;; --------------------------------------------------------------------
;; - Textmate
(require 'textmate)
(textmate-mode)

;; --------------------------------------------------------------------
;; - Find-recursive
 (require 'find-recursive)

;; --------------------------------------------------------------------
;; - Dictionary
;; - % sudo apt-get install dictionary-el
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

;; ---------------------------------------------------------------------
;; - Display time
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

;; ---------------------------------------------------------------------
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
;; - Icicles
(require 'icicles)
(icy-mode t)

;; ---------------------------------------------------------------------
;; - Word Count
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)

;; ---------------------------------------------------------------------
;; - xclip - for kill/yank from terminal, awesomeness! ;)
(require 'xclip)
(turn-on-xclip)

;; ---------------------------------------------------------------------
;; - Auto fill
(add-hook 'org-mode-hook
          '(lambda ()
             (turn-on-auto-fill)
             (auto-fill-mode 1)))

;; ---------------------------------------------------------------------
;; - White-space builder
(global-whitespace-mode 1)
(setq whitespace-style '(trailing))
(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)

;; ---------------------------------------------------------------------
;; - Regex builder
(require 're-builder)
(setq reb-re-syntax 'string)

;; ---------------------------------------------------------------------
;; - ERC
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#beginrescueend" "#emacs" "#bash")))

;; ---------------------------------------------------------------------
;; like aliases ;)
(defun pm  () "Abbreviation for Perl-Mode" (interactive) (perl-mode))
(defun rm  () "Abbreviation for Ruby-Mode" (interactive) (ruby-mode))

;; ---------------------------------------------------------------------
;; emacs hacks/workarounds
(setq warning-suppress-types nil)

;; ---------------------------------------------------------------------
;; - Anything
(load-file (concat misc-dir "/anything-match-plugin.el"))
(require 'anything-match-plugin)
(require 'anything-config)
(require 'anything-etags+)
(setq anything-etags+-use-short-file-name nil)

;; ---------------------------------------------------------------------
;; General
(load-file "~/.private/.jp-private.el")
(require 'jp-private)

(autoload 'sr-speedbar "sr-speedbar" t)
(autoload 'change-case "change-case" t)

(provide 'jp-misc)