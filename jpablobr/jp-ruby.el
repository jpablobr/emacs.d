(setq ruby-dir (concat vendor-dir "/ruby"))
(add-to-list 'load-path ruby-dir)
;; (add-to-list 'load-path (concat ruby-dir "/rdebug"))
;; (add-to-list 'load-path (concat ruby-dir "/rhtml"))
;; (add-to-list 'load-path (concat ruby-dir "/ruby-complexity"))
;; (add-to-list 'load-path (concat ruby-dir "/rinari"))
(load-file (concat jpablobr-dir "/jp-ruby-helpers.el"))
(add-to-list 'load-path (concat ruby-dir "/emacs-rails"))

(require 'jp-ruby-helpers)
(require 'yari)
(require 'scss-mode)
(require 'inf-ruby)
(require 'toggle)
(require 'ruby-hacks)
(require 'rspec-mode)
(require 'align)
(require 'flymake-ruby)
(require 'flymake-haml)
;; (require 'rinari)
;; (require 'rhtml-mode)
;; (require 'unit-test)
;; (require 'autotest)
;; (require 'rdebug)
;; (require 'ruby-complexity)
(require 'rails)

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
(add-to-list 'auto-mode-alist '("\\spec.rb$" . rspec-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

(setq ruby-deep-indent-paren '(?\( t))
(setq inf-ruby-first-prompt-pattern "^>> "
      inf-ruby-prompt-pattern "^>> ")

;; work around possible elpa bug
(ignore-errors (require 'ruby-compilation))
(setq ruby-use-encoding-map nil)

;; rinari (Minor Mode for Ruby On Rails)
;; (setq rinari-minor-modes
;;       (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
;;             'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (set (make-local-variable 'tab-width) 2)
             ;; (ruby-electric-mode t)
             (ruby-hs-minor-mode t)
             (highlight-parentheses-mode t)
             (highlight-symbol-mode t)
             (imenu-add-to-menubar "IMENU")
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
             (define-key ruby-mode-map (kbd "C-c v") 'senny-ruby-eval-buffer)
             (define-key ruby-mode-map (kbd "C-M-r") 'senny-ruby-compilation-this-buffer)
             (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
             (define-key ruby-mode-map (kbd "C-c l") "lambda")
             (define-key ruby-mode-map (kbd "#") 'ruby-interpolate)
             ;; (define-key rinari-minor-mode-map [(control meta shift down)] 'rinari-find-rspec)
             ;; (define-key rinari-minor-mode-map [(control meta shift left)] 'rinari-find-controller)
             ;; (define-key rinari-minor-mode-map [(control meta shift up)] 'rinari-find-model)
             ;; (define-key rinari-minor-mode-map [(control meta shift right)] 'rinari-find-view)
             (define-key ruby-mode-map (kbd "C-c C-a") 'autotest-switch)
             ;; (define-key ruby-mode-map (kbd "C-c C-r g") 'rvm-open-gem)
             (function (lambda () ;; Ruby Complexity
                         (linum-mode)
                         (ruby-complexity-mode)))
             (local-set-key (kbd "<return>") 'newline-and-indent)));;))

(add-hook 'haml-mode-hook 'flymake-haml-load)
(add-hook 'rhtml-mode-hook 'ri-bind-key)
(add-hook 'haml-mode-hook 'ri-bind-key)
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)

(setq scss-compile-at-save nil)
(setq rdebug-short-key-mode t)

(defvar ruby-test-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-cr" 'ruby-test-run)
    (define-key map "\C-cp" 'ruby-test-run-at-point)
    (define-key map "\C-ct" 'ruby-test-toggle-implementation-and-specification)
    map)
  "The keymap used in `ruby-test-mode' buffers.")

;;----------------------------------------------------------------------
;; - Hide/Show modes
(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))

(require 'autoinsert)
(add-to-list 'auto-insert-alist
             '(("_spec\\.rb$" . "RSpec header")
               nil
               "require 'spec_helper' describe " (let* ((file-name (file-name-nondirectory buffer-file-name))
                                                        (class-name-parts (butlast (split-string file-name "_"))))
                                                   (mapconcat 'capitalize class-name-parts "")) " do end"))

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