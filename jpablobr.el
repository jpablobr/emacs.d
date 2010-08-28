;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Jose Pablo Barrantes
;;; - jpablobr's .emacs.d
;;; - http://jpablobr.com
;;;


;;; ----------------------------------------------------------------------------
;;; - Grep edit
;;;
(require 'grep-edit)

;;; ---------------------------------------------------------
;;; - Textmate
;;;
(require 'textmate)
(textmate-mode)

;;; ---------------------------------------------------------
;;; - ECB
;;;
(add-to-list 'load-path (concat vendor-dir "/ecb"))
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(ecb-activate)

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
;;; - cheat
;;;
(add-to-list 'auto-mode-alist '("\\.cheat$" . cheat))
(require 'cheat)

;;; ---------------------------------------------------------
;;; - redo
;;;
(require 'redo)
(global-set-key [(control -)] 'redo)

;;; ---------------------------------------------------------
;;; - find-recursive
;;;
(require 'find-recursive)

;;; ---------------------------------------------------------
;;; - yaml
;;;
(add-to-list 'load-path (concat vendor-dir "/yaml-mode"))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
