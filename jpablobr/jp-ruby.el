(setq ruby-dir (concat vendor-dir "/ruby"))
(add-to-list 'load-path ruby-dir)
(add-to-list 'load-path (concat ruby-dir "/ruby-mode-1.1"))
(add-to-list 'load-path (concat ruby-dir "/inf-ruby-2.1"))
(add-to-list 'load-path (concat ruby-dir "/rcodetools"))
(add-to-list 'load-path (concat ruby-dir "/rdebug"))
(add-to-list 'load-path (concat ruby-dir "/rhtml"))
(add-to-list 'load-path (concat ruby-dir "/rspec-mode"))
(add-to-list 'load-path (concat ruby-dir "/rinari"))
(add-to-list 'load-path (concat ruby-dir "/ruby-complexity"))
(load-file (concat jpablobr-dir "/jp-ruby-helpers.el"))
(add-to-list 'load-path (concat ruby-dir "/emacs-rails"))

(require 'jp-ruby-helpers)
(require 'yari)
(require 'rdebug)
(require 'scss-mode)
(require 'inf-ruby)
(require 'ruby-block)
(require 'toggle)
(require 'ruby-hacks)
(require 'rhtml-mode)
(require 'rspec-mode)
(require 'align)
(require 'ruby-electric)
(require 'anything)
(require 'anything-rcodetools)
(require 'rcodetools)
(require 'rinari)
(require 'ruby-complexity)
(require 'icicles-rcodetools)
(require 'rdebug)
(require 'hideshow)
(require 'flymake-haml)
(require 'unit-test)
(require 'autotest)
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
(add-to-list 'auto-mode-alist '("\\.Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.spec.rb$" . rspec-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

(setq ruby-deep-indent-paren '(?\( t))
(setq inf-ruby-first-prompt-pattern "^>> "
      inf-ruby-prompt-pattern "^>> ")

(defun rinari-web-server (&optional edit-cmd-args)
  "Starts a Rails webserver.  Dumps output to a compilation buffer
allowing jumping between errors and source code.  With optional prefix
argument allows editing of the server command arguments."
  (interactive "P")
  (let* ((default-directory (rinari-root))
         (script (rinari-script-path))
         (command
          (expand-file-name
           (if (file-exists-p (expand-file-name "server" script))
               "server"
             "rails server")
           script)))

    ;; Start web server in correct environment.
    ;; NOTE: Rails 3 has a bug and does not start in any environment but development for now.
    (if rinari-rails-env
        (setq command (concat command " -e " rinari-rails-env)))

    ;; For customization of the web server command with prefix arg.
    (setq command (if edit-cmd-args
                      (read-string "Run Ruby: " (concat command " "))
                    command))

    (gusev-shell-run default-directory command "*server*"))
  (rinari-launch))

;; work around possible elpa bug
(ignore-errors (require 'ruby-compilation))
(setq ruby-use-encoding-map nil)
(add-hook 'ruby-mode-hook 'inf-ruby-keys)

;; active the default ruby configured with rvm
(when (fboundp 'rvm-use-default)
  (rvm-use-default))

;; rinari (Minor Mode for Ruby On Rails)
(setq rinari-minor-modes
      (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
            'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))

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
             (menu-bar-mode t)
             ;; (set-pairs '("(" "{" "[" "\"" "\'" "|"))
             (inf-ruby-keys)
             (GAU-bind-insert-ruby-debug-key)
             (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-yasnippet))
             (make-local-variable 'ac-ignores)
             (make-local-variable 'ac-auto-start)
             (add-to-list 'ac-ignores "end")
             (setq ac-auto-start nil)
             (local-set-key [return] 'ruby-reindent-then-newline-and-indent)
             (local-set-key (kbd "TAB") 'yas/expand)
             (define-key ruby-mode-map (kbd "C-c v") 'senny-ruby-eval-buffer)
             (define-key ruby-mode-map (kbd "C-M-r") 'senny-ruby-compilation-this-buffer)
             (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
             (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
             (define-key ruby-mode-map (kbd "C-c l") "lambda")
             (define-key ruby-mode-map (kbd "#") 'ruby-interpolate)
             (define-key rinari-minor-mode-map [(control meta shift down)] 'rinari-find-rspec)
             (define-key rinari-minor-mode-map [(control meta shift left)] 'rinari-find-controller)
             (define-key rinari-minor-mode-map [(control meta shift up)] 'rinari-find-model)
             (define-key rinari-minor-mode-map [(control meta shift right)] 'rinari-find-view)
             (define-key ruby-mode-map (kbd "C-c C-a") 'autotest-switch)
             ;; (define-key ruby-mode-map (kbd "C-c C-r g") 'rvm-open-gem)
             (function (lambda () ;; Ruby Complexity
                         (linum-mode)
                         (ruby-complexity-mode)))
             (local-set-key (kbd "<return>") 'newline-and-indent)));;))

(add-hook 'haml-mode-hook 'flymake-haml-load)
(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'rhtml-mode-hook 'ri-bind-key)
(add-hook 'haml-mode-hook 'ri-bind-key)
(add-hook 'sass-mode-hook 'ri-bind-key)
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-mode-hook 'turn-on-rdebug-track-mode)

(setq scss-compile-at-save nil)
(setq rdebug-short-key-mode t)
(setq ruby-block-highlight-toggle 'overlay)

;; Ruby test mode
(require 'ruby-test-mode)
;; I don't use 'run test' feature of ruby-test-mode. However I need these keys
;; for my own bindings. ;)
(add-hook 'ruby-mode-hook 'ruby-test-mode)

(defvar ruby-test-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-cr" 'ruby-test-run)
    (define-key map "\C-cp" 'ruby-test-run-at-point)
    (define-key map "\C-ct" 'ruby-test-toggle-implementation-and-specification)
    map)
  "The keymap used in `ruby-test-mode' buffers.")


(require 'autoinsert)
(add-to-list 'auto-insert-alist
             '(("_spec\\.rb$" . "RSpec header")
               nil
               "require 'spec_helper' describe " (let* ((file-name (file-name-nondirectory buffer-file-name))
                                                        (class-name-parts (butlast (split-string file-name "_"))))
                                                   (mapconcat 'capitalize class-name-parts "")) " do end"))

(provide 'jp-ruby)