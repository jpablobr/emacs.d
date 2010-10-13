;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - jpablobr's .emacs.d http://jpablobr.com
;;; - Jose Pablo Barrantes <xjpablobrx@gmail.com>
;;;

;;; ----------------------------------------------------------------------------
;;; - Mathematica
;;;
;; (autoload 'mma-mode "mma.el" "Mathematica package file mode" t)
;; (setq auto-mode-alist
;;       (cons '("\\.m\\'" . mma-mode) auto-mode-alist))
(load-library "mathematica")
(setq mathematica-never-start-kernel-with-mode t)
(setq auto-mode-alist
      (cons '("\\.m\\'" . mathematica-mode) auto-mode-alist))

;;; ----------------------------------------------------------
;;; - Grep edit
;;;
(require 'grep-edit)

;;; ---------------------------------------------------------
;;; - ECB
;;;
(add-to-list 'load-path (concat vendor-dir "/ecb"))
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(ecb-activate)

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
;;; - Twittering Mode
;;;
(add-to-list 'load-path (concat vendor-dir "/twittering-mode"))
(require 'twittering-mode)
(setq twittering-username "jpablobr")

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
;;; - Find-recursive
;;;
(require 'find-recursive)

;;; ---------------------------------------------------------
;;; - Yaml
;;;
(add-to-list 'load-path (concat vendor-dir "/yaml-mode"))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))