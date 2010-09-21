;;; ----------------------------------------------------------------------------
;;; - Python 
;;;

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                     interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

(setq pylookup-dir "~/.emacs.d/vendor/pylookup")
(add-to-list 'load-path pylookup-dir)
;; load pylookup when compile time
(eval-when-compile (require 'pylookup))

;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)
(autoload 'pylookup-update "pylookup" 
  "Run pylookup-update and create the database at `pylookup-db-file'." t)

(global-set-key "\C-ch" 'pylookup-lookup)

(provide 'python)