(setq ruby-dir (concat vendor-dir "/ruby"))
(add-to-list 'load-path ruby-dir)
;; (add-to-list 'load-path (concat ruby-dir "/emacs-rails"))
;; (add-to-list 'load-path (concat ruby-dir "/rinari"))
(load-file (concat jpablobr-dir "/jp-ruby-helpers.el"))
(load-file (concat jpablobr-dir "/jp-rails-helpers.el"))
(load-file (concat ruby-dir "/ruby-comint.el/ruby-comint.el"))
(load-file (concat ruby-dir "/ruby-test-mode.el"))
(load-file (concat ruby-dir "/testing.el"))
(load-file (concat ruby-dir "/ruby-electric.el"))

(require 'rdebug)
(require 'align)
(require 'ruby-hacks)
(require 'inf-ruby)
(require 'jp-ruby-helpers)
(require 'jp-rails-helpers)
(require 'ruby-comint)
(require 'testing)'
(require 'ruby-test-mode)'
(require 'ruby-electric)'
(require 'scss-mode)
(require 'ruby-style)

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(autoload 'flymake-ruby "flymake-ruby" nil t)
(autoload 'flymake-haml "flymake-haml" nil t)
(autoload 'toggle "toggle" nil t)

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.sake\\'" . ruby-mode))

;; work around possible elpa bug
(ignore-errors (require 'ruby-compilation))
(setq ruby-use-encoding-map nil)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (set (make-local-variable 'tab-width) 2)
             (highlight-parentheses-mode t)
             (highlight-symbol-mode t)
             (semantic-mode t)
             (r-ruby-complexity)
             (ruby-electric-mode t)
             (modify-syntax-entry ?! "w" (syntax-table))
             (modify-syntax-entry ?: "w" (syntax-table))
             (modify-syntax-entry ?_ "w" (syntax-table))
             (local-set-key (kbd "C-.") 'complete-tag)
             (pretty-lambdas)
             (inf-ruby-keys)
             (when window-system
               (menu-bar-mode t))
             (inf-ruby-keys)
             (local-set-key [return] 'ruby-reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "C-c l") "lambda")
             (define-key ruby-mode-map (kbd "C-c C-a") 'autotest-switch)
             (local-set-key (kbd "<return>") 'newline-and-indent)))

(add-hook 'haml-mode-hook 'flymake-haml-load)
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)
(setq scss-compile-at-save nil)
(setq rdebug-short-key-mode t)

;;----------------------------------------------------------------------
;; - Hide/Show modes
(add-to-list 'hs-special-modes-alist
             '(ruby-mode
               "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
               (lambda (arg) (ruby-end-of-block)) nil))

;;----------------------------------------------------------------------
;; - jp-haml.el
(setq haml-dir (concat vendor-dir "/haml"))
(add-to-list 'load-path haml-dir)
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml?$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.html.haml?$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

(provide 'jp-ruby)