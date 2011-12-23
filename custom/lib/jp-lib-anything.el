(defun jp-find-git-repo (dir)
  "Recursively search for a .git/ directory."
  (if (string= "/" dir)
      (message "not in a git repo.")
    (if (file-exists-p (expand-file-name ".git/" dir))
        dir
      (git-show/find-git-repo (expand-file-name "../" dir)))))

(defun jp-goto  (file-content)
  "Visit the source for the file result."
  (funcall 'find-file
           (expand-file-name file-content
                             (expand-file-name
                              (git-show/find-git-repo file-content)
                              (anything-attr 'pwd)))))

(defun jp-anything-find-rake-tasks ()
  "Rake tasks."
  (setq mode-line-format
        '(" " mode-line-buffer-identification " "
          (line-number-mode "%l") " "
          (:eval (propertize "(Rake -T Process Running) "
                             'face '((:foreground "red"))))))
  (setq cmd "rake -T")
  (prog1
      (start-process-shell-command "rake-tasks-process" nil cmd)

    (set-process-sentinel (get-process "rake-tasks-process")
                          #'(lambda (process event)
                              (when (string= event "finished\n")
                                (kill-local-variable 'mode-line-format)
                                (with-anything-window
                                  (anything-update-move-first-line)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Interactive
(defun jp-anything-regexp ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-regexp)
   " *Anything Regexp*"))

(defun jp-anything-rake ()
  "Return a list of all the rake tasks defined in the current
projects.  I know this is a hack to put all the logic in the
exec-to-string command, but it works and seems fast"
  (interactive)
  (anything-other-buffer
   '((name . "Anything Rake")
     (candidates . jp-anything-find-rake-tasks)
     (candidate-number-limit . 9999)
     (candidates-in-buffer)
     (action . (lambda (candidate)
                 (if (string-match "rake \\([^ ]+\\)" candidate)
                     (compile (concat "rake " (match-string 1 candidate)))))))
   "*Anythig Rake*"))

(defun jp-anything-git-goto ()
  "Find a file from current git repo."
  (interactive)
  (anything-other-buffer
   '((name . "Git goto")
     (init
      . (lambda ()
          (call-process-shell-command
           (format "cd %s && git ls-files"
                   (jp-find-git-repo default-directory))
           nil (anything-candidate-buffer 'global))))
     (candidate-number-limit . 9999)
     (candidates-in-buffer)
     (action . jp-goto))
   "*Git goto*"))

(defun jp-anything-code ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-imenu
     anything-c-source-occur
     anything-c-source-etags-select
     anything-c-source-semantic
     anything-c-source-browse-code
     anything-c-source-rd-headline
     anything-c-source-oddmuse-headline
     anything-c-source-mark-ring
     anything-c-source-fixme)
   " *Anything Code*"))

(defun jp-anything-kill-ring ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-kill-ring)
   " *Anything Kill Ring*"))

(defun jp-anything-info ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-info-sed
     anything-c-source-info-bash
     anything-c-source-info-wget
     anything-c-source-info-make
     anything-c-source-info-gawk
     anything-c-source-info-grep
     anything-c-source-info-emacs
     anything-c-source-info-find
     anything-c-source-info-autoconf
     anything-c-source-info-automake
     anything-c-source-info-coreutils
     ;; anything-c-source-info-info
     ;; anything-c-source-info-as
     ;; anything-c-source-info-gzip
     ;; anything-c-source-info-libc
     ;; anything-c-source-info-libtool
     ;; anything-c-source-info-binutils
     ;; anything-c-source-info-ld
     ;; anything-c-source-info-m4
     ;; anything-c-source-info-cl
     ;; anything-c-source-info-bfd
     ;; do not work:
     ;; anything-c-source-info-stabs
     ;; anything-c-source-info-gdb
     ;; anything-c-source-info-diff
     ;; anything-c-source-info-global
     ;; anything-c-source-info-sh-utils
     ;; anything-c-source-info-emacs-lisp-intro
     )
   " *Anything info*"))

(provide 'jp-lib-anything)
