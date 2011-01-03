;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Web development configs
;;;

;;; ---------------------------------------------------------
;;; - nXML
;;;

(add-hook 'nxml-mode-hook
          '(lambda ()
     (load "~/.emacs.d/vendor/nxhtml/autostart.el")))

(dolist (i '("xml" "xsd" "rng" "xsl" "xslt" "svg" "rss" "html" "php"))
  (add-to-list 'auto-mode-alist (cons (concat "\\." i "\\'") 'nxml-mode)))

;;; ---------------------------------------------------------
;;; - HTML, JavaScript, CSS Setup, YAML
;;;

(autoload 'php-find-function-prototype "php-functions" "PHP functions" t)
(autoload 'css-mode          "css-mode" "Mode for editing CSS files" t)

(setq auto-mode-alist  (cons '("\\.css$" . css-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.js$" .  js2-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.php$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.php$" . php-mode) auto-mode-alist))

(add-hook 'php-mode-hook
          '(lambda()
            (yas/minor-mode 1)))

(add-hook 'html-mode-hook
          '(lambda()
            (local-set-key (kbd "<return>") 'newline-and-indent)))

(add-hook 'css-mode-hook
          '(lambda()
            (setq css-indent-offset 2)
            (setq css-electric-brace-behavior t)
            (setq css-electric-semi-behavior t)))

;;; ----------------------------------------------------------------------------
;;; - PHP Mode
;;;
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

;;; ---------------------------------------------------------
;;; - HTML/mumamo setup
;;;
(add-to-list 'load-path "~/.emacs.d/vendor/nxhtml/util")
(autoload 'rng-clear-overlays "rng-valid" nil t)
(custom-set-faces
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) nil))))

;;; ---------------------------------------------------------
;;; - CSS
;;;
(require 'css-mode)
(autoload 'css-mode "css-mode" "Mode for editing CSS files" t)
(setq auto-mode-alist (append '(("\\.css$" . css-mode)) auto-mode-alist))
(add-hook 'css-mode-hook
          (lambda()
            (local-set-key (kbd "<return>") 'newline-and-indent)))

;;; ---------------------------------------------------------
;;; - Apache
;;;
(autoload 'apache-mode "apache-mode" nil t)
(dolist (i '("\\.htaccess\\'" "httpd\\.conf\\'" "srm\\.conf\\'"
             "access\\.conf\\'" "sites-\\(available\\|enabled\\)/"))
  (add-to-list 'auto-mode-alist (cons i  'apache-mode)))

(add-hook 'apache-mode-hook
          '(lambda()
            (set (make-local-variable 'apache-indent-level) 2)))

(provide 'jp-webdev)