;;; ----------------------------------------------------------------------------
;;; - Java development
;;;

;;; Load all JDEE related libraries
;;; JDEE, documentation and file are located at:
;;; http://jdee.sunsite.dk/
;;; To speed-up installation for JDEE beginners use:
;;; http://wttools.sourceforge.net/emacs-stuff/package.html#install-jdee
(add-to-list 'load-path "~/.emacs.d/vendor/elib")
(add-to-list 'load-path "~/.emacs.d/vendor/eieio")
(add-to-list 'load-path "~/.emacs.d/vendor/semantic")
(add-to-list 'load-path "~/.emacs.d/vendor/speedbar")
(add-to-list 'load-path "~/.emacs.d/vendor/jdee")
(add-to-list 'load-path "~/.emacs.d/vendor/jdee/lisp")

;(load "jde-autoload")

;; (setq jde-auto-parse-enable nil)
;; (setq jde-enable-senator nil)
;; (load "jde-autoload")
;; (setq defer-loading-jde nil)
;; (if defer-loading-jde
;;     (progn
;;       (autoload 'jde-mode "jde" "JDE mode." t)
;;       (setq auto-mode-alist
;; 	    (append
;; 	     '(("\\.java\\'" . jde-mode))
;; 	     auto-mode-alist)))
;;   (require 'jde))

(require 'jde)

(provide 'java)