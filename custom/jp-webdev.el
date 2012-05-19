(dolist (i '("xml" "xsd" "rng" "xsl" "xslt" "svg" "rss" "html" "php"))
  (add-to-list 'auto-mode-alist (cons (concat "\\." i "\\'") 'nxml-mode)))

(setq magic-mode-alist (cons '("<\\?xml " . nxml-mode) magic-mode-alist))
(fset 'html-mode 'nxml-mode)
(fset 'xml-mode 'nxml-mode)
(setq nxml-slash-auto-complete-flag t)

(setq auto-mode-alist  (cons '("\\.(jsp|tmpl)$" . html-mode) auto-mode-alist))
(autoload 'css-mode          "css-mode" "Mode for editing CSS files" t)
(setq auto-mode-alist  (cons '("\\.css$" . css-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.js$" .  js2-mode) auto-mode-alist))

(autoload 'rng-clear-overlays "rng-valid" nil t)
(custom-set-faces
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) nil))))

(require 'css-mode)
(autoload 'css-mode "css-mode" "Mode for editing CSS files" t)

(setq cssm-indent-level 2)
(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-mirror-mode nil)

(autoload 'apache-mode "apache-mode" nil t)
(dolist (i '("\\.htaccess\\'" "httpd\\.conf\\'" "srm\\.conf\\'"
             "access\\.conf\\'" "sites-\\(available\\|enabled\\)/"))
  (add-to-list 'auto-mode-alist (cons i  'apache-mode)))

(setq scss-sass-options '("--style" "compressed"))
(defun jp-scss-mode-hook()
  (setq cssm-indent-function #'cssm-c-style-indenter)
  ;; (setq scss-sass-options '("--style" "compressed"))
  (rainbow-mode t))
