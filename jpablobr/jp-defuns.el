;;jp-defuns.el ---------------------------------------------------------
;; - Custom functions
(require 'thingatpt)
(require 'imenu)

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
    ;; TODO: switch to nxml/nxhtml mode
    (cond ((search-forward "<?xml" nil t) (xml-mode))
          ((search-forward "<html" nil t) (html-mode)))))

;;; ----------------------------------------------------------------------------
;;; - Buffer-related
;;;
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

(defun coding-hook ()
  "Enable things that are convenient across all coding buffers."
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (setq save-place t)
  (auto-fill-mode) ;; in comments only
  (if window-system (hl-line-mode t))
  (pretty-lambdas)
  ;; TODO: this breaks in js2-mode!
  ;;(if (functionp 'idle-highlight) (idle-highlight))
  )

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

;; (defun recompile-init ()
;;   "Byte-compile all your dotfiles again."
;;   (interactive)
;;   (byte-recompile-directory dotfiles-dir 0)
;;   ;; TODO: remove elpa-to-submit once everything's submitted.
;;   (byte-recompile-directory (concat dotfiles-dir "/jpablobr" 0)))

;; (defun regen-autoloads (&optional force-regen)
;;   "Regenerate the autoload definitions file if necessary and load it."
;;   (interactive "P")
;;   (let ((autoload-dir (concat dotfiles-dir "/jpablobr"))
;;         (generated-autoload-file autoload-file))
;;     (when (or force-regen
;;               (not (file-exists-p autoload-file))
;;               (some (lambda (f) (file-newer-than-file-p f autoload-file))
;;                     (directory-files autoload-dir t "\\.el$")))
;;       (message "Updating autoloads...")
;;       (update-directory-autoloads autoload-dir)))
;;   (load autoload-file))

;; ;; TODO: fix this
;; (defun sudo-edit (&optional arg)
;;   (interactive "p")
;;   (if arg
;;       (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
;;     (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

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

(defun github-s ()
  "Dictionary search on the current region.\n"
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))

    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat "https://github.com/search?q=" myword))
    (browse-url myurl)))

(defun github-user ()
  "Dictionary search on the current region.\n"
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))

    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat "https://github.com/" myword))
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

(provide 'jp-defuns)
