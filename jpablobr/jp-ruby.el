;; -*- coding: utf-8-unix; -*-
;; A lot of this is thanks to dima-exe:
;; http://github.com/dima-exe/emacs_rc/blob/master/emacs-rc-ruby.el

(require 'jp-sinatra)
(require 'linum)
(require 'ruby-electric)

;;; ---------------------------------------------------------
;;; - Ruby
;;;
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(autoload 'ruby-electric-mode "ruby-electric" "Ruby electric mode." t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(eval-after-load 'ruby-mode
  '(progn
     (require 'ruby-compilation)
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
     (define-key ruby-mode-map (kbd "C-c l") "lambda")))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

(add-hook 'ruby-mode-hook
          '(lambda ()
            (set (make-local-variable 'tab-width) 2)
            (ruby-electric-mode t)
            (ruby-hs-minor-mode t)
            (imenu-add-to-menubar "IMENU")
            (modify-syntax-entry ?! "w" (syntax-table))
            (modify-syntax-entry ?: "w" (syntax-table))
            (modify-syntax-entry ?_ "w" (syntax-table))
            (local-set-key (kbd "C-.") 'complete-tag)
            (ri-bind-key)
            (local-set-key (kbd "C-:") 'my/ruby-toggle-string<>simbol)
            (local-set-key (kbd "<return>") 'newline-and-indent)))

;;; ---------------------------------------------------------
;;; - ri
;;;
(add-to-list 'load-path "~/.emacs.d/vendor/yari.el")
(require 'yari)

(defun ri-bind-key ()
  (local-set-key [f1] 'yari-anything))
(add-hook 'ruby-mode-hook 'ri-bind-key)

;;; ---------------------------------------------------------
;;; - rcodetools
;;;
;; (add-to-list 'load-path "~/.emacs.d/vendor/icicles")
;; (add-to-list 'load-path "~/.emacs.d/vendor/rcodetools")
;; (require 'rcodetools)
;; (require 'icicles-rcodetools)
;; (require 'anything)
;; (require 'anything-rcodetools)
;; Command to get all RI entries.
;; (setq rct-get-all-methods-command "PAGER=cat fri -l")
;; See docs
;; (define-key anything-map "\C-z" 'anything-execute-persistent-action)

;;; ---------------------------------------------------------
;;; - rdebug
;;; - $ sudo gem install ruby-debug
;;;
(add-to-list 'load-path "~/.emacs.d/vendor/rdebug")
(require 'rdebug)
(setq rdebug-short-key-mode t)

;;; ---------------------------------------------------------
;;; - ruby-block
;;;
(require 'ruby-block)
(ruby-block-mode t)
;; do overlay
(setq ruby-block-highlight-toggle 'overlay)
;; display to minibuffer
;(setq ruby-block-highlight-toggle 'minibuffer)
;; display to minibuffer and do overlay
;;(setq ruby-block-highlight-toggle t)

;;; ---------------------------------------------------------
;;; - RVM mode... use rvm’s default ruby for the current Emacs session
;;;
(if (eq system-type 'gnu/linux)
    (progn
      (require 'rvm)
      (rvm-use-default))
  (progn))

;;; ---------------------------------------------------------
;;; - Autotest
;;; - http://blog.zenspider.com/emacs/
;;;
;(load "~/.emacs.d/vendor/autotest/unit-test.el")
(add-to-list 'load-path "~/.emacs.d/vendor/autotest")
(require 'unit-test)
(require 'toggle)
(require 'autotest)

(autoload 'autotest-switch "autotest" "doco" t)
(autoload 'autotest "autotest" "doco" t)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (define-key ruby-mode-map (kbd "C-c C-a") 'autotest-switch)))

;;; ---------------------------------------------------------
;;; - Ruby-hacks
;;;
(require 'ruby-hacks)

;;; ---------------------------------------------------------
;;; - Complexity
;;; - $ gem install flog
;;;
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/ruby-complexity"))
;; (require 'ruby-complexity)
;; (add-hook 'ruby-mode-hook
;;          (function (lambda ()
;;                      (flymake-mode)
;;                      (linum-mode)
;;                      (ruby-complexity-mode)
;;                      )))

;;; ---------------------------------------------------------
;;; - rhtml mode
;;;
(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
(require 'rhtml-mode)
(autoload 'rhtml-mode "rhtml-mode" "RHTML" t)
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\.erb$" . rhtml-mode))

;;; ---------------------------------------------------------
;;; - Rspec
;;;
(add-to-list 'load-path (concat dotfiles-dir "/vendor/rspec-mode"))
(require 'rspec-mode)

;;; Rake

(defun pcomplete/rake ()
  "Completion rules for the `ssh' command."
  (pcomplete-here (pcmpl-rake-tasks)))

(defun pcmpl-rake-tasks ()
  "Return a list of all the rake tasks defined in the current
projects.  I know this is a hack to put all the logic in the
exec-to-string command, but it works and seems fast"
  (delq nil (mapcar '(lambda(line)
                       (if (string-match "rake \\([^ ]+\\)" line) (match-string 1 line)))
                    (split-string (shell-command-to-string "rake -T") "[\n]"))))

(defun rake (task)
  (interactive (list (completing-read "Rake (default: default): "
                                      (pcmpl-rake-tasks))))
  (shell-command-to-string (concat "rake " (if (= 0 (length task)) "default" task))))


;; Clear the compilation buffer between test runs.
(eval-after-load 'ruby-compilation
  '(progn
     (defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
       (let ((comp-buffer-name (format "*%s*" name)))
         (when (get-buffer comp-buffer-name)
           (with-current-buffer comp-buffer-name
             (delete-region (point-min) (point-max))))))
     (ad-activate 'ruby-do-run-w/compilation)))

(add-hook 'ruby-mode-hook 'run-coding-hook)

;;; Flymake

(defun flymake-ruby-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    ;; Invoke ruby with '-c' to get syntax checking
    (list "ruby" (list "-c" local-file))))

(defun flymake-ruby-enable ()
  (when (and buffer-file-name
             (file-writable-p
              (file-name-directory buffer-file-name))
             (file-writable-p buffer-file-name)
             (if (fboundp 'tramp-list-remote-buffers)
                 (not (subsetp
                       (list (current-buffer))
                       (tramp-list-remote-buffers)))
               t))
    (local-set-key (kbd "C-c d")
                   'flymake-display-err-menu-for-current-line)
    (flymake-mode t)))

(eval-after-load 'ruby-mode
  '(progn
     (require 'flymake)
     (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)
           flymake-err-line-patterns)
     (add-hook 'ruby-mode-hook 'flymake-ruby-enable)))

;; Rinari (Minor Mode for Ruby On Rails)
(setq rinari-major-modes
      (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
            'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))

;;; ---------------------------------------------------------
;;; - Align for ruby
;;;
(require 'align)

(defconst align-ruby-modes '(ruby-mode)
  "align-perl-modes is a variable defined in `align.el'.")

(defconst ruby-align-rules-list
  '((ruby-comma-delimiter
     (regexp . ",\\(\\s-*\\)[^/ \t\n]")
     (modes  . align-ruby-modes)
     (repeat . t))
    (ruby-string-after-func
     (regexp . "^\\s-*[a-zA-Z0-9.:?_]+\\(\\s-+\\)['\"]\\w+['\"]")
     (modes  . align-ruby-modes)
     (repeat . t))
    (ruby-symbol-after-func
     (regexp . "^\\s-*[a-zA-Z0-9.:?_]+\\(\\s-+\\):\\w+")
     (modes  . align-ruby-modes)))
  "Alignment rules specific to the ruby mode.
See the variable `align-rules-list' for more details.")

(dolist (it '(align-perl-modes align-dq-string-modes align-sq-string-modes align-open-comment-modes))
  (add-to-list it 'ruby-mode))

(dolist (it ruby-align-rules-list)
  (add-to-list 'align-rules-list it))

(provide 'jp-ruby)