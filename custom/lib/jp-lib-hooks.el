;; in Emacs 24 programming major modes generally derive
;; from a common mode named prog-mode
(add-hook 'prog-mode-hook 'jp-prog-mode-hook)

(add-hook 'after-save-hook 'jp-make-script-executable)

(add-hook 'before-save-hook 'jp-cleanup-buffer)

(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (autopair-mode)
             (set (make-local-variable 'tab-width) 2)
             (highlight-parentheses-mode t)
             (highlight-symbol-mode t)
             (flymake-ruby-load)
             (ruby-block-mode t)
             (inf-ruby-keys)
             (local-set-key [return] 'ruby-reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
             (local-set-key (kbd "<return>") 'newline-and-indent)
             (font-lock-fontify-buffer)
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
                                ac-source-semantic
                                ac-source-semantic-raw))))

(add-hook 'lua-mode-hook 'flymake-lua-load)

(add-hook 'ri-filter-hook 'jp-colorize-compilation-buffer)

(add-hook 'doc-mode-hook
          '(lambda ()
             (require 'asciidoc)))

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(add-hook 'erlang-mode-hook 'alexott/erlang-mode-hook)
(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;; add some Distel bindings to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(add-hook 'nxml-mode-hook (lambda ()
                            (make-variable-buffer-local 'ido-use-filename-at-point)
                            (setq ido-use-filename-at-point nil)))
(add-hook 'nxml-mode-hook (lambda () (tidy-build-menu nxml-mode-map)))
(add-hook 'html-mode-hook (lambda () (tidy-build-menu html-mode-map)))
(add-hook 'html-mode-hook
          '(lambda()
             (local-set-key (kbd "<return>") 'newline-and-indent)))

(add-hook 'css-mode-hook
          '(lambda()
             (setq css-indent-offset 2)
             (setq css-electric-brace-behavior t)
             (setq css-electric-semi-behavior t)))
(add-hook 'css-mode-hook
          (lambda()
            (local-set-key (kbd "<return>") 'newline-and-indent)))

(add-hook 'apache-mode-hook
          '(lambda()
             (set (make-local-variable 'apache-indent-level) 2)))

(add-hook 'message-mode-hook 'jp-turn-on-flyspell)

(add-hook 'text-mode-hook 'jp-turn-on-flyspell)

(add-hook 'markdown-mode-hook
          (lambda ()
            (jp-turn-on-flyspell)))

(add-hook 'emacs-lisp-mode-common-hook
          '(lambda ()
             (define-key emacs-lisp-mode-map [(control j)] 'newline)
             (define-key emacs-lisp-mode-map [(control m)] 'newline-and-indent)
             (define-key emacs-lisp-mode-map [(control c) (x)] 'copy-eval-dwim-lisp)
             (autopair-mode)
             (emacs-lisp-remove-elc-on-save)
             (coding-hook)
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

(add-hook 'lisp-mode-hook             #'(lambda () (autopair-mode)))

(add-hook 'lisp-interaction-mode-hook #'(lambda () (autopair-mode)))

(add-hook 'scheme-mode-hook           #'(lambda () (autopair-mode)))

(add-hook 'isearch-mode-hook
          '(lambda ()
             (define-key isearch-mode-map "\M-i" 'isearch-repeat-forward)))

(add-hook 'compilation-mode-hook '(lambda ()
                                    (setq show-trailing-whitespace nil)))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(add-hook 'scheme-mode-hook
          (lambda ()
            (define-key scheme-mode-map [f1]
              '(lambda ()
                 (interactive)
                 (ignore-errors
                   (let ((symbol (thing-at-point 'symbol)))
                     (info "(r5rs)")
                     (Info-index symbol)))))
            (mapc (lambda (key-arg)
                    (define-key scheme-mode-map (car key-arg)
                      (eval `(lambda ()
                               (interactive)
                               (-test ,(cadr key-arg))))))
                  '(([(control c) (control m)] nil)
                    ([(control c) (h)]         :this)
                    ([(control c) (e)]         :expand)
                    ([(control c) (o)]         :expand-once)
                    ([(control c) (*)]         :expand*)
                    ([(control c) (p)]         :pp)))
            (define-key scheme-mode-map [(control c) (x)] 'scheme-send-dwim)
            (define-key scheme-mode-map [(control c) (\;)] 'insert-balanced-comments)
            (define-key scheme-mode-map [(control c) (:)] 'remove-balanced-comments)
            (define-key scheme-mode-map [(control c) (t)]
              (lambda (prefix)
                (interactive "P")
                (-trace "trace" prefix)))
            (define-key scheme-mode-map [(control c) (T)]
              (lambda (prefix)
                (interactive "P")
                (-trace "trace-all" prefix)))
            (imenu-add-to-menubar "Symbols")
            (outline-minor-mode)
            (make-local-variable 'outline-regexp)
            (setq outline-regexp "^(.*")))

(add-hook 'Info-mode-hook
          (lambda ()
            (interactive)
            (define-key Info-mode-map [(control c) (x)] 'scheme-send-dwim)))

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode

(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

(add-hook 'php-mode-hook
          (lambda ()
            (require 'flymake-php)
            (flymake-mode t)
            (wicked/php-mode-init)
            (flyspell-prog-mode)
            (c-toggle-auto-newline -1)
            (setq c-basic-offset 4)
            (highlight-parentheses-mode 1)
            (indent-tabs-mode nil)))

;; TODO: (void-variable python-mode-map) error
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'py-smart-indentation nil)
                    (set-variable 'indent-tabs-mode nil)
                    ;;(highlight-beyond-fill-column)
                    (define-key python-mode-map "\C-m" 'newline-and-indent)
                    (pabbrev-mode)
                    (python-custom)
                    (abbrev-mode))))

(add-hook 'pre-abbrev-expand-hook 'abbrev-table-change)

(add-hook 'shell-mode-hook
          '(lambda nil
             (setq comint-prompt-read-only)
             (rvm-activate-corresponding-ruby)
             (ansi-color-for-comint-mode-on)
             (setq show-trailing-whitespace nil)))

(add-hook 'shell-filter-hook 'colorize-compilation-buffer)

(add-hook 'shell-script-mode-hook 'flymake-shell-load)

(add-hook 'lisp-mode-hook 'coding-hook)

(add-hook 'w3m-display-hook 'fc-w3m-rename-buffer)
(add-hook 'w3m-mode-hook 'fc-w3m-setup)
(add-hook 'w3m-form-input-textarea-mode-hook 'fc-remove-cr)

(provide 'jp-lib-hooks)
