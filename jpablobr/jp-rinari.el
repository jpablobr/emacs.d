;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Ruby on Rails
;;;

;;; ---------------------------------------------------------
;;; - rails reloaded
;;;
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/emacs-rails"))
(require 'rails)

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

 ;; % wget -m api.rubyonrails.org ;)
;; (add-hook 'rails-hook
;;           (lambda()
;;              (rails-api-root "~/.emacs.d/vendor/api.rubyonrails.org")
;;              (rails-ask-when-reload-tags t)
;;              (rails-browse-api-with-w3m t)
;;              (rails-use-alternative-browse-url nil)))

(provide 'jp-rinari)
