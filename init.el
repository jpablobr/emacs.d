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
(require 'theme)
(require 'cedet)
(require 'misc)
(require 'defuns)
(require 'keyboard)
(require 'registers)
(require 'eshell)
(require 'lisp)
(require 'ruby)
(require 'js)
(require 'sinatra)
(require 'rinari)
(require 'plain-text)
(require 'org-config)
(require 'meta)
(require 'markdown)
(require 'haml)
(require 'autocomplete)
(require 'webdev)
(require 'wanderlust)
(require 'java)

(regen-autoloads)
(load custom-file 'noerror)

;;; ---------------------------------------------------------
;;; - user-specific customizations
;;;
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el"))

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))

;;; ---------------------------------------------------------
;;; - requiring yasnippets after everything has been loaded...
;;;
(require 'yasnippet)
(require 'hippie)

;;; ---------------------------------------------------------
;;; - Benchmarking
;;;
(defvar *emacs-load-start* (current-time))
(message "My .emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second
                                                       *emacs-load-start*)))))
(provide 'init)
