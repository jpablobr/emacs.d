;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Web development configs
;;;

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

(provide 'webdev)