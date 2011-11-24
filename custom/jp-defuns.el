;;; --------------------------------------------------------------------
;;; - Makes load time faster.
(defun byte-recompile-home ()
  (interactive)
  (byte-recompile-directory "~/.emacs.d" 0))

;;; --------------------------------------------------------------------
;;; - Jump to matching parent
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;;; --------------------------------------------------------------------
;;; - Network
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

;;; --------------------------------------------------------------------
;;; - Cosmetic
(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun delete-current-file ()
  "Delete the file associated with the current buffer.
Delete the current buffer too."
  (interactive)
  (let (currentFile)
    (setq currentFile (buffer-file-name))
    (when (yes-or-no-p (concat "Delete file: " currentFile))
      (kill-buffer (current-buffer))
      (delete-file currentFile)
      (message (concat "Deleted file: " currentFile)))))

;;; --------------------------------------------------------------------
;;; - Browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-dev")

(defun synonym-s (what)
  "Use synonym.com to search for WHAT."
  (interactive "sSearch: ")
  (w3m-browse-url (concat "http://www.synonym.com/synonyms/"
                          (w3m-url-encode-string what))))

(defun definition-s (what)
  "Use dictionary.reference.com  to search for WHAT."
  (interactive "sSearch: ")
  (w3m-browse-url (concat "http://www.thefreedictionary.com/"
                          (w3m-url-encode-string what))))

(defun google-s ()
  "Google search on current region.\n"
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat "http://www.google.com/search?q=" myword))
    (browse-url myurl)))

;; I-search with initial contents.
;; original source: http://platypope.org/blog/2007/8/5/a-compendium-of-awesomeness
(defvar isearch-initial-string nil)

(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))

(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
           (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
          (isearch-forward-regexp regexp-p no-recursive-edit)
        (setq isearch-initial-string (buffer-substring begin end))
        (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (isearch-forward-regexp regexp-p no-recursive-edit)))))

;;; --------------------------------------------------------------------
;;; - Insert helper for the lazy.
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

;;; --------------------------------------------------------------------
;;; - ERC
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#beginrescueend" "#emacs" "#bash" "#codebrawl" "#github" "#rubinius" "#debian")))

(defun erc-connect ()
  "Default ERC stuff."
  (interactive)
  (progn (erc :server "irc.freenode.net" :port 6667 :nick "jpablobr")))

;;; --------------------------------------------------------------------
;;; - General
(defun add-auto-mode (mode &rest patterns)
  "Handier way to add modes to auto-mode-alist"
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun escape-quotes-region (start end)
  "escape quotes"
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

(defun jp-zap-ansi-clutter ()
  (interactive)
  (re-search-forward "\\[[0-9;]*m")
  (replace-match "") )

(defun jp-zap-all-ansi ()
  (interactive)
  (save-excursion
    (goto-char 0)
    (while t (jp-zap-ansi-clutter))  ))

(defun unansi ()
  "Remove the ansi markup in files"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "\\([\\[0-9;\\]*m\\|\r\\)" "")))

(defun unhtml ()
  "Remove the HTML tags in a file"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "<[^>]*>" "")
    (goto-char (point-min))
    (replace-string "&nbsp;" " ")
    (goto-char (point-min))
    (replace-string "&lt;" "<")
    (goto-char (point-min))
    (replace-string "&gt;" ">")
    (goto-char (point-min))
    (replace-string "&amp;" "&") ))

(defun insert-date ()
  "Insert the Date."
  (interactive)
  (insert-string (current-date-string)))

(defun current-date-string ()
  (let ((time-string (current-time-string)))
    (concat (substring time-string 8 10)
	    "/"
	    (substring time-string 4 7)
	    "/"
	    (substring time-string 22 24))))

(defun current-year-string ()
  (let ((time-string (current-time-string)))
    (concat (substring time-string 20 24))))

(defun encrypt (password)
  "Encrypt/Decrypt the current buffer"
  (interactive "sPassword: ")
  (call-process-region
   (point-min) (point-max)
   "crypt"
   t
   (current-buffer)
   nil
   password))

(defun ecb-init-stuff ()
  "Load ECB stuff..."
  (interactive)
  (add-to-list 'load-path (concat misc-dir "/cedet-1.0pre7/common/cedet.el"))
  (add-to-list 'load-path (concat misc-dir "/ecb-2.40"))
  (require 'semantic/analyze)
  (provide 'semantic-analyze)
  (provide 'semantic-ctxt)
  (provide 'semanticdb)
  (provide 'semanticdb-find)
  (provide 'semanticdb-mode)
  (provide 'semantic-load)
  (require 'ecb)
  (custom-set-variables
  '(ecb-options-version "2.40")
   '(ecb-layout-window-sizes
     (quote
      (("left8"
        (0.19801980198019803 . 0.29310344827586204)
        (0.19801980198019803 . 0.2413793103448276)
        (0.19801980198019803 . 0.27586206896551724)
        (0.19801980198019803 . 0.1724137931034483))))))
  (global-ede-mode 1)
  (setq ecb-tip-of-the-day nil)
  (setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
  (ecb-activate))

(defun test-sh-script ()
  "Loads a testing script."
  (interactive)
  (let ((buffer (shell "*Testing Script*")))
    (set (make-local-variable 'comint-output-filter-functions)
         '(comint-truncate-buffer
           comint-postoutput-scroll-to-bottom
           ansi-color-process-output))
    (ansi-color-for-comint-mode-on)
    (compilation-shell-minor-mode 1)
    (find-file "~/.private/bin/test.sh")
    (comint-send-string buffer (concat "cd ~/.private/bin/; ls -la" "\n"))))

(defun t-anything ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-buffers
     anything-c-source-file-name-history
     anything-c-source-info-pages
     anything-c-source-info-elisp
     anything-c-source-man-pages
     anything-c-source-locate
     anything-c-source-emacs-commands
     anything-c-source-etags-select)
   " *jp-anything*"))

(defun t-linum  ()
  "Toggle linum mode"
  (interactive)
  (linum-mode))

(defun decamelize (string)
  "Convert from CamelCaseString to camel_case_string."
  (let ((case-fold-search nil))
    (downcase
     (replace-regexp-in-string
      "\\([A-Z]+\\)\\([A-Z][a-z]\\)" "\\1_\\2"
      (replace-regexp-in-string
       "\\([a-z0-9]\\)\\([A-Z]\\)" "\\1_\\2"
       string)))))

(defun fullscreen-toggle ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))

(defun load-rainbow-mode  ()
  "Loads rainsbow-mode"
  (interactive)
  (load-file (concat vendor-dir "/theaming/rainbow-mode.el"))
  (require'rainbow-mode "rainbow-mode" t)
  (rainbow-mode))

(when window-system
  (defun transparency ()
    "Sets transparency"
    (interactive)
    (set-frame-parameter (selected-frame) 'alpha '(85 85))
    (add-to-list 'default-frame-alist '(alpha 85 85)))

  (defun reset-transparency ()
    "Resets transparency"
    (interactive)
    (set-frame-parameter (selected-frame) 'alpha '(100 100))
    (add-to-list 'default-frame-alist '(alpha 100 100)))); - when window-system

(defun sudo-find-file (file-name)
  "Like find file, but opens the file as root."
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
    (find-file tramp-file-name)))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(defvar *ruby-code-root* "~/code/ruby")
(defun jp-ruby-ido-find-file ()
  (interactive)
  (ido-find-file-in-dir *ruby-code-root*))

(defun word-count ()
  "Count words in buffer"
  (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))

(defun jp-ido-find-config ()
  (interactive)
  (find-file
   (concat "~/.emacs.d/custom/"
           (ido-completing-read "Config file: "
                                (directory-files "~/.emacs.d/custom/"
                                                 nil
                                                 "^[^.]")))))

(defun jp-ido-find-project ()
  (interactive)
  (find-file
   (concat "~/code/" (ido-completing-read "Project: "
                           (directory-files "~/code/" nil "^[^.]")))))

(provide 'jp-defuns)