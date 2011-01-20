;;; ----------------------------------------------------------------------------
;;; - PHP
;;; -
;;;
(setq auto-mode-alist  (cons '("\\.php$" . php-mode) auto-mode-alist))

(add-hook 'php-mode-hook
          '(lambda()
            (yas/minor-mode 1)))

(load "php-mode")
(require 'php-mode)
(add-to-list 'auto-mode-alist
             '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

(defun wicked/php-mode-init ()
  "Set some buffer-local variables."
  (setq case-fold-search t)
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq c-basic-offset 2)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0))
(add-hook 'php-mode-hook 'wicked/php-mode-init)

(defun terminate-line ()
  "Terminate the line with a semicolon, and prepare to start typing on the next line. A second semicolon will not be inserted if one is already present.
   If the line begins with `case,’ a colon will be inserted insead."
  (interactive)

  (back-to-indentation)
  (if (looking-at "case")
      (setq eol-char ":")
    (setq eol-char ";"))

  (end-of-line)
  (if (not (looking-back eol-char))
      (insert eol-char))
  (reindent-then-newline-and-indent))

(defun open-line-indent (n)
  “Insert a newline and leave point before it.
   If there is a fill prefix and/or a `left-margin’, insert them
   on the new line if the line would have been blank.
   Indent following line afterwards.
   With arg n, insert n newlines.”
   (interactive "*p")
   (save-excursion
     (open-line n)
     (next-line n)
     (indent-according-to-mode)))

(define-key php-mode-map "\r" 'reindent-then-newline-and-indent)
(define-key php-mode-map "\C-c\C-c" 'comment-or-uncomment-region-or-line)
(define-key php-mode-map "\M-;" 'terminate-line)
(define-key php-mode-map "\C-o" 'open-line-indent)
(define-key php-mode-map (kbd "RET") 'newline-and-indent)
(setq show-paren-mode t)


;; (add-to-list 'load-path
;; 	     (expand-file-name "~/.emacs.d/vendor/php_repl/data"))
;; (require 'php-repl)
;; (setq php-repl-program (concat (getenv "HOME") ".emacs.d/vendor/php-repl/PHP/Repl.php"))

(require 'php-mode)

;; (setq php-manual-path "/usr/share/doc/php-doc/ru"
;;       php-manual-url (concat "file://" php-manual-path))

(add-hook 'php-mode-hook '(lambda ()
			    (flyspell-prog-mode)
			    (c-toggle-auto-newline -1)
			    ;; (turn-on-orgstruct)
			    ;; (turn-on-orgtbl)
			    (setq c-basic-offset 4
				  indent-tabs-mode nil)))

(require 'phpunit)
;; Make clickalabe of standard PHP fatals too.
(setq phpunit-regexp-alist (append phpunit-regexp-alist
				   '(php)))

(require 'flymake-php)
(add-hook 'php-mode-hook '(lambda () (flymake-mode t)))

(require 'php-electric)
(add-hook 'php-mode-hook '(lambda () (php-electric-mode)))

(autoload 'geben "geben" "PHP Debugger on Emacs" t)

(add-hook 'php-mode-hook '(lambda ()
			    (highlight-parentheses-mode 1)))

(provide 'jp-php)
