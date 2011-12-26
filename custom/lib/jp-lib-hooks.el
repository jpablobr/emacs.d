(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (autopair-mode)
             (highlight-parentheses-mode t)
             (highlight-symbol-mode t)
             (flymake-ruby-load)
             (inf-ruby-keys)
             (add-hook 'before-save-hook 'jp-indent-buffer)
             (local-set-key [return] 'ruby-reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
             (local-set-key (kbd "<return>") 'newline-and-indent)
             (font-lock-fontify-buffer)
             (add-to-list 'ac-omni-completion-sources
                          (cons "\\." '(ac-source-semantic)))
             (setq ac-sources '(ac-source-yasnippet))))

(add-hook 'lua-mode-hook 'flymake-lua-load)

(add-hook 'ri-filter-hook 'jp-colorize-compilation-buffer)

(add-hook 'doc-mode-hook
          '(lambda ()
             (require 'asciidoc)))

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(add-hook 'erlang-mode-hook 'alexott/erlang-mode-hook)

(add-hook 'erlang-shell-mode-hook
          (lambda ()
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(add-hook 'nxml-mode-hook (lambda ()
                            (make-variable-buffer-local 'ido-use-filename-at-point)
                            (setq ido-use-filename-at-point nil)))
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

(add-hook 'markdown-mode-hook
          (lambda ()
            (jp-turn-on-flyspell)
						'turn-on-pandoc))

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (autopair-mode)
             (add-hook 'before-save-hook 'jp-indent-buffer)
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

(add-hook 'lisp-mode-hook #'(lambda () (autopair-mode)))

(add-hook 'lisp-interaction-mode-hook #'(lambda () (autopair-mode)))

(add-hook 'isearch-mode-hook
          '(lambda ()
             (define-key isearch-mode-map "\M-i" 'isearch-repeat-forward)))

(add-hook 'compilation-mode-hook '(lambda ()
                                    (setq show-trailing-whitespace nil)))

(add-hook 'compilation-filter-hook 'jp-colorize-compilation-buffer)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)

(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)

(autoload 'reftex-citation "reftex-cite" "Make citation" nil)

(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(add-hook 'latex-mode-hook 'turn-on-reftex)

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

(add-hook 'php-mode-hook
          (lambda ()
            (require 'flymake-php)
            (wicked/php-mode-init)
            (c-toggle-auto-newline -1)
            (setq c-basic-offset 4)
            (highlight-parentheses-mode 1)
            (indent-tabs-mode nil)))

(add-hook 'shell-mode-hook
          '(lambda nil
             (setq comint-prompt-read-only)
             (rvm-activate-corresponding-ruby)
             (ansi-color-for-comint-mode-on)
             (setq show-trailing-whitespace nil)))

(add-hook 'shell-filter-hook 'jp-colorize-compilation-buffer)

(add-hook 'after-save-hook 'jp-make-script-executable)

(add-hook 'shell-script-mode-hook
          '(lambda ()
             (autopair-mode)
             (flymake-shell-load)))

(add-hook 'sh-mode-hook
          '(lambda ()
             (autopair-mode)
             (flymake-shell-load)))

(add-hook 'w3m-display-hook 'fc-w3m-rename-buffer)

(add-hook 'w3m-mode-hook 'fc-w3m-setup)

(add-hook 'w3m-form-input-textarea-mode-hook 'fc-remove-cr)

(add-hook 'before-save-hook 'jp-cleanup-buffer)

(provide 'jp-lib-hooks)
