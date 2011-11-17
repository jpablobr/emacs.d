(require 'anything)
(load-file (concat misc-dir "/anything-match-plugin.el"))
(require 'anything-match-plugin)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)
;; (require 'anything-etags+)
;; (setq anything-etags+-use-short-file-name nil)

;;; anything-complete.el replaces various completion with anything
;;; (like Icicles). Use Anything power for normal completion.
(when (require 'anything-complete nil t)
  ;; Automatically collect symbols by 150 secs
  (anything-lisp-complete-symbol-set-timer 150)
  (define-key emacs-lisp-mode-map "\C-\M-i" 'anything-lisp-complete-symbol-partial-match)
  (define-key lisp-interaction-mode-map "\C-\M-i" 'anything-lisp-complete-symbol-partial-match)
  ;; Comment if you do not want to replace completion commands with `anything'.
  (anything-read-string-mode 1)
  )

;;; anything-show-completion.el shows current selection prettily.
(require 'anything-show-completion)

;;; descbinds-anything.el replaces describe-bindings with anything interface.
(when (require 'descbinds-anything nil t)
  ;; Comment if you do not want to replace `describe-bindings' with `anything'.
  (descbinds-anything-install)
  )

;; (require 'anything-grep)

(setq anything-sources
      (list anything-c-source-buffers
            anything-c-source-bookmarks
            anything-c-source-files-in-current-dir
            anything-c-source-file-name-history
            anything-c-source-man-pages
            anything-c-source-info-pages
            anything-c-source-calculation-result
            anything-c-source-locate
            anything-c-source-emacs-commands))

(provide 'jp-anything)