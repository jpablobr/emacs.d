(defun test-sh-script ()
  "Loads a testing script."
  (interactive)
  (let ((buffer (shell "*Testing Script*")))
    (set (make-local-variable 'comint-output-filter-functions)
         '(comint-truncate-buffer
           comint-postoutput-scroll-to-bottom
           ansi-color-process-output))
    (ansi-color-for-comint-mode-on)
    (compilation-shell-minor-mode 1)
    (find-file "~/.private/bin/test.sh")
    (comint-send-string buffer (concat "cd ~/.private/bin/; ls -la" "\n"))))

(defun new-sh-script (name)
  "Loads a template for a new sh script."
  (interactive "sName: ")
  (let ((buffer (shell "*New Script*")))
		(setq script-name (concat name ".sh"))
		(setq script-path "~/.private/bin/" )
    (find-file (concat script-path script-name))
    (comint-send-string buffer (concat "cd " script-path ";echo './" script-name "'\n"))))

(defun toggle-linum  ()
  "Toggle linum mode"
  (interactive)
  (linum-mode))

;;; --------------------------------------------------------------------
;;; - Insert helper for the lazy.
(defun insert-name ()
  "Insert name at point."
  (interactive)
  (insert user-full-name))

(defun insert-email ()
  "Insert user email at point."
  (interactive)
  (insert user-mail-address))

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'ri-filter-hook 'colorize-compilation-buffer)

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad "
          "minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun insert-date ()
  "Insert the Date."
  (interactive)
  (insert-string (current-date-string)))

(provide 'jp-lib-templates)