;;; ----------------------------------------------------------------------------
;;; - Java development
;;;

;;; ----------------------------------------------------------------------------
;;; - Better scrolling in emacs
;;; - from: http://user.it.uu.se/~mic/pager.el
;;; 
(require 'pager)

;;; ----------------------------------------------------------------------------
;;; - Parens
;;; - mic-paren.el is available at:
;;; - http://www.emacswiki.org/cgi-bin/wiki/download/mic-paren.el 
;;; - cparen.el is available at:
;;; - http://www.hut.fi/u/rsaikkon/software/elisp/cparen.el
;;;
(require 'mic-paren)
(require 'cparen)
(paren-activate)
(cparen-activate)
(show-paren-mode t)

;;; ----------------------------------------------------------------------------
;;; - JDE requires
;;; - from: http://wttools.sourceforge.net/emacs-stuff/package.html#install-jdee
;;; 
(add-to-list 'load-path "~/.emacs.d/vendor/elib")
(add-to-list 'load-path "~/.emacs.d/vendor/eieio")
(add-to-list 'load-path "~/.emacs.d/vendor/semantic")
(add-to-list 'load-path "~/.emacs.d/vendor/speedbar")
(add-to-list 'load-path "~/.emacs.d/vendor/jdee")
(add-to-list 'load-path "~/.emacs.d/vendor/jdee/lisp")
(require 'jde)

;;; ----------------------------------------------------------------------------
;;; - jde-jalopy
;;; - Interface between JDEE and Jalopy
;;; - http://www.emacswiki.org/emacs/download/jde-jalopy.el
(require 'jde-jalopy)

(load "jde-autoload")

;;; ----------------------------------------------------------------------------
;;; - Custom configs
;;;
(setq jde-auto-parse-enable nil)
(setq jde-enable-senator nil)
(setq defer-loading-jde t); Defer loading the JDE until you open a Java file.

;;; It works only if you manualy set CYGWIN_ROOT environment
;;; variable for your Windows system
;;; (MyComputer->Properties->Advanced->Environment Varibles)
;;; Configures some parameters for CygWin specific environment
(if (not (null (getenv "CYGWIN_ROOT")))
    (progn
      (setq-default
       cygwin-root (getenv "CYGWIN_ROOT")
       exec-path (cons (concat cygwin-root "/bin") exec-path)
       process-coding-system-alist '(("bash" . undecided-unix))
       shell-file-name "bash"
       explicit-shell-file-name shell-file-name)
      (setenv "PATH" (concat cygwin-root "/bin;"
                             cygwin-root "/usr/local/bin;"
                             (getenv "PATH")))
      (setenv "SHELL" shell-file-name)
      (add-hook 'comint-output-filter-functions
                'comint-strip-ctrl-m)))
 
;; Sets the basic indentation for Java source files
;; to two spaces.
;; (defun indentation-jde-mode-hook ()
;;   "Hook for running java file..."
;;   (message " Loading my-jde-mode-hook...")
;;   (c-set-offset 'substatement-open 0)
;;   (c-set-offset 'statement-case-open 0)
;;   (c-set-offset 'case-label '+)
;;  (wisent-java-default-setup)
;;   (setq 
;;    indent-tabs-mode nil
;;    tab-width 2
;;    c-basic-offset 2
;;    tempo-interactive t
;;    ))
;; (add-hook 'jde-mode-hook 'indentation-jde-mode-hook)
;; (add-hook 'jde-mode-hook
;;           '(lambda ()
;;      (load "jde-autoload")))

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

;;; ----------------------------------------------------------------------------
;;; - Hacks
;;; - function does not exist in emacs 23.2
;;;
(defun semantic-parse())
(defun skip-cleanup())
(defun  semantic-format-prototype-tag-java-mode())

(provide 'jp-java)