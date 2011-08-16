;;jp-ruby-helpers.el ---------------------------------------------------
;;; - Ruby helper functions
;;;
(require 'font-lock)
(load-library "rubydb3x")

(defun ri-bind-key ()
  (local-set-key [f1] 'yari-anything))

(defalias 'rails-search-doc 'yari)

;; Inferion ruby
(add-to-list 'hs-special-modes-alist
             '(ruby-mode
               "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
               (lambda (arg) (ruby-end-of-block)) nil))

;; Clear the compilation buffer between test runs.
(eval-after-load 'ruby-compilation
  '(progn
     (defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
       (let ((comp-buffer-name (format "*%s*" name)))
         (when (get-buffer comp-buffer-name)
           (with-current-buffer comp-buffer-name
             (delete-region (point-min) (point-max))))))
     (ad-activate 'ruby-do-run-w/compilation)))

(defun flymake-ruby-enable ()
  (when (and buffer-file-name
             (file-writable-p
              (file-name-directory buffer-file-name))
             (file-writable-p buffer-file-name)
             (if (fboundp 'tramp-list-remote-buffers)
                 (not (subsetp
                       (list (current-buffer))
                       (tramp-list-remote-buffers)))
               t))
    (local-set-key (kbd "C-c d")
                   'flymake-display-err-menu-for-current-line)
    (flymake-mode t)))

;;;; Flymake
(eval-after-load 'ruby-mode
  '(progn
     ;; Libraries
     (require 'flymake)

     ;; Invoke ruby with '-c' to get syntax checking
     (defun flymake-ruby-init ()
       (let* ((temp-file (flymake-init-create-temp-buffer-copy
                          'flymake-create-temp-inplace))
              (local-file (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
         (list "ruby" (list "-c" local-file))))

     (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

     (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)
           flymake-err-line-patterns)

     (add-hook 'ruby-mode-hook
               (lambda ()
                 (when (and buffer-file-name
                            (file-writable-p
                             (file-name-directory buffer-file-name))
                            (file-writable-p buffer-file-name)
                            (if (fboundp 'tramp-list-remote-buffers)
                                (not (subsetp
                                      (list (current-buffer))
                                      (tramp-list-remote-buffers)))
                              t))
                   (local-set-key (kbd "C-c d")
                                  'flymake-display-err-menu-for-current-line)
                   (flymake-mode t))))))

(require 'ruby-electric)

(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

(defun rel ()
  "Toggle Ruby electric mode (shortcut)"
  (interactive)
  (ruby-electric-mode))

;;;---------------------------------------------------------------------
;;; TestUnit Compilation Patterns
;;; Add the compilation patterns used by Test::Unit to the list of
;;; those recognized by emacs.

;(setq compilation-error-regexp-alist
;      (cons
;       '("^	\\([^:]+\\):\\([0-9]+\\):in" 1 2)
;       compilation-error-regexp-alist))

(setq compilation-error-regexp-alist
      (cons
       '("^\\(Failure\\|Error\\) occurred in .*\\[\\([^:]+\\):\\([0-9]+\\)\\]" 2 3)
       compilation-error-regexp-alist))

;;; Better Comment Paragraph Filling ---------------------------------

(defvar jp-rb-para-begin-re "\\(^\\s-*#*\\s-*$\\)\\|\\(^\\s-*[^# ]\\)")

(defun jp-rb-goto-para-begin ()
  (search-backward-regexp jp-rb-para-begin-re)
  (beginning-of-line)
  (forward-line 1) )

(defun jp-rb-goto-para-end ()
  (search-forward-regexp jp-rb-para-begin-re)
  (beginning-of-line) )

(defun jp-rb-fill-comment-region ()
  (interactive)
  (save-excursion
    (jp-rb-goto-para-begin)
    (let ((start (point)))
      (jp-rb-goto-para-end)
      (narrow-to-region start (point))
      (fill-region start (point))
      (widen) ) ))

;;; Setup for RDebug -------------------------------------------------

(defun jp-starts-with (prefix string)
  "Does STRING begin with PREFIX?"
  (cond ((< (length string) (length prefix)) nil)
        ((string-equal prefix (substring string 0 (length prefix))) t)
        (t nil) ))

(defun jp-find-gud-buffer1 (bufs)
  (cond ((null bufs)())
        ((jp-starts-with "*gud-"(buffer-name (car bufs)))
         (car bufs))
        (t (jp-find-gud-buffer1 (cdr bufs))) ))

(defun jp-find-gud-buffer ()
  "Find the GUD interaction buffer, nil if not found."
  (jp-find-gud-buffer1 (buffer-list)) )

(defun jp-select-gud-buffer ()
  "Select the GUD interaction buffer."
  (interactive)
  (let ((gud-buffer (jp-find-gud-buffer)))
    (if (null gud-buffer)
        (message "No gud buffer found.")
      (pop-to-buffer gud-buffer)
      (goto-char (point-max)) )))

(defun rdebug-rails ()
  (interactive)
  (rdebug "rdebug script/server")
  (insert "e Dir.chdir('..')") )

(defun rd () (interactive) (rdebug))
(defun rdr () (interactive) (rdebug-rails))

;;; Auto loads -------------------------------------------------------

(add-hook 'ruby-mode-hook 'font-lock-fontify-buffer)
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys) ))
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode 0)))
(add-hook 'ruby-mode-hook '(lambda ()
                             (add-hook
                              (cond ((boundp 'before-save-hook)
                                     (make-local-variable 'before-save-hook)
                                     'before-save-hook)
                                    ((boundp 'write-contents-functions) 'write-contents-functions)
                                    ((boundp 'write-contents-hooks) 'write-contents-hooks))
                              'delete-trailing-whitespace)))

(provide 'jp-ruby-helpers)
