;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Web development configs
;;;

;;; ---------------------------------------------------------
;;; - nXML
;;;
(load "~/.emacs.d/vendor/nxhtml/autostart22.el")

(dolist (i '("xml" "xsd" "rng" "xsl" "xslt" "svg" "rss" "html"))
  (add-to-list 'auto-mode-alist (cons (concat "\\." i "\\'") 'nxml-mode)))

;;; ---------------------------------------------------------
;;; - HTML, JavaScript, CSS Setup, YAML
;;;

(autoload 'php-find-function-prototype "php-functions" "PHP functions" t)
(autoload 'css-mode          "css-mode" "Mode for editing CSS files" t)

(setq auto-mode-alist  (cons '("\\.css$" . css-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.js$" .  js2-mode) auto-mode-alist))


(add-hook 'html-mode-hook
          '(lambda()
            (local-set-key (kbd "<return>") 'newline-and-indent)))

(add-hook 'css-mode-hook
          '(lambda()
            (setq css-indent-offset 2)
            (setq css-electric-brace-behavior t)
            (setq css-electric-semi-behavior t)))

;;; ---------------------------------------------------------
;;; - HTML/mumamo setup
;;;
(add-to-list 'load-path "~/.emacs.d/vendor/nxhtml/util")
(autoload 'rng-clear-overlays "rng-valid" nil t)

;;; ---------------------------------------------------------
;;; - CSS
;;;
(add-to-list 'load-path (concat vendor-dir "/css-mode"))
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