(setq python-dir (concat vendor-dir "/python"))
(setq pylookup-dir (concat python-dir "/pylookup"))
(add-to-list 'load-path pylookup-dir)

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

;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(setq ropemacs-enable-autoimport t)

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
