;; init.el -------------------------------------------------------------
;; - Jose Pablo Barrantes <xjpablobrx@gmail.com>
;; - emacs.d initializations
;;
;; ---------------------------------------------------------------------
;; - Load up ELPA, the package manager:
;;
(setq dotfiles-dir (file-name-directory (or load-file-name (buffer-file-name))))
(setq custom-file (concat dotfiles-dir "custom.el"))
(setq vendor-dir (concat dotfiles-dir "vendor"))
(setq jpablobr-dir (concat dotfiles-dir "/jpablobr"))
(setq misc-dir (concat dotfiles-dir "/vendor/misc"))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path misc-dir)
(load custom-file 'noerror)
;;; --------------------------------------------------------------------
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

;;; TODO: REFACTOR THIS SHIT!!!!! BUT IS WORKING MUCH BETTER! ;)
;;; --------------------------------------------------------------------
;;; - Load jpablobr customizations:
;;;
(load-file (concat jpablobr-dir "/jp-meta.el"))
(require 'jp-meta)
(load-file (concat jpablobr-dir "/jp-misc.el"))
(require 'jp-misc)
(load-file (concat jpablobr-dir "/jp-defuns.el"))
(require 'jp-defuns)
(load-file (concat jpablobr-dir "/jp-keyboard.el"))
(require 'jp-keyboard)
(load-file (concat jpablobr-dir "/jp-registers.el"))
(require 'jp-registers)
(load-file (concat jpablobr-dir "/jp-eshell.el"))
(require 'jp-eshell)
(load-file (concat jpablobr-dir "/jp-w3m.el"))
(require 'jp-w3m)

(require 'org-install)

;;; Stuff to run only on window systems.
(when window-system
  (org-emacs-file-load (concat jpablobr-dir "/jp-org-config.org"))
  (org-emacs-file-load (concat jpablobr-dir "/jp-latex.org"))
  (org-emacs-file-load (concat jpablobr-dir "/jp-webdev.org"))
  (org-emacs-file-load (concat jpablobr-dir "/jp-js.org")))

;; ---------------------------------------------------------------------
;; - Rest of config files...
;; (load-file (concat jpablobr-dir "/jp-python.el"))
;; (require 'jp-python)
;; (load-file (concat jpablobr-dir "/jp-showoff.el"))
;; (require 'jp-showoff)
;; (load-file (concat jpablobr-dir "/jp-php.el"))
;; (require 'jp-php)
;; (load-file (concat jpablobr-dir "/jp-wanderlust.el"))
;; (require 'jp-wanderlust)
;; (load-file (concat jpablobr-dir "/jp-erlang.el"))
;; (require 'jp-erlang)
;; (load-file (concat jpablobr-dir "/jp-haskell.el"))
;; (require 'jp-haskell)
;; (load-file (concat jpablobr-dir "/jp-clojure.el"))
;; (require 'jp-clojure)
;; (load-file (concat jpablobr-dir "/jp-scheme.el"))
;; (require 'jp-scheme)
;; (load-file (concat jpablobr-dir "/jp-artist.el"))
;; (require 'jp-artist)
;; (load-file (concat jpablobr-dir "/jp-perl.el"))
;; (require 'jp-perl)
(load-file (concat jpablobr-dir "/jp-yaml.el"))
(require 'jp-yaml)
(load-file (concat jpablobr-dir "/jp-ruby.el"))
(require 'jp-ruby)
(load-file (concat jpablobr-dir "/jp-markdown.el"))
(require 'jp-markdown)
(load-file (concat jpablobr-dir "/jp-lisp.el"))
(require 'jp-lisp)
(load-file (concat jpablobr-dir "/jp-plain-text.el"))
(require 'jp-plain-text)
(load-file (concat jpablobr-dir "/jp-autocomplete.el"))
(require 'jp-autocomplete)

;; ---------------------------------------------------------------------
;; - requiring yasnippets after everything has been loaded.
(load-file (concat jpablobr-dir "/jp-yasnippet.el"))
(require 'jp-yasnippet)
(load-file (concat jpablobr-dir "/jp-hippie.el"))
(require 'jp-hippie)
(org-emacs-file-load (concat jpablobr-dir "/jp-theme.org"))

;; ---------------------------------------------------------------------
;; - ECB
;; (load-file (concat jpablobr-dir "/jp-cedet.el"))
;; (require 'jp-cedet)
;; (add-to-list 'load-path (concat misc-dir "/ecb-2.40"))
;; (require 'ecb)
;; (setq ecb-tip-of-the-day nil)
;; (setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
;; (ecb-activate)

;; ---------------------------------------------------------------------
;; - Startup
(when (file-exists-p "~/org")
  (find-file "~/org/yacs/linux.org")
  (find-file "~/org/jpablobr.org"))

;; ---------------------------------------------------------------------
;; Base dir
(cd "~/")

(server-start)

(provide 'init)