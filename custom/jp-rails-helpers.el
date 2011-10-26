;;; jp-rails-helpers.el --------------------------------------------------
;;; - Rails Helpers
;;;
(defun rr-passenger:start ()
  "Fire up an instance of a Passenger server"
  (interactive)
  (let ((buffer (shell "*Passenger Rails Server at port 8080*")))

    (set (make-local-variable 'comint-output-filter-functions)
         '(comint-truncate-buffer
           comint-postoutput-scroll-to-bottom
           ansi-color-process-output
           ))
    (set (make-local-variable 'comint-buffer-maximum-size) 5000)
    (set (make-local-variable 'comint-scroll-show-maximum-output) t)
    (set (make-local-variable 'comint-scroll-to-bottom-on-output) 'others)

    (ansi-color-for-comint-mode-on)
    (compilation-shell-minor-mode 1)
    (comint-send-string buffer (concat "passenger start -p 3000 -e development" "\n"))))

(defun rr-console:start ()
  "Fire up a Rails Console"
  (interactive)
  (let ((buffer (shell "*Rails Console*")))

    (set (make-local-variable 'comint-output-filter-functions)
         '(comint-truncate-buffer
           comint-postoutput-scroll-to-bottom
           ansi-color-process-output
           ))
    (set (make-local-variable 'comint-buffer-maximum-size) 5000)
    (set (make-local-variable 'comint-scroll-show-maximum-output) t)
    (set (make-local-variable 'comint-scroll-to-bottom-on-output) 'others)

    (ansi-color-for-comint-mode-on)
    (compilation-shell-minor-mode 1)
    (comint-send-string buffer (concat "rails console" "\n"))))

(defun find-rails-root (&optional dir)
  (or dir (setq dir default-directory))
  (if (file-exists-p (concat dir "config/environment.rb"))
      dir
    (if (equal dir  "/")
	nil
      (find-rails-root (expand-file-name (concat dir "../"))))))

(defun rr-init()
  "Rails init default stuff."
  (interactive)
  (rr-console:start))

(provide 'jp-rails-helpers)