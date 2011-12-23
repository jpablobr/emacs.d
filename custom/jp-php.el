(setq php-dir (concat vendor-dir "/php"))
(add-to-list 'load-path php-dir)
(add-to-list 'load-path (concat php-dir "/php-mode"))
(autoload 'geben "geben" "PHP Debugger on Emacs" t)
(autoload 'php-mode "php-mode" "mode for editing php files" t)
(require 'flymake-php)

(jp-add-auto-mode 'php-mode "\\.php[345]?\\'\\|\\.phtml\\." "\\.(inc|tpl)$" "\\.module$")

(defun wicked/php-mode-init ()
  "Set some buffer-local variables."
  (setq case-fold-search t)
  (setq c-basic-offset 2)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0))

(defun terminate-line ()
  "Terminate the line with a semicolon, and prepare to start typing on
the next line. A second semicolon will not be inserted if one is
already present. If the line begins with `case,’ a colon will be
inserted insead."
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
  "Insert a newline and leave point before it.
   If there is a fill prefix and/or a `left-margin’, insert them
   on the new line if the line would have been blank.
   Indent following line afterwards.
   With arg n, insert n newlines."
   (interactive "*p")
   (save-excursion
     (open-line n)
     (next-line n)
     (indent-according-to-mode)))

(provide 'jp-php)
