(defun jp-byte-recompile-home ()
  (interactive)
  (jp-rm-elc-files)
  (byte-recompile-directory "~/.emacs.d/" 0))

(defun jp-rm-elc-files ()
  (interactive)
  (compilation-start
   "cd ~/.emacs.d/ && find . -type f -name '*.elc' -exec rm -fv {} +"))

(defun jp-untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun jp-indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun jp-cleanup-buffer ()
  (interactive)
  (jp-untabify-buffer)
  (jp-indent-buffer)
  (delete-trailing-whitespace))

(defun jp-delete-current-file ()
  (interactive)
  (let (currentFile)
    (setq currentFile (buffer-file-name))
    (when (yes-or-no-p (concat "Delete file: " currentFile))
      (kill-buffer (current-buffer))
      (delete-file currentFile)
      (message (concat "Deleted file: " currentFile)))))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

(defun jp-synonym-s (what)
  (interactive "sSearch: ")
  (w3m-browse-url (concat "http://www.synonym.com/synonyms/"
                          (w3m-url-encode-string what))))

(defun jp-definition-s (what)
  (interactive "sSearch: ")
  (w3m-browse-url (concat "http://www.thefreedictionary.com/"
                          (w3m-url-encode-string what))))

(defun jp-current-word-definition ()
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat "http://www.thefreedictionary.com/" myword))
    (browse-url myurl)))

(defun jp-google-region ()
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat "http://www.google.com/search?ie=utf-8&oe=utf-8&q=" myword))
    (browse-url myurl)))

;; I-search with initial contents.
;; original source:
;; http://platypope.org/blog/2007/8/5/a-compendium-of-awesomeness
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

(setq erc-autojoin-channels-alist
      '(("freenode.net" "#beginrescueend" "#emacs" "#bash" "#codebrawl" "#github" "#rubinius" "#debian" "#archlinux")))

(defun jp-erc-connect ()
  (interactive)
  (progn (erc :server "irc.freenode.net" :port 6667 :nick "jpablobr")))

(defun jp-add-auto-mode (mode &rest patterns)
  "Handier way to add modes to auto-mode-alist"
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun jp-current-date-string ()
  (let ((time-string (current-time-string)))
    (concat (substring time-string 8 10)
            "/"
            (substring time-string 4 7)
            "/"
            (substring time-string 22 24))))

(defun jp-current-year-string ()
  (let ((time-string (current-time-string)))
    (concat (substring time-string 20 24))))

(defun jp-fullscreen-toggle ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))

(defun jp-sudo-find-file (file-name)
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
    (find-file tramp-file-name)))

(defun jp-shift-right (&optional arg)
  (interactive)
  (let ((deactivate-mark nil)
        (beg (or (and mark-active (region-beginning))
                 (line-beginning-position)))
        (end (or (and mark-active (region-end)) (line-end-position))))
    (indent-rigidly beg end (* (or arg 1) tab-width))))

(defun jp-shift-left (&optional arg)
  (interactive)
  (jp-shift-right (* -1 (or arg 1))))

(defun jp-turn-on-flyspell ()
  (interactive)
  (flyspell-mode +1))

(defun jp-add-buffer-cleanup ()
  (interactive)
  (add-hook 'before-save-hook 'jp-cleanup-buffer))

(defun jp-remove-buffer-cleanup ()
  (interactive)
  (remove-hook 'before-save-hook 'jp-cleanup-buffer))

(defun jp-unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun jp-space2underscore-region (start end)
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward " " nil t) (replace-match "_")) ) )

(defun jp-space2dash-region (start end)
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward " " nil t) (replace-match "-")) ) )

(defun jp-underscore2space-region (start end)
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward "_" nil t) (replace-match " ")) ))

(defun jp-dash2space-region (start end)
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward "-" nil t) (replace-match " ")) ))

(defun jp-underscore2dash-region (start end)
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward "_" nil t) (replace-match "-")) ))

(defun jp-dash2underscore-region (start end)
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward "-" nil t) (replace-match "_")) ))

(defun jp-latin-9-input-method ()
  "Latin chars without having to type
  C-x 8 'e for: 'é' character
  http://xahlee.org/emacs/emacs_n_unicode.html"
  (interactive)
  (set-input-method "latin-9-prefix"))

(defun jp-cp-shell-cmd-output ()
  (interactive)
  (kill-new (point-min) (point-max)))

(defun jp-shutdown-emacs-server ()
  (interactive)
  (when (not (eq window-system 'x))
    (message "Initializing x windows system.")
    (x-initialize-window-system)
    (when (not x-display-name) (setq x-display-name (getenv "DISPLAY")))
    (select-frame (make-frame-on-display x-display-name '((window-system . x)))))
  (let ((last-nonmenu-event nil)(window-system "x"))(save-buffers-kill-emacs)))

(defun jp-clear-shell-buffer ()
  (interactive)
  (delete-region (point-min) (point-max)))

(defun jp-shell ()
  (interactive)
  (let ((buffer (shell (concat "*Shell @ " default-directory " *"))))
    (comint-send-string buffer "rl\nls -la\n")))

(defun jp-logs-summary ()
  (interactive)
  (let ((buffer (shell"*Logs Summary*")))
    (comint-send-string buffer "cd ~/var/log/ && tail -f *.log\n")))

(provide 'jp-lib-misc)
