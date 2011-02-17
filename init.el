;; -*- coding: utf-8-unix; -*-
;; init.el ---------------------------------------------------------
;; - Jose Pablo Barrantes <xjpablobrx@gmail.com>
;; - emacs.d initializations
;;
;; ---------------------------------------------------------
;; - Load up ELPA, the package manager:
;;
(setq dotfiles-dir (file-name-directory (or load-file-name (buffer-file-name))))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))
(setq vendor-dir (concat dotfiles-dir "/vendor"))
(setq misc-dir (concat dotfiles-dir "/vendor/misc"))
(add-to-list 'load-path (concat dotfiles-dir "/jpablobr"))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path misc-dir)

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
;; (require 'jp-python)
;; (require 'jp-lisp)
;; (require 'jp-showoff)
;; (require 'jp-java)
;; (require 'jp-php)
;; (require 'jp-wanderlust)
;; (require 'jp-erlang)
;; (require 'jp-haskell)
;; (require 'jp-clojure)
;; (require 'jp-scheme)
;; (require 'jp-ruby)
(require 'jp-misc)
(require 'jp-defuns)
(require 'jp-keyboard)
(require 'jp-registers)
(require 'jp-sinatra)
(require 'jp-js)
(require 'jp-plain-text)
(require 'jp-meta)
(require 'jp-markdown)
(require 'jp-autocomplete)
(require 'jp-haml)
(require 'jp-yaml)
(require 'jp-webdev)
(require 'jp-w3m)
(require 'jp-artist)
(require 'jp-perl)
(require 'jp-org-config)
(require 'jp-latex)
(require 'jp-theme)
(require 'jp-eshell)

;;; ---------------------------------------------------------
;;; - requiring yasnippets after everything has been loaded...
;;;
(require 'jp-yasnippet)
(require 'jp-hippie)

;; (regen-autoloads)
(load custom-file 'noerror)

;;; ---------------------------------------------------------
;;; - ECB
;;;
;; (require 'jp-cedet)
;; (add-to-list 'load-path (concat misc-dir "/ecb-2.40"))
;; (require 'ecb)
;; (setq ecb-tip-of-the-day nil)
;; (setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
;; (ecb-activate)

;;; Startup
(when (file-exists-p "~/org")
  (find-file "~/org")
  (setq default-directory "~/")
  (require 'calendar)
  (when (require 'org nil t)
    (call-interactively 'org-agenda-list)))

(provide 'init)

;;; ----------------------------------------------------------------------------
;;; - Haks
;;;
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
