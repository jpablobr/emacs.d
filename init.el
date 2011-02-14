;;; -*- coding: utf-8-unix; -*-
;;init.el ---------------------------------------------------------
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
;;; - Load up ELPA, the package manager:
;;;
(require 'package)
(dolist (source '(("technomancy" . "http://repo.technomancy.us/emacs/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)
(require 'starter-kit-elpa)

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
(require 'jp-w3m)
(require 'jp-artist)
(require 'jp-perl)
(require 'jp-org-config)
(require 'jp-latex)
;; (require 'jp-java)
;; (require 'jp-php)
;; (require 'jp-wanderlust)
;; (require 'jp-erlang)
;; (require 'jp-haskell)
;; (require 'jp-clojure)
;; (require 'jp-scheme)

(autoload 'jp-org-config "jp-org-config" t)

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
(add-to-list 'load-path (concat vendor-dir "/ecb-2.40"))
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
;; (ecb-activate)

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
(put 'narrow-to-region 'disabled nil)
