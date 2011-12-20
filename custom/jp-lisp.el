;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;;
(add-hook 'emacs-lisp-mode-hook 'coding-hook)
(add-hook 'lisp-mode-hook 'coding-hook)

(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-remove-elc-on-save)

(when (functionp 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
  (add-hook 'lisp-mode-hook (lambda () (paredit-mode +1))))

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\|)" . 'paren-face)))

(font-lock-add-keywords 'scheme-mode
                        '(("(\\|)" . 'paren-face)))

(define-key lisp-mode-shared-map (kbd "C-c l") "lambda")
(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)
(define-key lisp-mode-shared-map (kbd "C-\\") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "C-c v") 'eval-buffer)

(add-hook 'emacs-lisp-mode-common-hook
          '(lambda ()
             (define-key emacs-lisp-mode-map [(control j)] 'newline)
             (define-key emacs-lisp-mode-map [(control m)] 'newline-and-indent)
             (define-key emacs-lisp-mode-map [(control c) (x)] 'copy-eval-dwim-lisp)
             (add-to-list 'ac-omni-completion-sources
                          (cons "\\." '(ac-source-semantic)))
             (add-to-list 'ac-omni-completion-sources
                          (cons "->" '(ac-source-semantic)))
             (setq ac-sources '(ac-source-semantic
                                ac-source-yasnippet
                                ac-source-filename
                                ac-source-functions
                                ac-source-variables
                                ac-source-symbols
                                ac-source-features
                                ac-source-abbrev
                                ac-source-semantic
                                ac-source-semantic-raw))))

(provide 'jp-lisp)