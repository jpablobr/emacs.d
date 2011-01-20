;;; ----------------------------------------------------------------------------
;;; - Python
;;;
(setq pylookup-dir "~/.emacs.d/vendor/pylookup")
(add-to-list 'load-path pylookup-dir)
;; load pylookup when compile time
(eval-when-compile (require 'pylookup))

(defun python-custom ()
  "python-mode-hook"

  (imenu-add-to-menubar "IMENU")
  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
  (add-to-list 'interpreter-mode-alist '("python" . python-mode))

  ;; set executable file and db file
  (setq pylookup-program (concat pylookup-dir "/pylookup.py"))
  (setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

  ;; to speedup, just load it on demand
  (autoload 'pylookup-lookup "pylookup"
    "Lookup SEARCH-TERM in the Python HTML indexes." t)
  (autoload 'pylookup-update "pylookup"
    "Run pylookup-update and create the database at `pylookup-db-file'." t)

  (autoload 'python-mode "python-mode" "Python Mode." t)

  ;; Emacs key binding
  (global-set-key "\C-ch" 'pylookup-lookup))

(add-hook 'python-mode-hook '(lambda () (python-custom)))

;; TODO: (void-variable python-mode-map) error
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
               (set-variable 'py-indent-offset 4)
               (set-variable 'py-smart-indentation nil)
               (set-variable 'indent-tabs-mode nil)
               ;;(highlight-beyond-fill-column)
               (define-key python-mode-map "\C-m" 'newline-and-indent)
               (pabbrev-mode)
               (abbrev-mode))))

;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(setq ropemacs-enable-autoimport t)

(add-hook 'pre-abbrev-expand-hook 'abbrev-table-change)
(defun abbrev-table-change (&optional args)
  (setq local-abbrev-table
        (if (eq major-mode 'jde-mode)
            (if (jde-parse-comment-or-quoted-p)
                text-mode-abbrev-table
              java-mode-abbrev-table)
          (if (eq major-mode 'python-mode)
              (if (inside-comment-p)
                  text-mode-abbrev-table
                python-mode-abbrev-table)))))

(provide 'jp-python)