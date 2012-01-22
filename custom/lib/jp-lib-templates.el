(defun jp-test-sh-script ()
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

(defun jp-new-sh-script (name)
  (interactive "sName: ")
  (let ((buffer (shell "*New Script*")))
    (setq script-name (concat name ".sh"))
    (setq script-path "~/.private/bin/" )
    (find-file (concat script-path script-name))
    (kill-new buffer-file-name)
    (comint-send-string buffer (concat "cd " script-path ";echo './" script-name "'\n"))))

(defun jp-insert-name ()
  (interactive)
  (insert user-full-name))

(defun jp-insert-email ()
  (interactive)
  (insert user-mail-address))

(defun jp-insert-date ()
  (interactive)
  (insert-string (current-date-string)))

(defun jp-insert-lorem ()
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad "
          "minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(provide 'jp-lib-templates)
