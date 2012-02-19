(add-hook 'ruby-mode-hook
          '(lambda ()
             (autopair-mode)
             (highlight-parentheses-mode t)
             (highlight-symbol-mode t)
             (flymake-ruby-load)
             (testr-mode)
             (linum-mode)
             (inf-ruby-keys)
             (font-lock-add-keywords
              nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
                     1 font-lock-warning-face  prepend)))
             (local-set-key [return] 'ruby-reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "RET")
               'reindent-then-newline-and-indent)
             (local-set-key (kbd "<return>") 'newline-and-indent)
             (font-lock-fontify-buffer)
             (add-to-list 'ac-omni-completion-sources
                          (cons "\\." '(ac-source-semantic)))
             (setq ac-sources '(ac-source-yasnippet))))

(add-hook 'c-mode-hook
          '(lambda ()
             (font-lock-add-keywords nil jp-show-tabs)
             (setq show-trailing-whitespace t)))

(add-hook 'doc-mode-hook
          '(lambda ()
             (require 'asciidoc)))

(add-hook 'erlang-shell-mode-hook
          (lambda ()
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(add-hook 'nxml-mode-hook
          (lambda ()
            (make-variable-buffer-local 'ido-use-filename-at-point)
            (setq ido-use-filename-at-point nil)))

(add-hook 'html-mode-hook
          '(lambda ()
             (add-hook 'before-save-hook 'jp-cleanup-buffer)
             (local-set-key (kbd "<return>") 'newline-and-indent)))

(add-hook 'css-mode-hook
          '(lambda ()
             (setq css-indent-offset 2)
             (local-set-key (kbd "<return>") 'newline-and-indent)
             (setq css-electric-brace-behavior t)
             (setq css-electric-semi-behavior t)))

(add-hook 'markdown-mode-hook
          (lambda ()
            (font-lock-add-keywords nil jp-show-tabs)
            (font-lock-add-keywords
             nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
                    1 font-lock-warning-face  prepend)))
            (autopair-mode)))

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (autopair-mode)
             (highlight-parentheses-mode t)
             (highlight-symbol-mode t)
             (setq show-trailing-whitespace t)
             (font-lock-add-keywords
              nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
                     1 font-lock-keyword-face prepend)))
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

(add-hook 'lisp-mode-hook
          (lambda ()
            (autopair-mode)))

(add-hook 'lisp-interaction-mode-hook
          (lambda ()
            (autopair-mode)))

(add-hook 'isearch-mode-hook
          '(lambda ()
             (define-key isearch-mode-map "\M-i" 'isearch-repeat-forward)))

(add-hook 'php-mode-hook
          (lambda ()
            (require 'flymake-php)
            (wicked/php-mode-init)
            (setq show-trailing-whitespace t)
            (add-hook 'before-save-hook 'jp-cleanup-buffer)
            (c-toggle-auto-newline -1)
            (setq c-basic-offset 4)
            (highlight-parentheses-mode 1)
            (indent-tabs-mode nil)))

(add-hook 'shell-mode-hook
          '(lambda ()
             (add-hook 'comint-output-filter-functions
                       'comint-truncate-buffer)
             (rvm-activate-corresponding-ruby)
             (autopair-mode)
             (ansi-color-for-comint-mode-on)
             (font-lock-mode -1)))

(add-hook 'shell-script-mode-hook
          '(lambda ()
             (autopair-mode)
             (setq show-trailing-whitespace t)
             (highlight-parentheses-mode t)
             (highlight-symbol-mode t)
             (local-set-key (kbd "C-c C-c") 'jp-cleanup-buffer)
             (flymake-shell-load)))

(add-hook 'sh-mode-hook
          '(lambda ()
             (autopair-mode)
             (font-lock-add-keywords nil jp-show-tabs)
             (setq show-trailing-whitespace t)
             (highlight-parentheses-mode t)
             (highlight-symbol-mode t)
             (local-set-key (kbd "C-c C-c") 'jp-cleanup-buffer)
             (flymake-shell-load)))

(add-hook 'message-mode-hook
          '(lambda ()
             (autopair-mode)
             (set-input-method "latin-9-prefix")
             (jp-turn-on-flyspell)))


(add-hook 'asciidoc-mode-hook
          '(lambda ()
             (turn-on-auto-fill)
             (require 'asciidoc)))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-o") 'other-window)
))

(add-hook 'lua-mode-hook 'flymake-lua-load)

(add-hook 'ri-filter-hook 'jp-colorize-compilation-buffer)

(add-hook 'erlang-mode-hook 'alexott/erlang-mode-hook)

(add-hook 'compilation-filter-hook 'jp-colorize-compilation-buffer)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

(add-hook 'w3m-display-hook 'fc-w3m-rename-buffer)

(add-hook 'w3m-mode-hook 'fc-w3m-setup)

(add-hook 'w3m-form-input-textarea-mode-hook 'fc-remove-cr)

(add-hook 'shell-filter-hook 'jp-colorize-compilation-buffer)

(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(provide 'jp-lib-hooks)
