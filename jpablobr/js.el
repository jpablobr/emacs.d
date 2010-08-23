;;; js.el --- Some helpful Javascript helpers

(autoload 'espresso-mode "espresso" nil t)

(eval-after-load 'js2-mode
  '(progn

     ;; Cosmetics
     (font-lock-add-keywords
      'js2-mode `(("\\(function *\\)("
                   (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                             "ƒ")
                             nil)))))

     (font-lock-add-keywords
      'js2-mode
      '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
         1 font-lock-warning-face t)))

     (defun js-lambda () (interactive) (insert "function () {\n}")
       (backward-char 5))

     (define-key js2-mode-map (kbd "C-c l") 'js-lambda)
     (define-key js2-mode-map "\C-\M-h" 'backward-kill-word)
     (define-key js2-mode-map (kbd "TAB") (lambda () (interactive)
                                            (indent-for-tab-command)
                                            (back-to-indentation)))

     (add-hook 'js2-mode-hook 'coding-hook)
     (setq js2-bounce-indent-flag nil
           js2-indent-on-enter-key t)))


;; DESCRIPTION:
;;   Useful patterns for using the ido menu with Javascript files.
;;
;; AUTHOR:
;;   Geoffrey Grosenbach http://peepcode.com
;;
;; Matches things like:
;;
;;   function bacon() {}        // Standard function
;;   getJSON: function () {}    // Function as a key in a hash
;;   this.post = function () {} // Instance method in a function
;;   var MyObj = { ...          // Capitalized variable object 
;;
;; USAGE:
;;   (require 'js)

(setq js2-basic-offset 2)
(setq js2-auto-indent-flag nil)
(setq javascript-indent-level 2)

(setq jpablobr-js-imenu-generic-expression
      '(("Named Function" "function\\s-+\\(\\w+\\)\\s-*(" 1)
        ("Hash Method"  "^\\s-*\\(\\w+\\):\\s-*function\\s-*(" 1)
        ("Instance Method" "this\.\\(\\w+\\)\\s-*=\\s-*function\\s-*(" 1)
        ("Variable as Class" "var \\([A-Z]+\\w+\\) = {" 1)
        ("Assigned Function" "^\\s-*\\([A-z.]+\\w\\) = function\\s-*(.*) {" 1)
        ))

(add-hook 'javascript-mode-hook
          (lambda ()
            (setq imenu-generic-expression jpablobr-js-imenu-generic-expression)))

;; Run jslint on a file to check syntax and coding conventions.
(add-hook 'javascript-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (let ((file (file-name-nondirectory buffer-file-name)))
                   (concat "java -classpath ~/src/rhino1_7R2/build/classes org.mozilla.javascript.tools.shell.Main ~/bin/src/jslint.js " file)))))



;;JS2 MODE
;;  M-x byte-compile-file RE js2.el RET
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
          '(lambda ()
             (setq yas/mode-symbol 'espresso-mode)))

; js-shell
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
               "Return non-nil if point is inside a continued variable declaration
list."
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


(provide 'js)
;;; js.el ends here