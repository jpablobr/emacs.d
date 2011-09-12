(defcustom ruby-api-root ""
"*Root of Ruby API html documentation. Must be a local directory."
  :group 'ruby
  :type 'string)

(defcustom ruby-use-alternative-browse-url nil
  "Indicates an alternative way of loading URLs on Windows.
Try using the normal method before. If URLs invoked by the
program don't end up in the right place, set this option to
true."
  :group 'ruby
  :type 'boolean)

(defcustom ruby-browse-api-with-w3m nil
  "Indicates that the user wants to browse the Ruby API using
Emacs w3m browser."
  :group 'ruby
  :type 'boolean)

(defcustom ruby-always-use-text-menus nil
  "Force the use of text menus by default."
  :group 'ruby
  :type 'boolean)

(defcustom ruby-ruby-command "ruby"
  "Ruby preferred command line invocation."
  :group 'ruby
  :type 'string)

(defun ruby-browse-api ()
  "Browse Ruby API on RUBY-API-ROOT."
  (interactive)
  (ruby-browse-api-url (concat ruby-api-root "/index.html")))

(defun ruby-browse-api-url (url)
  "Browse preferentially with Emacs w3m browser."
  (if ruby-browse-api-with-w3m
      (when (fboundp 'w3m-find-file)
        (w3m-find-file (remove-prefix url "file://")))
    (ruby-alternative-browse-url url)))

(defun ruby-alternative-browse-url (url &rest args)
  "Fix a problem with Internet Explorer not being able to load
URLs with anchors via ShellExecute. It will only be invoked it
the user explicit sets `ruby-use-alternative-browse-url'."
  (if (and (eq system-type 'windows-nt) ruby-use-alternative-browse-url)
      (w32-shell-execute "open" "iexplore" url)
    (browse-url url args)))

(defun ruby-get-api-entries (name file sexp get-file-func)
  "Return all API entries named NAME in file FILE using SEXP to
find matches, and GET-FILE-FUNC to process the matches found."
  (if (file-exists-p (concat ruby-api-root "/" file))
      (save-current-buffer
        (save-match-data
          (find-file (concat ruby-api-root "/" file))
          (let* ((result
                  (loop for line in (split-string (buffer-string) "\n")
                        when (string-match (format sexp (regexp-quote name)) line)
                        collect (cons (match-string-no-properties 2 line)
                                      (match-string-no-properties 1 line)))))
            (kill-buffer (current-buffer))
            (when-bind (api-file (funcall get-file-func result))
                       (ruby-browse-api-url (concat "file://" ruby-api-root "/" api-file))))))
    (message "There are no API docs.")))

(defun ruby-browse-api-class (class)
  "Browse the Ruby API documentation for CLASS."
  (ruby-get-api-entries
   class "fr_class_index.html" "<a href=\"\\(.*\\)\">%s<"
   (lambda (entries)
     (cond ((= 0 (length entries)) (progn (message "No API Ruby doc for class %s." class) nil))
           ((= 1 (length entries)) (cdar entries))))))

(defun ruby-browse-api-method (method)
  "Browse the Ruby API documentation for METHOD."
  (ruby-get-api-entries
   method "fr_method_index.html" "<a href=\"\\(.*\\)\">%s[ ]+(\\(.*\\))"
   (lambda (entries)
     (cond ((= 0 (length entries)) (progn (message "No API Ruby doc for %s" method) nil))
           ((= 1 (length entries)) (cdar entries))
           (t (cdr (assoc (completing-read (format "Method %s from what class? " method) entries)
                          entries)))))))

(defun ruby-browse-api-at-point ()
  "Open the Ruby API documentation on the class or method at the current point.
The variable `ruby-api-root' must be pointing to a local path
either in your project or elsewhere in the filesystem. The
function will also offer to build the documentation locally if
necessary."
  (interactive)
  (if (ruby-has-api-root)
      (let ((current-symbol (prog2
                                (modify-syntax-entry ?: "w")
                                (thing-at-point 'sexp)
                              (modify-syntax-entry ?: "."))))
        (if current-symbol
            (if (capital-word-p current-symbol)
                (ruby-browse-api-class current-symbol)
              (ruby-browse-api-method current-symbol))))
    (message "Please configure \"ruby-api-root\".")))

(defun ruby-search-doc (&optional item)
  (interactive)
  (setq item (if item item (thing-at-point 'ruby-object)))
  (unless item
    (setq item (read-string "Search symbol: ")))
  (if item
      (if (and ruby-chm-file
               (file-exists-p ruby-chm-file))
          (start-process "keyhh" "*keyhh*" "keyhh.exe" "-#klink"
                         (format "'%s'" item)  ruby-chm-file)
          (with-current-buffer (get-buffer-create "*ri*")
            (setq buffer-read-only nil)
            (erase-buffer)
            (message (concat "Please wait..."))
            (call-process ruby-ri-command nil "*ri*" t "-T" "-f" "ansi" item)
            (ansi-color-apply-on-region (point-min) (point-max))
            (setq buffer-read-only t)
            (goto-char (point-min))
            (local-set-key "q" 'quit-window)
            (local-set-key [f1] 'ruby-search-doc)
            (display-buffer (current-buffer))))))

(provide 'jp-ruby-api-helper)