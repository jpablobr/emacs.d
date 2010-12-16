;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Jose Pablo Barrantes <xjpablobrx@gmail.com>
;;; - emacs.d initializations
;;;
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list 'load-path (concat dotfiles-dir "/jpablobr"))
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))
(setq vendor-dir (concat dotfiles-dir "/vendor"))

;;; ---------------------------------------------------------
;;; - These should be loaded on startup rather than
;;; - autoloaded on demand 
;;; - since they are likely to be used in every session:
;;;
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;;; ---------------------------------------------------------
;;; - Load up ELPA, the package manager:
;;;
(require 'package)
(package-initialize)
(require 'elpa)

;;; ---------------------------------------------------------
;;; - Load jpablobr customizations:
;;;
(require 'jp-theme)
(require 'jp-cedet)
(require 'jp-misc)
(require 'jp-defuns)
(require 'jp-keyboard)
(require 'jp-registers)
(require 'jp-lisp)
(require 'jp-ruby)
(require 'jp-sinatra)
;(require 'jp-rinari)
(require 'jp-js)
(require 'jp-plain-text)
(require 'jp-meta)
(require 'jp-markdown)
(require 'jp-autocomplete)
(require 'jp-eshell)
(require 'jp-haml)
(require 'jp-yaml)
(require 'jp-python)
(require 'jp-webdev)
(require 'jp-showoff)
(require 'jp-java)
;; (require 'jp-erlang)
;; (require 'jp-haskell)
;; (require 'jp-clojure)
;; (require 'jp-scheme)

(autoload 'jp-org-config "jp-org-config" t)
(autoload 'jp-wanderlust "jp-wanderlust" t)

;;; ---------------------------------------------------------
;;; - requiring yasnippets after everything has been loaded...
;;;
(require 'jp-yasnippet)
(require 'jp-hippie)

(regen-autoloads)
(load custom-file 'noerror)

;;; ---------------------------------------------------------
;;; - ECB
;;;
(add-to-list 'load-path (concat vendor-dir "/ecb"))
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
;;(ecb-activate)


;;; ---------------------------------------------------------
;;; - Benchmarking
;;;
(defvar *emacs-load-start* (current-time))
(message "My .emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second
                                                       *emacs-load-start*)))))

(provide 'init)

;;; ----------------------------------------------------------------------------
;;; - Haks
;;;
(put 'downcase-region 'disabled nil)
;; (setq initial-major-mode 'butterfly)