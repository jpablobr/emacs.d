(setq js-dir (concat vendor-dir "/js"))
(add-to-list 'load-path js-dir)
(defvar preferred-javascript-mode 'js2-mode)
(defvar preferred-mmm-javascript-mode 'js2-mode)
(defvar preferred-javascript-indent-level 2)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; On-the-fly syntax checking
(autoload 'flymake-js-load "flymake-js" "On-the-fly syntax checking of javascript" t)
(eval-after-load "js"
  '(progn
     (add-hook 'js-mode-hook 'flymake-js-load)))

(setq js2-use-font-lock-faces t)
(setq js2-mode-must-byte-compile nil)
(setq js2-basic-offset preferred-javascript-indent-level)
(setq js2-indent-on-enter-key t)
(setq js2-auto-indent-p t)
(setq js2-auto-indent-flag nil)

(setq jpablobr-js-imenu-generic-expression
      '(("Named Function" "function\\s-+\\(\\w+\\)\\s-*(" 1)
        ("Hash Method"  "^\\s-*\\(\\w+\\):\\s-*function\\s-*(" 1)
        ("Instance Method" "this\.\\(\\w+\\)\\s-*=\\s-*function\\s-*(" 1)
        ("Variable as Class" "var \\([A-Z]+\\w+\\) = {" 1)
        ("Assigned Function" "^\\s-*\\([A-z.]+\\w\\) = function\\s-*(.*) {" 1)
        ))

(setq js-indent-level preferred-javascript-indent-level)

(setq javascript-indent-level preferred-javascript-indent-level)

(eval-after-load "coffee-mode"
  `(setq coffee-js-mode preferred-javascript-mode
         coffee-tab-width preferred-javascript-indent-level))

(require 'js-comint)
(setq inferior-js-program-command "js")
(defun add-inferior-js-keys ()
  (local-set-key "\C-x\C-e" 'js-send-last-sexp)
  (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
  (local-set-key "\C-cb" 'js-send-buffer)
  (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
  (local-set-key "\C-cl" 'js-load-file-and-go))
(add-hook 'js2-mode-hook 'add-inferior-js-keys)
(add-hook 'js-mode-hook 'add-inferior-js-keys)

(autoload 'inferior-moz-mode "moz" "MozRepl Inferior Mode" t)
(autoload 'moz-minor-mode "moz" "MozRepl Minor Mode" t)
(defun javascript-moz-setup () (moz-minor-mode 1))
(add-hook 'js2-mode-hook 'javascript-moz-setup)
(add-hook 'js-mode-hook 'javascript-moz-setup)

(eval-after-load 'js2-mode
  '(progn
     (font-lock-add-keywords
      'js2-mode `(("\\(function *\\)("
                   (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                             "ƒ")
                             nil)))))

     (defun js-lambda () (interactive) (insert "function () {\n}")
       (backward-char 5))

     (define-key js2-mode-map (kbd "TAB") (lambda () (interactive)
                                            (indent-for-tab-command)
                                            (back-to-indentation)))
     (setq js2-bounce-indent-flag nil
           js2-indent-on-enter-key t)))

(add-hook 'javascript-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (let ((file (file-name-nondirectory buffer-file-name)))
                   (concat "java -classpath ~/src/rhino1_7R2/build/classes org.mozilla.javascript.tools.shell.Main ~/bin/src/jslint.js " file)))))

(autoload 'javascript-shell "javascript-mode" nil t)

(defun js2-insert-console ()
  (interactive)
  (insert "console.log()")
  (backward-char))

(defun js2-execute-buffer ()
  (interactive)
  (shell-command (concat "johnson " (buffer-file-name))))

(defun js2-execute-line ()
  (interactive)
  (save-excursion
    (call-process-region (point-at-bol)
                         (point-at-eol)
                         "johnson"
                         nil
                         (get-buffer-create "*johnson-line*"))
    (with-current-buffer (get-buffer "*johnson-line*")
      (search-backward "\n\n" nil t)
      (replace-match "" nil t)
      (message (buffer-string))
      (kill-buffer nil))))

(add-hook 'js2-mode-hook
          '(lambda ()
             (add-hook 'before-save-hook 'delete-trailing-whitespace)
             (define-key js2-mode-map (kbd "A-r") 'js2-execute-buffer)
             (define-key js2-mode-map (kbd "A-R") 'js2-execute-line)
             (define-key js2-mode-map "\C-L" 'js2-insert-console)
             (defun js-continued-var-decl-list-p ()
               "Return non-nil if point is inside a continued variable declaration list."
               (interactive)
               (let ((start (save-excursion (js-re-search-backward "\\<var\\>" nil t))))
                 (and start
                      (save-excursion (re-search-backward "\n" start t))
                      (not (save-excursion
                             (js-re-search-backward
                              ";\\|[^, \t][ \t]*\\(/[/*]\\|$\\)" start t))))))
             (defun js-proper-indentation (parse-status)
             "Return the proper indentation for the current line."
             (save-excursion
               (back-to-indentation)
               (let ((ctrl-stmt-indent (js-ctrl-statement-indentation))
                     (same-indent-p (looking-at "[]})]\\|\\<case\\>\\|\\<default\\>"))
                     (continued-expr-p (js-continued-expression-p)))
                 (cond (ctrl-stmt-indent)
                       ((js-continued-var-decl-list-p)
                        (js-re-search-backward "\\<var\\>" nil t)
                        (+ (current-indentation) js2-basic-offset))
                       ((nth 1 parse-status)
                        (goto-char (nth 1 parse-status))
                        (if (looking-at "[({[][ \t]*\\(/[/*]\\|$\\)")
                            (progn
                              (skip-syntax-backward " ")
                              (when (= (char-before) ?\)) (backward-list))
                              (back-to-indentation)
                              (cond (same-indent-p
                                     (current-column))
                                    (continued-expr-p
                                     (+ (current-column) (* 2 js2-basic-offset)))
                                    (t
                                     (+ (current-column) js2-basic-offset))))
                          (unless same-indent-p
                            (forward-char)
                            (skip-chars-forward " \t"))
                          (current-column)))
                       (continued-expr-p js2-basic-offset)
                       (t 0)))))))

(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"

  (imenu-add-to-menubar "IMENU")
  ;; If you don't want your compiled files to be wrapped
  (setq coffee-args-compile '("-c" "--bare"))
  ;; *Messages* spam
  (setq coffee-debug-mode t)
  ;; Compile '.coffee' files on every save
  (add-hook 'after-save-hook
      '(lambda ()
         (when (string-match "\.coffee$" (buffer-name))
          (coffee-compile-file)))))

(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))
