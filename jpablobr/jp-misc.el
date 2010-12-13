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
(setq browse-url-browser-function 'browse-url-firefox)
;; (setq browse-url-browser-function 'browse-default-macosx-browser)
;; (setq browse-url-browser-function 'browse-default-windows-browser)
;; (setq browse-url-browser-function 'browse-default-kde)
;; (setq browse-url-browser-function 'browse-default-epiphany)
;; (setq browse-url-browser-function 'browse-default-w3m)
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "~/src/conkeror/conkeror")


;;; ---------------------------------------------------------
;;; - Transparently open compressed files
;;;
(auto-compression-mode t)

;;; ---------------------------------------------------------
;;; - Smoother scrolling
;;;
(setq
 scroll-margin 0                  
  scroll-conservatively 100000
  scroll-preserve-screen-position 1)
  (put 'scroll-left 'disabled nil)
  
;;; ---------------------------------------------------------
;;; - X11 Copy & Paste to/from Emacs
;;;
(setq x-select-enable-clipboard t) ; as above
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;; ---------------------------------------------------------
;;; - Enable syntax highlighting for older Emacsen that have it off
;;;
(global-font-lock-mode t)

;;; ---------------------------------------------------------
;;; - Menu bar settings
;;;
;;(menu-bar-mode -1)

;;; ---------------------------------------------------------
;;; - Save a list of recent files visited.
;;;
(recentf-mode 1)

;;; ---------------------------------------------------------
;;; - Highlight matching parentheses when the point is on them.
;;;
(show-paren-mode 1)

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
;;; - Hippie expand: at times perhaps too hip
;;;
(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)

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
(setq line-number-mode t)
(setq column-number-mode t)

;;; ---------------------------------------------------------
;;; - Set line numbers globally
;;;
(require 'linum)
(global-linum-mode)

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
;;; - Artist-mode
;;;
(autoload 'artist-mode "artist" "Enter artist-mode" t)

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

(provide 'jp-misc)