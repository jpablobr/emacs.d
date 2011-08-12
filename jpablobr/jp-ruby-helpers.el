;;jp-ruby-helpers.el ---------------------------------------------------
;;; - Ruby helper functions
;;;
(defun ri-bind-key ()
  (local-set-key [f1] 'yari-anything))

(defalias 'rails-search-doc 'yari)

;; Add binding to insert ruby debugger with F7.
(defun GAU-insert-ruby-debug ()
  (interactive)
  (let ((ruby-debug-string "require 'ruby-debug'; debugger; stop_here = 1;\n"))
    (insert ruby-debug-string))
  (previous-line)
  (ruby-indent-line))

(defun GAU-bind-insert-ruby-debug-key ()
  (local-set-key [f7] 'GAU-insert-ruby-debug))

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

;; (defun senny-ruby-compilation-this-buffer ()
;;   (interactive)
;;   (save-buffer)
;;   (let ((origin (current-buffer)))
;;     (ruby-compilation-this-buffer)
;;     (pop-to-buffer origin)))

;; (defun senny-ruby-eval-buffer ()
;;   (interactive)
;;   (ruby-send-region-and-go (point-min) (point-max)))

;; (defun ruby-interpolate ()
;;   "In a double quoted string, interpolate."
;;   (interactive)
;;   (insert "#")
;;   (when (and
;;          (looking-back "\".*")
;;          (looking-at ".*\""))
;;     (insert "{}")
;;     (backward-char 1)))

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

;; ;; TODO Temporary addition
;; (defun ruby-reindent-then-newline-and-indent ()
;;   (interactive "*")
;;   (newline)
;;   (save-excursion
;;     (end-of-line 0)
;;     (indent-according-to-mode)
;;     (delete-region (point) (progn (skip-chars-backward " \t") (point))))
;;   (indent-according-to-mode))

(defun decamelize (string)
  "Convert from CamelCaseString to camel_case_string."
  (let ((case-fold-search nil))
    (downcase
     (replace-regexp-in-string
      "\\([A-Z]+\\)\\([A-Z][a-z]\\)" "\\1_\\2"
      (replace-regexp-in-string
       "\\([a-z0-9]\\)\\([A-Z]\\)" "\\1_\\2"
       string)))))

(provide 'jp-ruby-helpers)