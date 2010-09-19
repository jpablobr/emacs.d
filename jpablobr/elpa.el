;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Install a base set of packages automatically.
;;;
(defvar jpablobr-packages (list 'idle-highlight
;;                                   'ruby-mode
;;                                   'inf-ruby
;;                                   'js2-mode
;;                                   'css-mode
                                   )
  "Libraries that should be installed by default.")

(defun jpablobr-elpa-install ()
  "Install all jpablobr packages that aren't installed."
  (interactive)
  (dolist (package jpablobr-packages)
    (unless (functionp package)
      (package-install package))))

;; On your first run, this should pull in all the base packages.
;; But you might not be online, so ignore errors.
(ignore-errors
  (message "Checking base list of packages...")
  (jpablobr-elpa-install))

(provide 'elpa)