(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(user-full-name "Jose Pablo Barrantes")
 '(user-mail-address "xjpablobrx@gmail.com")
 '(user-login-name "jpablobr")
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(default-frame-alist (quote ((tool-bar-lines . 0) (foreground-color\. "white") (background-color . "black") (menu-bar-lines . 1))))
 '(ecb-layout-window-sizes (quote (("left8" (0.19801980198019803 . 0.29310344827586204) (0.19801980198019803 . 0.2413793103448276) (0.19801980198019803 . 0.27586206896551724) (0.19801980198019803 . 0.1724137931034483)))))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("~/code/")))
 '(erc-modules (quote (autojoin button completion fill irccontrols match menu netsplit noncommands readonly ring scrolltobottom stamp track)))
 '(fill-column 80)
 '(font-lock-mode-maximum-decoration t)
 '(global-font-lock-mode t nil (font-lock))
 ;; '(global-semantic-tag-folding-mode t nil (semantic-util-modes))
 '(indent-tabs-mode nil)
 '(ispell-alternate-dictionary "~/.emacs.d/vendor/spanish-dictionary")
 '(jde-ant-enable-find t)
 '(jde-ant-home "$ANT_HOME")
 '(jde-auto-parse-max-buffer-size 0)
 '(jde-bug-debugger-host-address "127.0.0.1")
 '(jde-build-function (quote (jde-ant-build)))
 '(jde-compile-option-debug (quote ("all" (t nil nil))))
 '(jde-complete-function (quote jde-complete-minibuf))
 '(jde-debugger (quote ("jdb")))
 '(jde-gen-comments nil)
 '(jde-jalopy-option-force t)
 '(jde-jalopy-option-path "$PROJECTS_HOME/jalopy-1.0.2")
 '(jde-jdk-doc-url "http://download.oracle.com/javase/1.5.0/docs/api/index.html")
 '(jde-lib-directory-names (quote ("^lib" "^jar" "^classes")))
 '(jde-regexp-jar-file "/usr/share/java/regexp.jar")
 '(jde-sourcepath (quote (".")))
 '(jde-which-method-class-min-length 0)
 '(jde-which-method-max-length 30)
 '(quack-default-program "mit-scheme")
 '(rails-api-root "~/.emacs.d/vendor/api.rubyonrails.org")
 '(rails-ask-when-reload-tags t)
 '(rails-browse-api-with-w3m t)
 '(rails-use-alternative-browse-url nil)
 '(scroll-preserve-screen-position t)
 ;; '(semantic-idle-scheduler-idle-time 3)
 ;; '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(w3m-arrived-file "~/Dropbox/.w3m/.arrived")
 '(w3m-bookmark-file "~/Dropbox/.w3m/bookmark.html")
 '(w3m-default-save-directory "~/Dropbox/.w3m")
 '(w3m-form-textarea-directory "~/Dropbox/.w3m/.textarea")
 '(w3m-profile-directory "~/Dropbox/.w3m")
 '(w3m-session-file "~/Dropbox/.w3m/.sessions"))


;;; ----------------------------------------------------------------------------
;;; - I usually update this file erasing some important setting.
;;;
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(blink-cursor-mode nil)
;;  '(column-number-mode t)
;; '(default-frame-alist (quote ((tool-bar-lines . 0)
;;                               (foreground-color\. "white")
;;                               (background-color . "black")
;;                               (menu-bar-lines . 1))))
;; '(ecb-layout-window-sizes (quote (("left8" (0.19801980198019803 . 0.29310344827586204)
;;                                    (0.19801980198019803 . 0.2413793103448276)
;;                                    (0.19801980198019803 . 0.27586206896551724)
;;                                    (0.19801980198019803 . 0.1724137931034483)))))
;;  '(ecb-options-version "2.40")
;;  '(ecb-source-path (quote ("~/code/")))
;;  '(erc-modules (quote (autojoin button completion fill irccontrols match menu netsplit noncommands readonly ring scrolltobottom stamp track)))
;;  '(quack-default-program "mit-scheme")
;;  '(jde-bug-debugger-host-address "127.0.0.1")
;;  '(jde-compile-option-debug (quote ("all" (t nil nil)))) 
;;  '(jde-debugger (quote ("jdb")))
;;  '(jde-sourcepath (quote (".")))
;;  '(jde-jdk-doc-url "http://download.oracle.com/javase/1.5.0/docs/api/index.html")
;;  (if (eq system-type 'windows-nt)
;;     (progn
;;       '(jde-jdk (quote "C:\j2sdk1.6.0_16")) 
;;       '(jde-jdk-registry (quote (("1.6" . "C:\j2sdk1.6.0_16"))))
;;       '(jde-bug-jre-home "C:\j2sdk1.6.0_16") 
;;       '(jde-global-classpath (quote ("." "C:\j2sdk1.6.0_16"))))
;;   (progn
;;     '(jde-jdk (quote "/usr/lib/jvm/java-6-sun")) 
;;     '(jde-jdk-registry (quote (("1.5" . "/usr/lib/jvm/java-6-sun"))))
;;     '(jde-bug-jre-home  "/usr/lib/jvm/java-6-sun") 
;;     '(jde-global-classpath (quote ("." "/usr/share/java/" "/usr/lib/jvm/java-6-sun")))
;;     '(jde-regexp-jar-file "/usr/share/java/regexp.jar"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 normal))))
 '(autoface-default ((t (:inherit default :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) nil)))
 '(whitespace-line ((t (:background "purple" :foreground "green")))))
