;;jp-ruby-helpers.el ----------------------------------------------------------------------------
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

(defun pcomplete/rake ()
  "Completion rules for the `ssh' command."
  (pcomplete-here (pcmpl-rake-tasks)))

(defun pcmpl-rake-tasks ()
  "Return a list of all the rake tasks defined in the current
projects.  I know this is a hack to put all the logic in the
exec-to-string command, but it works and seems fast"
  (delq nil (mapcar '(lambda(line)
                       (if (string-match "rake \\([^ ]+\\)" line) (match-string 1 line)))
                    (split-string (shell-command-to-string "rake -T") "[\n]"))))

(defun rake (task)
  (interactive (list (completing-read "Rake (default: default): "
                                      (pcmpl-rake-tasks))))
  (shell-command-to-string (concat "rake " (if (= 0 (length task)) "default" task))))

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

(defun senny-ruby-compilation-this-buffer ()
  (interactive)
  (save-buffer)
  (let ((origin (current-buffer)))
    (ruby-compilation-this-buffer)
    (pop-to-buffer origin)))

(defun senny-ruby-eval-buffer ()
  (interactive)
  (ruby-send-region-and-go (point-min) (point-max)))

(defun ruby-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (when (and
         (looking-back "\".*")
         (looking-at ".*\""))
    (insert "{}")
    (backward-char 1)))

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

;; TODO Temporary addition
(defun ruby-reindent-then-newline-and-indent ()
  (interactive "*")
  (newline)
  (save-excursion
    (end-of-line 0)
    (indent-according-to-mode)
    (delete-region (point) (progn (skip-chars-backward " \t") (point))))
  (indent-according-to-mode))

;;; ---------------------------------------------------------
;;; - Sinatra
;;; - Nasty hack to add Sinatra blocks to ruby-mode imenu.
;;;
;;; -  Basically, makes it easy to jump between Sinatra URL handlers
;;; -  with Chris Wanstrath's textmate.el or the normal imenu.
;;;
;;; - AUTHOR:
;;; -  Geoffrey Grosenbach http://peepcode.com
;;;
;;; - Matches things like:
;;;
;;; -  get "/foo" do
;;; -  put /eat\/(bacon)/ do |meat|
;;;
(defun ruby-sinatra-imenu-create-index ()
  "Create an imenu index of all methods in the buffer."
  (nreverse (ruby-sinatra-imenu-create-index-in-block nil (point-min) nil)))

;;; ----------------------------------------------------------------------------
;;; - HACK Copied from ruby-mode.el
;;;
(defun ruby-sinatra-imenu-create-index-in-block (prefix beg end)
  "Create an imenu index of methods inside a block."
  (let ((index-alist '()) (case-fold-search nil)
        name next pos decl sing)
    (goto-char beg)
    ;; Nasty
    ;; TODO: Look for MacRuby-style named parameters, too.
    (while (re-search-forward "^\\s *\\(\\(class\\s +\\|\\(class\\s *<<\\s *\\)\\|module\\s +\\)\\([^\(<\n ]+\\)\\|\\(def\\|alias\\)\\s +\\([^\(\n ]+\\)\\|\\(get\\|post\\|put\\|delete\\)\\s +\\([^ ]+\\)\\)" end t)
      (setq sing (match-beginning 3))
      (setq decl (match-string 5))
      (setq next (match-end 0))
      (setq name (or (match-string 4) (match-string 6) (match-string 8)))
      (setq http-method (match-string 7))
      (setq pos (match-beginning 0))
      (cond
       ;; Adds "get 'foo'" to the list of methods
       (http-method
        (push (cons (concat http-method " " name) pos) index-alist))
       ((string= "alias" decl)
        (if prefix (setq name (concat prefix name)))
        (push (cons name pos) index-alist))
       ((string= "def" decl)
        (if prefix
            (setq name
                  (cond
                   ((string-match "^self\." name)
                    (concat (substring prefix 0 -1) (substring name 4)))
                   (t (concat prefix name)))))
        (push (cons name pos) index-alist)
        (ruby-accurate-end-of-block end))
       (t
        (if (string= "self" name)
            (if prefix (setq name (substring prefix 0 -1)))
          (if prefix (setq name (concat (substring prefix 0 -1) "::" name)))
          (push (cons name pos) index-alist))
        (ruby-accurate-end-of-block end)
        (setq beg (point))
        (setq index-alist
              (nconc (ruby-sinatra-imenu-create-index-in-block
                      (concat name (if sing "." "#"))
                      next beg) index-alist))
        (goto-char beg))))
    index-alist))

(add-hook 'ruby-mode-hook
          (function (lambda ()
                      (setq imenu-create-index-function 'ruby-sinatra-imenu-create-index)
                      )))

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