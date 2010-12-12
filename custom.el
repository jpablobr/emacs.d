(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(default-frame-alist (quote ((tool-bar-lines . 0) (foreground-color\. "white") (background-color . "black") (menu-bar-lines . 1))))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("~/code/")))
 '(erc-modules (quote (autojoin button completion fill irccontrols match menu netsplit noncommands readonly ring scrolltobottom stamp track)))
 '(quack-default-program "mit-scheme")
 '(jde-bug-debugger-host-address "127.0.0.1")
 '(jde-compile-option-debug (quote ("all" (t nil nil)))) 
 '(jde-debugger (quote ("jdb")))
 '(jde-sourcepath (quote (".")))
 '(jde-jdk-doc-url "http://download.oracle.com/javase/1.5.0/docs/api/index.html")
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

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 95 :width normal))))
 '(autoface-default ((t (:inherit default :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 95 :width normal))))
 )