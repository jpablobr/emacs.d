;;jp-java.el ----------------------------------------------------------------------------
;;; - Java development
;;; - http://www.iiitmk.ac.in/wiki/index.php/IIITM-K_How-to_Knowledge_Base/How_to_configure_JDE_for_emacs
;;; - from: http://wttools.sourceforge.net/emacs-stuff/package.html#install-jdee
;;; - http://www.emacswiki.org/cgi-bin/wiki/download/mic-paren.el
;;; - http://www.hut.fi/u/rsaikkon/software/elisp/cparen.el
;;; - from: http://user.it.uu.se/~mic/pager.el
;;;
(require 'jde)
(require 'pager)
(require 'mic-paren)
(require 'cparen)

(paren-activate)
(cparen-activate)
(show-paren-mode t)
(load "jde-autoload")

(semantic-add-system-include "/usr/lib/jvm/java-6-sun/jre/lib/*" 'jde-mode)
(semantic-add-system-include "/usr/lib/jvm/java-6-sun/jre/lib" 'jde-mode)
(semantic-add-system-include "/usr/lib/jvm/java-6-sun/jre/" 'jde-mode)
(semantic-add-system-include "/usr/lib/jvm/java-6-sun/" 'jde-mode)

(setq jde-auto-parse-enable nil)
(setq jde-enable-senator nil)
(setq defer-loading-jde t); Defer loading the JDE until you open a Java file.

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
            (append
             '(("\\.java\\'" . jde-mode))
             auto-mode-alist)))
  (require 'jde))

;; Sets the basic indentation for Java source files
;; to two spaces.
(defun indentation-jde-mode-hook ()
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
(add-hook 'jde-mode-hook 'indentation-jde-mode-hook)
(add-hook 'jde-mode-hook
          '(lambda ()
     (load "jde-autoload")))

;;; ----------------------------------------------------------------------------
;;; - JAVA custome variables
;;;
(custom-set-variables
 '(jde-bug-debugger-host-address "127.0.0.1")
 '(jde-compile-option-debug (quote ("all" (t nil nil))))
 '(jde-debugger (quote ("jdb")))
 '(jde-jdk-doc-url "http://download.oracle.com/javase/1.5.0/docs/api/index.html")
 '(jde-regexp-jar-file "/usr/share/java/regexp.jar")
 '(jde-sourcepath (quote (".")))
 '(jde-ant-enable-find t)
 '(jde-ant-home "$ANT_HOME")
 '(jde-auto-parse-max-buffer-size 0)
 '(jde-build-function (quote (jde-ant-build)))
 '(jde-complete-function (quote jde-complete-minibuf))
 '(jde-gen-comments nil)
 '(jde-jalopy-option-force t)
 '(jde-jalopy-option-path "$PROJECTS_HOME/jalopy-1.0.2")
 '(jde-lib-directory-names (quote ("^lib" "^jar" "^classes")))
 '(jde-which-method-class-min-length 0)
 '(jde-which-method-max-length 30)
  (if (eq system-type 'windows-nt)
    (progn
      '(jde-jdk (quote "C:\j2sdk1.6.0_16"))
      '(jde-jdk-registry (quote (("1.6" . "C:\j2sdk1.6.0_16"))))
      '(jde-bug-jre-home "C:\j2sdk1.6.0_16")
      '(jde-global-classpath (quote ("." "C:\j2sdk1.6.0_16"))))
  (progn
    '(jde-jdk (quote "/usr/lib/jvm/java-6-sun"))
    '(jde-jdk-registry (quote (("1.5" . "/usr/lib/jvm/java-6-sun"))))
    '(jde-bug-jre-home  "/usr/lib/jvm/java-6-sun")
    '(jde-global-classpath (quote ("." "/usr/share/java/" "/usr/lib/jvm/java-6-sun")))
    '(jde-regexp-jar-file "/usr/share/java/regexp.jar"))))

;; ;;; ----------------------------------------------------------------------------
;; ;;; - Hacks
;; ;;; - function does not exist in emacs 23.2
;; ;;;
;; (defun semantic-parse())
;; (defun skip-cleanup())
;; (defun  semantic-format-prototype-tag-java-mode())

(provide 'jp-java)