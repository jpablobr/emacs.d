(require 'anything)
(require 'yasnippet)
(defun ays:candidates ()
  (with-current-buffer anything-current-buffer
    (yas/all-templates (yas/get-snippet-tables))))
(defun ays:real-to-display (template)
  (format "%s: %s"
          (file-name-nondirectory (yas/template-file template))
          (yas/template-name template)))
(defun ays:candidate-transformer (templates)
  (mapcar (lambda (template) (cons (ays:real-to-display template) template))
          templates))

;; http://www.rubyist.net/~rubikitch/archive/anything-c-yasnippet-2.el
(defvar anything-c-source-yasnippet
  '((name . "Yasnippet (reimplemented)")
    (candidates . ays:candidates)
    ;; FIXME real-to-display has a bug
    ;; (real-to-display . ays:real-to-display)
    (candidate-transformer . ays:candidate-transformer)
    (candidate-number-limit . 10)
    (action
     ("expand" . (lambda (template)
                   (yas/expand-snippet (yas/template-content template))))
     ("open snippet file" . yas/visit-snippet-file-1))
    (persistent-action . (lambda (template)
                           (letf (((symbol-function 'find-file-other-window)
                                   (symbol-function 'find-file)))
                             (yas/visit-snippet-file-1 template))))))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Interactive
(defun jp-anything-regexp ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-regexp)
   " *Anything Regexp*"))

(defun jp-anything-git-goto ()
  "Find a file from current git repo."
  (interactive)
  (setq buff-name
        (concat "*Git goto in: " (find-git-repo default-directory) " *"))
  (anything-other-buffer
   '((name . "Git goto")
     (init
      . (lambda ()
          (call-process-shell-command
           (format "cd %s && git ls-files -cmo --exclude-standard --directory"
                   (jp-find-git-repo default-directory))
           nil (anything-candidate-buffer 'global))))
     (candidate-number-limit . 9999)
     (candidates-in-buffer)
     (action . jp-goto))
   buff-name)
  (kill-buffer buff-name))

(defun jp-anything-shell-commands ()
  "Find available commands from $PATH."
  (interactive)
  (setq buff-name
        (concat "*Anything run shell command in: " default-directory " *"))
  (anything-other-buffer
   '((name . "Anything shell Commands")
     (init
      . (lambda ()
          (call-process-shell-command "compgen -abck"
                                      nil (anything-candidate-buffer 'global))))
     (candidate-number-limit . 9999)
     (candidates-in-buffer)
     (action . (lambda (candidate)
                 (let (args)
                   (setq args
                         (read-from-minibuffer (concat "Run cmd as such: " candidate)
                                                 (thing-at-point 'symbol)))
                   (compilation-start (concat candidate args))))))
   buff-name)
  (kill-buffer buff-name))

(defun jp-anything-code ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-imenu
     anything-c-source-browse-code
     anything-c-source-mark-ring
     anything-c-source-global-mark-ring
     anything-c-source-kill-ring
     anything-c-source-occur
     anything-c-source-etags-select
     anything-c-source-yasnippet
     anything-c-source-semantic
     anything-c-source-rd-headline
     anything-c-source-oddmuse-headline
     anything-c-source-fixme)
   " *Anything Code*"))

(defun jp-anything-kill-ring ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-kill-ring)
   " *Anything Kill Ring*"))

(defun jp-anything-yasnippet ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-yasnippet)
   " *Anything yasnippet*"))

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
