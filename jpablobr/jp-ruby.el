(setq ruby-dir (concat vendor-dir "/ruby"))
(add-to-list 'load-path ruby-dir)
;; (add-to-list 'load-path (concat ruby-dir "/rdebug"))
;; (add-to-list 'load-path (concat ruby-dir "/ruby-complexity"))
(add-to-list 'load-path (concat ruby-dir "/emacs-rails"))
(add-to-list 'load-path (concat ruby-dir "/rhtml"))
(load-file (concat jpablobr-dir "/jp-ruby-helpers.el"))
(load-file (concat jpablobr-dir "/jp-rails-helpers.el"))

;; (require 'jp-ruby-helpers)
;; (require 'jp-rails-helpers)
;; (require 'yari)
;; (require 'scss-mode)
;; (require 'inf-ruby)
;; (require 'ruby-hacks)
;; (require 'align)
;; (require 'flymake-ruby)
;; (require 'flymake-haml)
;; (require 'rails)
;; (require 'unit-test)
;; (require 'toggle)

;; (require 'autotest)
;; (require 'rhtml-mode)
;; (require 'rdebug)
;; (require 'ruby-complexity)

(autoload 'jp-ruby-helpers "jp-ruby-helper" nil t)
(autoload 'jp-rails-helpers "jp-rails-helpers" nil t)
(autoload 'yari "yari" nil t)
(autoload 'scss-mode "scss-mode" nil t)
(autoload 'inf-ruby "inf-ruby" nil t)
(autoload 'ruby-hacks "ruby-hacks" nil t)
(autoload 'align "align" nil t)
(autoload 'flymake-ruby "flymake-ruby" nil t)
(autoload 'flymake-haml "flymake-haml" nil t)
(autoload 'rails "rails" nil t)
(autoload 'unit-test "unit-test" nil t)
(autoload 'toggle "toggle" nil t)
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(autoload 'ruby-electric-mode "ruby-electric" "Ruby electric mode." t)
(autoload 'autotest-switch "autotest" "doco" t)
(autoload 'autotest "autotest" "doco" t)
(autoload 'rhtml-mode "rhtml-mode" "RHTML" t)

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

(setq ruby-deep-indent-paren '(?\( t))
(setq inf-ruby-first-prompt-pattern "^>> "
      inf-ruby-prompt-pattern "^>> ")

;; work around possible elpa bug
(ignore-errors (require 'ruby-compilation))
(setq ruby-use-encoding-map nil)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (set (make-local-variable 'tab-width) 2)
             ;; (ruby-electric-mode t)
             (ruby-hs-minor-mode t)
             (highlight-parentheses-mode t)
             (highlight-symbol-mode t)
             (modify-syntax-entry ?! "w" (syntax-table))
             (modify-syntax-entry ?: "w" (syntax-table))
             (modify-syntax-entry ?_ "w" (syntax-table))
             (local-set-key (kbd "C-.") 'complete-tag)
             (ri-bind-key)
             (flymake-ruby-load)
             (inf-ruby-keys)
             (when window-system
               (menu-bar-mode t))
             (inf-ruby-keys)
             (GAU-bind-insert-ruby-debug-key)
             (local-set-key [return] 'ruby-reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "C-c l") "lambda")
             (define-key ruby-mode-map (kbd "C-c C-a") 'autotest-switch)
             (function (lambda () ;; Ruby Complexity
                         (linum-mode)
                         (ruby-complexity-mode)))
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
(add-to-list 'auto-mode-alist '("\\.sake\\'" . ruby-mode))
(define-key haml-mode-map [(control meta down)] 'haml-forward-sexp)
(define-key haml-mode-map [(control meta up)] 'haml-backward-sexp)
(define-key haml-mode-map [(control meta left)] 'haml-up-list)
(define-key haml-mode-map [(control meta right)] 'haml-down-list)

(provide 'jp-ruby)