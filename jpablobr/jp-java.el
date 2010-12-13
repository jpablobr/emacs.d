;;; ----------------------------------------------------------------------------
;;; - Java development
;;;

;;; http://wttools.sourceforge.net/emacs-stuff/package.html#install-jdee
(add-to-list 'load-path "~/.emacs.d/vendor/elib")
(add-to-list 'load-path "~/.emacs.d/vendor/eieio")
(add-to-list 'load-path "~/.emacs.d/vendor/semantic")
(add-to-list 'load-path "~/.emacs.d/vendor/speedbar")
(add-to-list 'load-path "~/.emacs.d/vendor/jdee")
(add-to-list 'load-path "~/.emacs.d/vendor/jdee/lisp")

(setq jde-auto-parse-enable nil)
(setq jde-enable-senator nil)
(load "jde-autoload")

;; If you want Emacs to defer loading the JDE until you open a 
;; Java file, edit the following line
(setq defer-loading-jde t)
;; to read:
;;
;;  (setq defer-loading-jde t)
;;

(defun skip-cleanup())

;; function does not exist in emacs 23.2
(defun semantic-parse())
 
;; Sets the basic indentation for Java source files
;; to two spaces.
(defun my-jde-mode-hook ()
  "Hook for running java file..."
  (message " Loading my-jde-mode-hook...")
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'statement-case-open 0)
  (c-set-offset 'case-label '+)
 (wisent-java-default-setup)
  (setq 
   indent-tabs-mode nil
   tab-width 2
   c-basic-offset 2
   tempo-interactive t
   ))

(add-hook 'jde-mode-hook 'my-jde-mode-hook)

;;; ----------------------------------------------------------------------------
;;; - ECB 
;;;
(add-hook 'jde-mode-hook
          '(lambda ()
     (require 'ecb)
     (ecb-minor-mode 1)))

(require 'jde)
(provide 'jp-java)