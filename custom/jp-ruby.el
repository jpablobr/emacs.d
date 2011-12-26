(setq ruby-dir (concat vendor-dir "/ruby"))
(add-to-list 'load-path ruby-dir)
(load-file (concat jpablobr-lib "/jp-lib-ruby.el"))
(load-file (concat ruby-dir "/ruby-comint.el/ruby-comint.el"))
(load-file (concat ruby-dir "/anything-rake/anything-rake.el"))
(load-file (concat ruby-dir "/yari.el/yari.el"))

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")

;; (require 'align)
(require 'jp-lib-ruby)
(require 'ruby-comint)
(require 'ruby-style)
(require 'flymake-ruby)
(require 'ruby-hacks)
(require 'ruby-end)
(require 'anything-rake)
(require 'yari)

;; (autoload 'toggle "toggle" nil t)

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
(setq rdebug-short-key-mode t)

(provide 'jp-ruby)
