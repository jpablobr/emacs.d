;;jp-defuns.el ---------------------------------------------------------
;; - Custom functions
;;; ----------------------------------------------------------------------------
;;; - Transparency helper functions
;;;
(defun transparency ()
  "Sets transparency"
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(85 85))
  (add-to-list 'default-frame-alist '(alpha 85 85)))

(defun reset-transparency ()
  "Resets transparency"
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(100 100))
  (add-to-list 'default-frame-alist '(alpha 100 100)))

;;; ----------------------------------------------------------------------------
;;; - Makes load time faster.
;;;
(defun byte-recompile-home ()
  (interactive)
  (byte-recompile-directory "~/.emacs.d" 0))

;;; ----------------------------------------------------------------------------
;;; - Jump to matching parent
;;;
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;;; ----------------------------------------------------------------------------
;;; - Network
;;;
(defun view-url ()
  "Open a new buffer containing the contents of URL."
  (interactive)
  (let* ((default (thing-at-point-url-at-point))
         (url (read-from-minibuffer "URL: " default)))
    (switch-to-buffer (url-retrieve-synchronously url))
    (rename-buffer url t)
    ;; TODO: switch to nxml-mode
    (cond ((search-forward "<?xml" nil t) (xml-mode))
          ((search-forward "<html" nil t) (html-mode)))))

;;; ----------------------------------------------------------------------------
;;; - Buffer-related
(defun ido-imenu ()
  "Update the imenu index and then use ido to select a symbol to navigate to."
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))

                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))

                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

;; (defun coding-hook ()
;;   "Enable things that are convenient across all coding buffers."
;;   (set (make-local-variable 'comment-auto-fill-only-comments) t)
;;   (make-local-variable 'column-number-mode)
;;   (column-number-mode t)
;;   (setq save-place t)
;;   (auto-fill-mode) ;; in comments only
;;   (if window-system (hl-line-mode t))
;;   (pretty-lambdas)
;;   ;; TODO: this breaks in js2-mode!
;;   ;;(if (functionp 'idle-highlight) (idle-highlight))
;;   )

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

;;; ----------------------------------------------------------------------------
;;; - Cosmetic
;;;
(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))


(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun switch-or-start (function buffer)
  "If the buffer is current, bury it, otherwise invoke the function."
  (if (equal (buffer-name (current-buffer)) buffer)
      (bury-buffer)
    (if (get-buffer buffer)
        (switch-to-buffer buffer)
      (funcall function))))

(defun delete-current-file ()
  "Delete the file associated with the current buffer.
Delete the current buffer too."
  (interactive)
  (let (currentFile)
    (setq currentFile (buffer-file-name))
    (when (yes-or-no-p (concat "Delete file: " currentFile))
      (kill-buffer (current-buffer))
      (delete-file currentFile)
      (message (concat "Deleted file: " currentFile)) ) ) )

(defun open-in-desktop ()
  "Open the current file in visual env"
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (w32-shell-execute "explore"
                       (replace-regexp-in-string "/" "\\" default-directory t t)))
   ((string-equal system-type "gnu/linux") (shell-command "gnome-open ."))))

;;; ---------------------------------------------------------
;;; - Browser
;;;
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

(defun w3m-google-s (what)
  "Use google to search for WHAT."
  (interactive "sSearch: ")
  (w3m-browse-url (concat "http://www.google.com/search?q="
                          (w3m-url-encode-string what))))

(defun w3m-synonym-s (what)
  "Use synonym.com to search for WHAT."
  (interactive "sSearch: ")
  (w3m-browse-url (concat "http://www.synonym.com/synonyms/"
                          (w3m-url-encode-string what))))

(defun w3m-definition-s (what)
  "Use dictionary.reference.com  to search for WHAT."
  (interactive "sSearch: ")
  (w3m-browse-url (concat "http://dictionary.reference.com/browse/"
                          (w3m-url-encode-string what))))

(defun github-s (what)
  "Use github to search for WHAT."
  (interactive "sSearch: ")
  (setq myword (replace-regexp-in-string " " "%20" what))
  (setq myurl (concat "https://github.com/search?q=" myword))
  (browse-url myurl))

(defun github-user (what)
  "Use github to search for WHAT user."
  (interactive "sSearch: ")
  (setq myword (replace-regexp-in-string " " "%20" what))
  (setq myurl (concat "https://github.com/" myword))
  (browse-url myurl))

(defun google-file (file)
  "Use google to search for a file named FILE."
  (interactive "sSearch for file: ")
  (w3m-browse-url
   (concat "http://www.google.com/search?q="
           (w3m-url-encode-string
            (concat "+intitle:\"index+of\" -inurl:htm -inurl:html -inurl:php "
                    file)))))

(defun google-s ()
  "Google search on the current region.\n"
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))

    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat "http://www.google.com/search?q=" myword))
    (browse-url myurl)))

(defun synonym-s ()
  "Synomym search on the current region.\n"
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))

    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat "http://www.synonym.com/synonyms/" myword))
    (browse-url myurl)))

(defun definition-s ()
  "Dictionary search on the current region.\n"
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))

    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat "http://dictionary.reference.com/browse/" myword))
    (browse-url myurl)))

;;; ---------------------------------------------------------
;;; - Insert helper for the lazy.
;;;
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%a %Y-%m-%d - %l:%M %p")))

(defun insert-name ()
  "Insert name at point."
  (interactive)
  (insert user-full-name))

(defun insert-email ()
  "Insert user email at point."
  (interactive)
  (insert user-mail-address))

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'ri-filter-hook 'colorize-compilation-buffer)

(let ((langs '("american" "castellano8" "castellano")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))

(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))
(global-set-key [f6] 'cycle-ispell-languages)

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad "
          "minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun toggle-alternate-file-as-root (&optional filename)
  "Toggle between the current file as the default user and as root."
  (interactive)
  (let* ((filename (or filename (buffer-file-name)))
         (parsed (when (tramp-tramp-file-p filename)
                   (coerce (tramp-dissect-file-name filename)
                           'list))))
    (unless filename
      (error "No file in this buffer."))

    (find-alternate-file
     (if (equal '("sudo" "root") (butlast parsed 2))
         ;; As non-root
         (if (or
              (string= "localhost" (nth 2 parsed))
              (string= (system-name) (nth 2 parsed)))
             (car (last parsed))
           (apply 'tramp-make-tramp-file-name
                  (append (list tramp-default-method nil) (cddr parsed))))
       ;; As root
       (if parsed
           (apply 'tramp-make-tramp-file-name
                  (append '("sudo" "root") (cddr parsed)))
         (tramp-make-tramp-file-name "sudo" nil nil filename))))))

(defun gem-open ()
  "Gem open on current region.\n"
  (interactive)
  (let (mygem (buffer (get-buffer-create "*gem-open*")))
    (setq mygem
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq mygem (replace-regexp-in-string " " "%20" mygem))
    (shell-command (concat "bundle exec gem open " mygem) buffer)))

;; Handier way to add modes to auto-mode-alist
(defun add-auto-mode (mode &rest patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;; escape quotes
(defun escape-quotes-region (start end)
  (interactive "r")
  "Replace \" by \\\"."
  (replace-pairs-region start end '(["\"" "\\\""])))

(defun unescape-quotes-region (start end)
  (interactive "r")
  "Replace \\\" by \"."
  (replace-pairs-region start end '(["\\\"" "\""])))

(defun add-string-to-end-of-lines-in-region (str b e)
  "prompt for string, add it to end of lines in the region"
  (interactive "sWhat shall we append? \nr")
  (goto-char e)
  (forward-line -1)
  (while (> (point) b)
    (end-of-line)
    (insert str)
    (forward-line -1)))

(provide 'jp-defuns)