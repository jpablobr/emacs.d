;;jp-autocomplete.el ---------------------------------------------------------
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat misc-dir "/ac-dict"))
(ac-config-default)
(setq ac-auto-start 2)
(setq ac-delay 0.1)
(setq ac-auto-show-menu nil)
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-trigger-key nil)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

(set-default 'ac-sources '( ac-source-yasnippet
                            ac-source-filename
                            ac-source-functions
                            ac-source-variables
                            ac-source-symbols
                            ac-source-features
                            ac-source-abbrev
                            ac-source-words-in-same-mode-buffers
                            ac-source-dictionary))

(setq ac-modes
      (append ac-modes
              '(c-mode
                cc-mode
                c++-mode
                java-mode
                fundamental-mode
                ecmascript-mode
                lisp-interaction-mode
                emacs-lisp-mode
                perl-mode
                cperl-mode
                python-mode
                ruby-mode
                jde-mode
                inf-perl-mode
                javascript-mode
                js2-mode
                espresso-mode
                php-mode
                css-mode
                shell-mode
                text-mode
                tex-mode
                latex-mode
                makefile-mode
                sh-mode
                fortran-mode
                f90-mode
                ada-mode
                inf-ruby-mode
                clojure-mode
                scheme-mode
                org-mode
                xml-mode
                sgml-mode
                sass-mode
                haml-mode
                html-mode
                RoR-mode
                rinari-
                mode
                rhtml-mode)))

(provide 'jp-autocomplete)