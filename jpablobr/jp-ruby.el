;; -*- coding: utf-8-unix; -*-
;; A lot of this is thanks to dima-exe:
;; http://github.com/dima-exe/emacs_rc/blob/master/emacs-rc-ruby.el

(setq ruby-dir (concat vendor-dir "/ruby"))
(add-to-list 'load-path ruby-dir)
(add-to-list 'load-path (concat ruby-dir "/ruby-mode-1.1"))
(add-to-list 'load-path (concat ruby-dir "/rdebug"))
(add-to-list 'load-path (concat ruby-dir "/inf-ruby-2.1"))
(add-to-list 'load-path (concat ruby-dir "/rhtml"))
(add-to-list 'load-path (concat ruby-dir "/rspec-mode"))
(add-to-list 'load-path (concat ruby-dir "/rcodetools"))
(add-to-list 'load-path (concat ruby-dir "/autotest"))
(add-to-list 'load-path (concat ruby-dir "/emacs-rails"))
(add-to-list 'load-path (concat ruby-dir "/rinari"))
(add-to-list 'load-path (concat ruby-dir "/ruby-complexity"))

(require 'rdebug)

(eval-after-load 'ruby-mode
  '(progn
     (require 'jp-ruby-helpers)
     (require 'yari)
     (require 'flymake-haml)
     (require 'scss-mode)
     (require 'inf-ruby)
     ;; (require 'hideshow)
     (require 'ruby-block)
     (require 'unit-test)
     (require 'toggle)
     (require 'autotest)
     (require 'ruby-hacks)
     (require 'rhtml-mode)
     (require 'rspec-mode)
     (require 'align)
     (require 'jp-sinatra)
     (require 'ruby-electric)
     (require 'anything)
     (require 'anything-rcodetools)
     (require 'rcodetools)
     (require 'rails)
     (require 'rinari)
     (require 'ruby-complexity)
     (require 'icicles-rcodetools)
     (require 'rdebug)
     (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)
           flymake-err-line-patterns)
     (add-hook 'ruby-mode-hook 'flymake-ruby-enable)))

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(autoload 'ruby-electric-mode "ruby-electric" "Ruby electric mode." t)
(autoload 'autotest-switch "autotest" "doco" t)
(autoload 'autotest "autotest" "doco" t)
(autoload 'rhtml-mode "rhtml-mode" "RHTML" t)

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(eval-after-load 'ruby-mode
  '(progn
     (require 'ruby-compilation)
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
     (define-key ruby-mode-map (kbd "C-c l") "lambda")
     (define-key rinari-minor-mode-map [(control meta shift down)] 'rinari-find-rspec)
     (define-key rinari-minor-mode-map [(control meta shift left)] 'rinari-find-controller)
     (define-key rinari-minor-mode-map [(control meta shift up)] 'rinari-find-model)
     (define-key rinari-minor-mode-map [(control meta shift right)] 'rinari-find-view)))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\spec.rb$" . rspec-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\.erb$" . rhtml-mode))

(add-hook 'ruby-mode-hook
          '(lambda ()
            (set (make-local-variable 'tab-width) 2)
            (ruby-electric-mode t)
            (ruby-hs-minor-mode t)
            (ruby-block-mode t)
            (imenu-add-to-menubar "IMENU")
            (modify-syntax-entry ?! "w" (syntax-table))
            (modify-syntax-entry ?: "w" (syntax-table))
            (modify-syntax-entry ?_ "w" (syntax-table))
            (local-set-key (kbd "C-.") 'complete-tag)
            (ri-bind-key)
            (inf-ruby-keys)
            (auto-fill-mode 1)
            (GAU-bind-insert-ruby-debug-key)
            (define-key ruby-mode-map (kbd "C-c C-a") 'autotest-switch)
            (local-set-key (kbd "<return>") 'newline-and-indent)))

;;; Ruby Complexity
(add-hook 'ruby-mode-hook
          (function (lambda ()
                      (linum-mode)
                      (ruby-complexity-mode)
                      )))

(add-hook 'haml-mode-hook 'flymake-haml-load)
(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'rhtml-mode-hook 'ri-bind-key)
(add-hook 'haml-mode-hook 'ri-bind-key)
(add-hook 'sass-mode-hook 'ri-bind-key)
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)
;; (add-hook 'comint-mode-hook 'turn-on-rdebug-track-mode)

(setq scss-compile-at-save nil)
(setq rdebug-short-key-mode t)
(setq ruby-block-highlight-toggle 'overlay)

;; Rinari (Minor Mode for Ruby On Rails)
(setq rinari-major-modes
      (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
            'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))

(provide 'jp-ruby)