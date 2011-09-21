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

(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

;;; Auto loads -------------------------------------------------------

(add-hook 'ruby-mode-hook 'font-lock-fontify-buffer)
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys) ))
;; (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode 0)))
(add-hook 'ruby-mode-hook '(lambda ()
                             (add-hook
                              (cond ((boundp 'before-save-hook)
                                     (make-local-variable 'before-save-hook)
                                     'before-save-hook)
                                    ((boundp 'write-contents-functions) 'write-contents-functions)
                                    ((boundp 'write-contents-hooks) 'write-contents-hooks))
                              'delete-trailing-whitespace)))


(defun r-ruby-complexity ()
"Starts ruby complexity"
  (add-to-list 'load-path (concat ruby-dir "/ruby-complexity"))
  (require 'ruby-complexity)
  (interactive)
  (linum-mode)
  (ruby-complexity-mode))

(defun r-pry-console:start ()
  "Fire up a Pry console"
  (interactive)
  (let ((buffer (shell "*Pry*")))
    (set (make-local-variable 'comint-output-filter-functions)
         '(comint-truncate-buffer
           comint-postoutput-scroll-to-bottom
           ansi-color-process-output))
    (set (make-local-variable 'comint-buffer-maximum-size) 5000)
    (set (make-local-variable 'comint-scroll-show-maximum-output) t)
    (set (make-local-variable 'comint-scroll-to-bottom-on-output) 'others)
    (ansi-color-for-comint-mode-on)
    (compilation-shell-minor-mode 1)
    (comint-send-string buffer (concat "pry" "\n"))))

(defun r-guard:start ()
  "Fire up an Guard"
  (interactive)
  (let ((buffer (shell "*Guard*")))

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
    (comint-send-string buffer (concat "guard" "\n"))))

(defun r-init ()
  "Ruby init default stuff."
  (interactive)
  (magit-status "./")
  (autotest)
  (r-pry-console:start)
  (r-guard:start)
  (cheat-fu-deft))

(provide 'jp-ruby-helpers)