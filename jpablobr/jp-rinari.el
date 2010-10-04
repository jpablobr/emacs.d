;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Ruby on Rails
;;;

;;; ---------------------------------------------------------
;;; - rails reloaded
;;;
(setq load-path (cons (expand-file-name "~/.emacs.d/vendor/jpablobr-ror") load-path))
(require 'rails-autoload)

;;; ----------------------------------------------------------------------------
;;; - Rinari
;;;
(add-to-list 'load-path (concat dotfiles-dir "/vendor/jump.el"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/rinari"))
(require 'rinari)
(define-key rinari-minor-mode-map [(control meta shift down)] 'rinari-find-rspec)
(define-key rinari-minor-mode-map [(control meta shift left)] 'rinari-find-controller)
(define-key rinari-minor-mode-map [(control meta shift up)] 'rinari-find-model)
(define-key rinari-minor-mode-map [(control meta shift right)] 'rinari-find-view)

(provide 'jp-rinari)
