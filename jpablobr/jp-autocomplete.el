;;; -*- coding: utf-8-unix; -*-
;;jp-autocomplete.el ---------------------------------------------------------
;;; - Auto-complete
;;;
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat misc-dir "/ac-dict"))
(ac-config-default)

(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; start completion when entered 3 characters
(setq ac-auto-start 2)
;; Add following code to your .emacs.
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)

(global-auto-complete-mode t)           ;enable global-mode
   (setq ac-auto-start t)                  ;automatically start
   (setq ac-dwim 3)                        ;Do what i mean
   (setq ac-override-local-map nil)        ;don't override local map
;;   (define-key ac-complete-mode-map "\t" 'ac-expand)
;;   (define-key ac-complete-mode-map "\r" 'ac-complete)
;;   (define-key ac-complete-mode-map "\M-n" 'ac-next)
;;   (define-key ac-complete-mode-map "\M-p" 'ac-previous)
   (set-default 'ac-sources '( ac-source-yasnippet
                               ;; ac-source-filename
                               ;; ac-source-functions
                               ;; ac-source-variables
                               ;; ac-source-symbols
                               ;; ac-source-features
                               ;; ac-source-abbrev
                               ac-source-words-in-same-mode-buffers
                               ac-source-dictionary))

   (setq ac-modes
         (append ac-modes
                 '(c-mode cc-mode c++-mode java-mode fundamental-mode ;ecmascript-mode lisp-interaction-mode emacs-lisp-mode
                   perl-mode cperl-mode python-mode ruby-mode jde-mode inf-perl-mode
                   javascript-mode js2-mode espresso-mode php-mode css-mode shell-mode text-mode
                   makefile-mode sh-mode fortran-mode f90-mode ada-mode inf-ruby-mode clojure-mode scheme-mode org-mode
                   xml-mode sgml-mode sass-mode haml-mode html-mode RoR-mode rinari-mode rhtml-mode)))
   ;(add-to-list 'ac-trigger-commands 'org-self-insert-command)

  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
             (setq ac-sources
                   '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-symbols))))

(add-hook 'eshell-mode-hook
          (lambda ()
            (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-files-in-current-dir ac-source-words-in-buffer))))

   (add-hook 'ruby-mode-hook
             (lambda ()
               (setq ac-omni-completion-sources '(("\\.\\=" ac-source-rcodetools)))))

(provide 'jp-autocomplete)