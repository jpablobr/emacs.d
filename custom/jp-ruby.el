(setq ruby-dir (concat vendor-dir "/ruby"))
(add-to-list 'load-path ruby-dir)
(load-file (concat jpablobr-lib "/jp-lib-ruby.el"))
(load-file (concat ruby-dir "/ruby-comint/ruby-comint.el"))
(load-file (concat ruby-dir "/anything-rake/anything-rake.el"))
(load-file (concat ruby-dir "/anything-ruby-mthds/anything-ruby-mthds.el"))
(load-file (concat ruby-dir "/anything-ruby-inspect/anything-ruby-inspect.el"))
(load-file (concat ruby-dir "/yari/yari.el"))
(load-file (concat ruby-dir "/testr/testr.el"))

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")

(require 'jp-lib-ruby)
(require 'ruby-comint)
(require 'ruby-style)
(require 'flymake-ruby)
(require 'anything-rake)
(require 'anything-ruby-mthds)
(require 'anything-ruby-inspect)
(require 'yari)
(require 'yaml-mode)
(require 'rcodetools)
(require 'testr)
(require 'rspec-mode)
(require 'rubydb)

(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.sake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

(add-to-list 'completion-ignored-extensions ".rbc")

(setq rspec-use-rake-flag nil)

;; work around possible elpa bug
(ignore-errors (require 'ruby-compilation))
(setq ruby-use-encoding-map nil)
(setq rdebug-short-key-mode t)

;; (setq feature-default-language "fi")
;; point to cucumber languages.yml or gherkin i18n.yml to use
;; exactly the same localization your cucumber uses
;(setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
;; and load it
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(provide 'jp-ruby)
