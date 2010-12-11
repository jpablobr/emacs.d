;; -*- coding: utf-8-unix; -*-
;; A lot of this is thanks to dima-exe:
;; http://github.com/dima-exe/emacs_rc/blob/master/emacs-rc-ruby.el

(require 'jp-sinatra)
(require 'linum)
(require 'ruby-electric)

;;; ---------------------------------------------------------
;;; - Ruby
;;;
(autoload 'ruby-mode "ruby-mode" "Ruby editing mode." t)
(autoload 'ruby-electric-mode "ruby-electric" "Ruby electric mode." t)

(add-to-list 'auto-mode-alist (cons (concat "\\.rb\\'") 'ruby-mode))
(add-to-list 'auto-mode-alist (cons (concat "Rakefile\\'") 'ruby-mode))

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
            (local-set-key (kbd "C-:") 'my/ruby-toggle-string<>simbol)
            (local-set-key (kbd "<return>") 'newline-and-indent)))

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
;;; - Flymake for ruby
;;;
(require 'flymake nil t)
(defconst flymake-allowed-ruby-file-name-masks
  '(("\\.rb\\'"      flymake-ruby-init)
    ("\\.rxml\\'"    flymake-ruby-init)
    ("\\.builder\\'" flymake-ruby-init)
    ("\\.rjs\\'"     flymake-ruby-init))
  "Filename extensions that switch on flymake-ruby mode syntax checks.")

(defconst flymake-ruby-error-line-pattern-regexp
  '("^\\([^:]+\\):\\([0-9]+\\): *\\([\n]+\\)" 1 2 nil 3)
  "Regexp matching ruby error messages.")

(defun flymake-ruby-init ()
  (condition-case er
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
             (local-file  (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
        (list "ruby" (list "-c" local-file)))
    ('error ())))

(defun flymake-ruby-load ()
  (when (and (buffer-file-name)
             (loop for re in flymake-allowed-ruby-file-name-masks
                   for allow = (string-match (car re) (buffer-file-name))
                   when allow do (return re)))
    (setq flymake-allowed-file-name-masks
          (append flymake-allowed-file-name-masks flymake-allowed-ruby-file-name-masks))
    (setq flymake-err-line-patterns
          (cons flymake-ruby-error-line-pattern-regexp flymake-err-line-patterns))
    (flymake-mode t)))

(when (featurep 'flymake)
  (add-hook 'ruby-mode-hook 'flymake-ruby-load))

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
;;; - ri
;;;
(setq ri-ruby-script "~/.emacs.d/vendor/ri-emacs/ri-emacs.rb")
(autoload 'ri "~/.emacs.d/vendor/ri-emacs/ri-ruby.el" nil t)
;;   (add-hook 'ruby-mode-hook (lambda ()
;;                               (local-set-key 'f1 'ri)
;;                               (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
;;                               (local-set-key 'f4 'ri-ruby-show-args)
;;                               ))

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

(eval-after-load 'ruby-mode
  '(progn
     (require 'ruby-compilation)
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
     (define-key ruby-mode-map (kbd "C-c l") "lambda")))

(global-set-key (kbd "C-h r") 'ri)

;; Rake files are ruby, too.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

;;; ---------------------------------------------------------
;;; - Rake
;;;
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

(add-hook 'ruby-mode-hook 'coding-hook)

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


;;; ---------------------------------------------------------
;;; - Hideshow for ruby
;;;
(defun ruby-hs-minor-mode (&optional arg)
  (interactive)
  (require 'hideshow)
  (unless (assoc 'ruby-mode hs-special-modes-alist)
    (setq
     hs-special-modes-alist
     (cons (list 'ruby-mode
                 "\\(def\\|do\\)"
                 "end"
                 "#"
                 '(lambda (&rest args) (ruby-end-of-block)))
           hs-special-modes-alist)))
  (hs-minor-mode arg))

;;; ---------------------------------------------------------
;;; - Ruby functions
;;;
(defun my/ruby-toggle-string<>simbol ()
  "Easy to switch between strings and symbols."
  (interactive)
  (let ((initial-pos (point)))
    (save-excursion
      (when (looking-at "[\"']") ;; skip beggining quote
        (goto-char (+ (point) 1))
        (unless (looking-at "\\w")
          (goto-char (- (point) 1))))
      (let* ((point (point))
             (start (skip-syntax-backward "w"))
             (end (skip-syntax-forward "w"))
             (end (+ point start end))
             (start (+ point start))
             (start-quote (- start 1))
             (end-quote (+ end 1))
             (quoted-str (buffer-substring-no-properties start-quote end-quote))
             (symbol-str (buffer-substring-no-properties start end)))
        (cond
         ((string-match "^\'\\w+\'$" quoted-str)
          (setq quoted-str (substring quoted-str 1 (- (length quoted-str) 1)))
          (kill-region start-quote end-quote)
          (goto-char start-quote)
          (insert (concat "\"" quoted-str "\"")))
         ((string-match "^\"\\w+\"$" quoted-str)
          (setq quoted-str (substring quoted-str 1 (- (length quoted-str) 1)))
          (kill-region start-quote end-quote)
          (goto-char start-quote)
          (insert (concat ":" quoted-str)))
         ((string-match "^\:\\w+$" symbol-str)
          (setq symbol-str (substring symbol-str 1))
          (kill-region start end)
          (goto-char start)
          (insert (format "'%s'" symbol-str))))))
    (goto-char initial-pos)))

(provide 'jp-ruby)
