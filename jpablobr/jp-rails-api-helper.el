(defcustom jp-rails-api-root ""
"*Root of Jp-Rails API html documentation. Must be a local directory."
  :group 'jp-rails
  :type 'string)

(defcustom jp-rails-use-alternative-browse-url nil
  "Indicates an alternative way of loading URLs on Windows.
Try using the normal method before. If URLs invoked by the
program don't end up in the right place, set this option to
true."
  :group 'jp-rails
  :type 'boolean)

(defcustom jp-rails-browse-api-with-w3m nil
  "Indicates that the user wants to browse the Jp-Rails API using
Emacs w3m browser."
  :group 'jp-rails
  :type 'boolean)

(defcustom jp-rails-always-use-text-menus nil
  "Force the use of text menus by default."
  :group 'jp-rails
  :type 'boolean)

(defcustom jp-rails-jp-rails-command "jp-rails"
  "Jp-Rails preferred command line invocation."
  :group 'jp-rails
  :type 'string)

(defun jp-rails-browse-api ()
  "Browse Jp-Rails API on JP-RAILS-API-ROOT."
  (interactive)
  (jp-rails-browse-api-url (concat jp-rails-api-root "/index.html")))

(defun jp-rails-browse-api-url (url)
  "Browse preferentially with Emacs w3m browser."
  (if jp-rails-browse-api-with-w3m
      (when (fboundp 'w3m-find-file)
        (w3m-find-file (remove-prefix url "file://")))
    (jp-rails-alternative-browse-url url)))

(defun jp-rails-alternative-browse-url (url &rest args)
  "Fix a problem with Internet Explorer not being able to load
URLs with anchors via ShellExecute. It will only be invoked it
the user explicit sets `jp-rails-use-alternative-browse-url'."
  (if (and (eq system-type 'windows-nt) jp-rails-use-alternative-browse-url)
      (w32-shell-execute "open" "iexplore" url)
    (browse-url url args)))

(defun jp-rails-get-api-entries (name file sexp get-file-func)
  "Return all API entries named NAME in file FILE using SEXP to
find matches, and GET-FILE-FUNC to process the matches found."
  (if (file-exists-p (concat jp-rails-api-root "/" file))
      (save-current-buffer
        (save-match-data
          (find-file (concat jp-rails-api-root "/" file))
          (let* ((result
                  (loop for line in (split-string (buffer-string) "\n")
                        when (string-match (format sexp (regexp-quote name)) line)
                        collect (cons (match-string-no-properties 2 line)
                                      (match-string-no-properties 1 line)))))
            (kill-buffer (current-buffer))
            (when-bind (api-file (funcall get-file-func result))
                       (jp-rails-browse-api-url (concat "file://" jp-rails-api-root "/" api-file))))))
    (message "There are no API docs.")))

(defun jp-rails-browse-api-class (class)
  "Browse the Jp-Rails API documentation for CLASS."
  (jp-rails-get-api-entries
   class "fr_class_index.html" "<a href=\"\\(.*\\)\">%s<"
   (lambda (entries)
     (cond ((= 0 (length entries)) (progn (message "No API Jp-Rails doc for class %s." class) nil))
           ((= 1 (length entries)) (cdar entries))))))

(defun jp-rails-browse-api-method (method)
  "Browse the Jp-Rails API documentation for METHOD."
  (jp-rails-get-api-entries
   method "fr_method_index.html" "<a href=\"\\(.*\\)\">%s[ ]+(\\(.*\\))"
   (lambda (entries)
     (cond ((= 0 (length entries)) (progn (message "No API Jp-Rails doc for %s" method) nil))
           ((= 1 (length entries)) (cdar entries))
           (t (cdr (assoc (completing-read (format "Method %s from what class? " method) entries)
                          entries)))))))

(defun jp-rails-browse-api-at-point ()
  "Open the Jp-Rails API documentation on the class or method at the current point.
The variable `jp-rails-api-root' must be pointing to a local path
either in your project or elsewhere in the filesystem. The
function will also offer to build the documentation locally if
necessary."
  (interactive)
  (if (jp-rails-has-api-root)
      (let ((current-symbol (prog2
                                (modify-syntax-entry ?: "w")
                                (thing-at-point 'sexp)
                              (modify-syntax-entry ?: "."))))
        (if current-symbol
            (if (capital-word-p current-symbol)
                (jp-rails-browse-api-class current-symbol)
              (jp-rails-browse-api-method current-symbol))))
    (message "Please configure \"jp-rails-api-root\".")))

(defun jp-rails-search-doc (&optional item)
  (interactive)
  (setq item (if item item (thing-at-point 'jp-rails-object)))
  (unless item
    (setq item (read-string "Search symbol: ")))
  (if item
      (if (and jp-rails-chm-file
               (file-exists-p jp-rails-chm-file))
          (start-process "keyhh" "*keyhh*" "keyhh.exe" "-#klink"
                         (format "'%s'" item)  jp-rails-chm-file)
          (with-current-buffer (get-buffer-create "*ri*")
            (setq buffer-read-only nil)
            (erase-buffer)
            (message (concat "Please wait..."))
            (call-process jp-rails-ri-command nil "*ri*" t "-T" "-f" "ansi" item)
            (ansi-color-apply-on-region (point-min) (point-max))
            (setq buffer-read-only t)
            (goto-char (point-min))
            (local-set-key "q" 'quit-window)
            (local-set-key [f1] 'jp-rails-search-doc)
            (display-buffer (current-buffer))))))

(provide 'jp-rails-api-helper)