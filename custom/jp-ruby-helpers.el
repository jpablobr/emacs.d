;; jp-ruby-helpers.el ---------------------------------------------------
;;; - Ruby helper functions
;;;
(require 'font-lock)
(load-library "rubydb3x")

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

(setq
 nxhtml-global-minor-mode t
 mumamo-chunk-coloring 'submode-colored
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))

(eval-after-load "mmm-vars"
  '(progn
     (mmm-add-classes
      '((eruby :submode ruby-mode :front "<%[#=]?" :back "-?%>"
               :match-face (("<%#" . mmm-comment-submode-face)
                            ("<%=" . mmm-output-submode-face)
                            ("<%"  . mmm-code-submode-face))
               :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
                        (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
                        (?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @)))))
     (dolist (mode (list 'html-mode 'nxml-mode))
       (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?$" 'eruby))
     (mmm-add-mode-ext-class 'yaml-mode "\\.yaml$" 'eruby)
     (dolist (mode (list 'js-mode 'js2-mode))
       (mmm-add-mode-ext-class mode "\\.js\\.erb$" 'eruby))))

;(require 'mumamo-fun)
;(setq mumamo-chunk-coloring 'submode-colored)
;(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . eruby-html-mumamo))
;(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-html-mumamo))

(add-hook 'rhtml-mode-hook
					(lambda () (rinari-launch)))

;;; Auto loads -------------------------------------------------------

(add-hook 'ruby-mode-hook 'font-lock-fontify-buffer)
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys) ))
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

(defun r-tmp-test ()
  "Open a tmp test.rb file."
  (interactive)
  (when (file-exists-p "~/tmp")
    (find-file "~/tmp/test/tmp_test.rb")))

(defun r-koans ()
  "Run the current buffer in a ruby subprocess."
  (interactive)
  (compilation-start
   (concat "/usr/bin/env ruby " "./path_to_enlightenment.rb")
   nil
   (lambda (x) "*Ruby Koans Path*")))

(defun r-rhtml ()
  "Load rhtml mode"
  (interactive)
  (add-to-list 'load-path (concat ruby-dir "/rhtml"))
  (require 'rhtml-mode))

(defvar ruby-debugging-regex "DBG:"
  "Regex that matches debuggin statments.")

(defun r-find-debugging (&optional arg)
  "Search through the rails project for a debug statemens"
  (interactive)
  (grep-compute-defaults)
  (if arg (call-interactively 'rgrep)
    (let ((query))
      (if mark-active
          (setq query (buffer-substring-no-properties (point) (mark)))
        (setq query (thing-at-point 'word)))
      (funcall 'rgrep ruby-debugging-regex
               rinari-rgrep-file-endings (rinari-root)))))

(add-hook 'ruby-mode-common-hook
          '(lambda ()
             ;; ac-omni-completion-sources is made buffer local so
             ;; you need to add it to a mode hook to activate on
             ;; whatever buffer you want to use it with.  This
             ;; example uses C mode (as you probably surmised).
             ;; auto-complete.el expects ac-omni-completion-sources to be
             ;; a list of cons cells where each cell's car is a regex
             ;; that describes the syntactical bits you want AutoComplete
             ;; to be aware of. The cdr of each cell is the source that will
             ;; supply the completion data.  The following tells autocomplete
             ;; to begin completion when you type in a . or a ->
             (add-to-list 'ac-omni-completion-sources
                          (cons "\\." '(ac-source-semantic)))
             (add-to-list 'ac-omni-completion-sources
                          (cons "->" '(ac-source-semantic)))
             ;; ac-sources was also made buffer local in new versions of
             ;; autocomplete.  In my case, I want AutoComplete to use
             ;; semantic and yasnippet (order matters, if reversed snippets
             ;; will appear before semantic tag completions).
             (setq ac-sources '(ac-source-semantic
                                ac-source-yasnippet
                                ac-source-filename
                                ac-source-functions
                                ac-source-variables
                                ac-source-symbols
                                ac-source-features
                                ac-source-abbrev
                                ac-source-words-in-same-mode-buffers
                                ac-source-semantic
                                ac-source-semantic-raw
                                ac-source-dictionary))))

(provide 'jp-ruby-helpers)