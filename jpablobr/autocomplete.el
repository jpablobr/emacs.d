(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
(require 'auto-complete-config)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;;     ;; start completion when entered 3 characters
(setq ac-auto-start 2)
;; Add following code to your .emacs.
;;
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)


;; (add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
;;  (when (require 'auto-complete nil t)
;;    (require 'auto-complete-yasnippet)
;;    (require 'auto-complete-ruby)
;;    (require 'auto-complete-css)

   (global-auto-complete-mode t)           ;enable global-mode
   (setq ac-auto-start t)                  ;automatically start
   (setq ac-dwim 3)                        ;Do what i mean
   (setq ac-override-local-map nil)        ;don't override local map
;;   (define-key ac-complete-mode-map "\t" 'ac-expand)
;;   (define-key ac-complete-mode-map "\r" 'ac-complete)
;;   (define-key ac-complete-mode-map "\M-n" 'ac-next)
;;   (define-key ac-complete-mode-map "\M-p" 'ac-previous)
   (set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer))

   (setq ac-modes
         (append ac-modes
                 '(emacs-lisp-mode
                   lisp-interaction-mode
                   c-mode cc-mode c++-mode java-mode
                   perl-mode cperl-mode python-mode ruby-mode
                   ecmascript-mode javascript-mode js2-mode espresso-mode php-mode css-mode
                   makefile-mode sh-mode fortran-mode f90-mode ada-mode inf-ruby-mode
                   xml-mode sgml-mode sass-mode haml-mode html-mode RoR-mode rinari-mode shell-mode rhtml-mode)))
   ;(add-to-list 'ac-trigger-commands 'org-self-insert-command)

;   (add-hook 'emacs-lisp-mode-hook
;             (lambda ()
;              (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-symbols))))

   (add-hook 'eshell-mode-hook
             (lambda ()
               (setq ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-files-in-current-dir ac-source-words-in-buffer))))

   (add-hook 'ruby-mode-hook
             (lambda ()
               (setq ac-omni-completion-sources '(("\\.\\=" ac-source-rcodetools)))));)

(provide 'autocomplete)