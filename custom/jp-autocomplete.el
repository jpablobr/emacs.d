
;;jp-autocomplete.el ---------------------------------------------------------
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat misc-dir "/ac-dict"))
;; (ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-start t)
;; (setq ac-dwim t)
;; (setq ac-delay 0.1)
;; (setq ac-auto-show-menu nil)
;; (setq ac-show-menu-immediately-on-auto-complete t)
;; (setq ac-trigger-key nil)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

(set-default 'ac-sources '( ;; ac-source-functions
                            ;; ac-source-variables
                            ;; ac-source-symbols
                            ;; ac-source-features
                            ;; ac-source-abbrev
                            ;; ac-source-semantic
                            ;; ac-source-semantic-raw
                            ac-source-yasnippet
                            ac-source-filename
                            ac-source-words-in-same-mode-buffers
                            ac-source-dictionary))

(setq ac-modes
      (append ac-modes
              '(c-mode
                erc-mode
                cc-mode
                c++-mode
                java-mode
                fundamental-mode
                ecmascript-mode
                astma-mode
                lisp-interaction-mode
                emacs-lisp-mode
                perl-mode
                cperl-mode
                python-mode
                jde-mode
                inf-perl-mode
                javascript-mode
                js2-mode
                php-mode
                css-mode
                shell-mode
                text-mode
                tex-mode
                latex-mode
                makefile-mode
                markdown-mode
                sh-mode
                f90-mode
                ada-mode
                ruby-mode
                inf-ruby-mode
                RoR-mode
                rinari-mode
                rhtml-mode
                clojure-mode
                scheme-mode
                org-mode
                nxml-mode
                sgml-mode
                sass-mode
                haml-mode
                html-mode)))

;; Exclude very large buffers from dabbrev
(defun smp-dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))

(setq dabbrev-friend-buffer-function 'smp-dabbrev-friend-buffer)

(provide 'jp-autocomplete)