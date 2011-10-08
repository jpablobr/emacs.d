;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Some helpful Lisp code
;;;
;;(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'coding-hook)
(add-hook 'lisp-mode-hook 'coding-hook)

(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-remove-elc-on-save)

(when (functionp 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
  (add-hook 'lisp-mode-hook (lambda () (paredit-mode +1))))

(defun emacs-lisp-remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\|)" . 'paren-face)))

(font-lock-add-keywords 'scheme-mode
                        '(("(\\|)" . 'paren-face)))

(define-key lisp-mode-shared-map (kbd "C-c l") "lambda")
(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)
(define-key lisp-mode-shared-map (kbd "C-\\") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "C-c v") 'eval-buffer)

(defface paren-face
   '((((class color) (background dark))
      (:foreground "grey20"))
     (((class color) (background light))
      (:foreground "grey55")))
   "Face used to dim parentheses."
   :group 'jpablobr-faces)

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (interactive)
             (require 'eldoc)
             (turn-on-eldoc-mode)
             (pretty-lambdas)
             (define-key emacs-lisp-mode-map [(control c) (x)] 'copy-eval-dwim-lisp)
             ;; Default to auto-indent on Enter
             (define-key emacs-lisp-mode-map [(control j)] 'newline)
             (define-key emacs-lisp-mode-map [(control m)] 'newline-and-indent)))

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(add-hook 'emacs-lisp-mode-common-hook
          '(lambda ()
             ;; ac-omni-completion-sources is made buffer local so
             ;; you need to add it to a mode hook to activate on
             ;; whatever buffer you want to use it with.  This
             ;; example uses C mode (as you probably surmised).
             ;; auto-complete.el expects ac-omni-completion-sources to be
             ;; a list of cons cells where each cell's car is a regex
             ;; that describes the syntactical bits you want AutoComplete
             ;; to be aware of. The cdr of each cell is the source that will
             ;; supply the completion data.  The following tells autocomplete
             ;; to begin completion when you type in a . or a ->
             (add-to-list 'ac-omni-completion-sources
                          (cons "\\." '(ac-source-semantic)))
             (add-to-list 'ac-omni-completion-sources
                          (cons "->" '(ac-source-semantic)))
             ;; ac-sources was also made buffer local in new versions of
             ;; autocomplete.  In my case, I want AutoComplete to use
             ;; semantic and yasnippet (order matters, if reversed snippets
             ;; will appear before semantic tag completions).
             (setq ac-sources '(ac-source-semantic
                                ac-source-yasnippet
                                ac-source-filename
                                ac-source-functions
                                ac-source-variables
                                ac-source-symbols
                                ac-source-features
                                ac-source-abbrev
                                ac-source-words-in-same-mode-buffers
                                ac-source-semantic
                                ac-source-semantic-raw
                                ac-source-dictionary))))

(provide 'jp-lisp)