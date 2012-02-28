(defun jp-home-path ()
  (replace-regexp-in-string "/home/jpablobr/" "~/" default-directory))

(defun jp-byte-recompile-home ()
  (interactive)
  (progn
    (jp-rm-elc-files)
    (byte-recompile-directory "~/.emacs.d/" 0))
  (message "compiled directory ~/.emacs.d"))

(defun jp-byte-recompile-current-file ()
  (interactive)
  (byte-recompile-file (buffer-file-name) 0)
  (message (concat "compiled file" (buffer-file-name) "successfully.")))

(defun jp-rm-elc-files ()
  (interactive)
  (start-process-shell-command "jp-rm-elc-files" nil
                               "cd ~/.emacs.d/ && find . -type f -name '*.elc' -exec rm -fv {} +")
  (message "deleted all .elc files."))

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
      browse-url-generic-program "google-chrome")

(defun jp-synonym-s (what)
  (interactive "sSearch: ")
  (browse-url (concat "http://www.synonym.com/synonyms/"
                      (w3m-url-encode-string what))))

(defun jp-definition-s (what)
  (interactive "sSearch: ")
  (browse-url (concat "http://www.thefreedictionary.com/"
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

(defun jp-term ()
  (interactive)
  (ansi-term "bash" (concat "*ansi-term @ " (jp-home-path) " *")))

(defun jp-shell ()
  (interactive)
  (let ((buffer (shell (concat "*Shell @ " (jp-home-path) " *"))))
    (comint-send-string buffer "echo;rl;ls -la\n")))

(defun jp-playr ()
  (interactive)
  (let ((buffer (shell "*Playr*")))
    (comint-send-string buffer "cd ~/bin/playr;./playr -s\n")))

(defun jp-tork ()
  (interactive)
  (setq app-dir (find-git-repo default-directory))
  (let ((buffer (shell (concat "*Tork @ " (jp-home-path) " *"))))
    (comint-send-string buffer (concat "cd " app-dir " && tork\n")))
  (let ((buffer (shell (concat "*Tork-logs @ " (jp-home-path) " *"))))
    (comint-send-string buffer (concat "cd " app-dir "/log &&  tail -f *.log\n"))))

(defun jp-logs-summary ()
  (interactive)
  (let ((buffer (ansi-term "bash" "*Logs-Summary*")))
    (comint-send-string buffer "cd ~/var/log/ && tail -f *.log\n")))

(defun term-switch-to-shell-mode ()
  (interactive)
  (if (equal major-mode 'term-mode)
      (progn
        (shell-mode)
        (set-process-filter
         (get-buffer-process (current-buffer)) 'comint-output-filter )
        (local-set-key (kbd "C-j") 'term-switch-to-shell-mode)
        (compilation-shell-minor-mode 1)
        (comint-send-input))
    (progn
      (compilation-shell-minor-mode -1)
      (font-lock-mode -1)
      (set-process-filter
       (get-buffer-process (current-buffer)) 'term-emulate-terminal)
      (term-mode)
      (term-char-mode)
      (term-send-raw-string (kbd "C-l")))))

(defconst jp-find-errors-pattern "^[][A-Za-z0-9*+@#%^&=?:;./_- ]*\\$")

(defun jp-find-errors ()
  "Find the Errors in the current shell buffer."
  (interactive)
  (save-excursion
    (re-search-backward jp-find-errors-pattern)
    (set-mark (point))
    (re-search-backward jp-find-errors-pattern)
    (find-errors-in-region)
    (next-error '(4)))
  )

(defun jp-find-errors-in-region ()
  "Use highlighted errors as compile errors."
  (interactive)
  (copy-region-as-kill (region-beginning) (region-end))
  (goto-char (point-max))
  (let ((oldbuf (get-buffer "*shell errors*")))
    (if oldbuf (kill-buffer oldbuf)))
  (let ((outbuf (get-buffer-create "*shell errors*")) )
    (switch-to-buffer outbuf)
    (insert-string "\n\n\n\n")
    (yank)
    (setq compilation-last-buffer outbuf)
    (compilation-mode) ))

(defun jp-zap-ansi-clutter ()
  (interactive)
  (re-search-forward "\\[[0-9;]*m")
  (replace-match "") )

(defun jp-zap-all-ansi ()
  (interactive)
  (save-excursion
    (goto-char 0)
    (while t (jw-zap-ansi-clutter))))

(defun clean-log-buffer-and-fontify ()
  (interactive)
  (goto-char 1)
  (while (re-search-forward "\\(.*footnotes.*\\)" nil t)
    (replace-match "" t t nil 0)
    (forward-char 1))
  (goto-char 1)
  (while (re-search-forward "\\(^-- DEPRECATION WARNING --.*\\)" nil t)
    (replace-match "" t t nil 0)
    (forward-char 1))
  (goto-char 1)
  (while (re-search-forward "\\(^\\s-*$\\)\n" nil t)
    (replace-match "" t t nil 0)
    (forward-char 1))
  (goto-char 1)
  (while (re-search-forward "\\(\033\\[[0-9;]*[mK]\\)" nil t)
    (replace-match "" t t nil 0))
  (goto-char 1)
  (while (re-search-forward "\\<\\(FIX\\|DBG\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):" nil t)
    (put-text-property (point-at-bol) (match-beginning 0) 'face compilation-info-face)
    (put-text-property (match-beginning 1) (match-end 1) 'face compilation-line-face)
    (forward-line 1)))

(defun find-git-repo (dir)
  "Recursively search for a .git/ directory."
  (if (string= "/" dir)
      (message "not in a git repo.")
    (if (file-exists-p (expand-file-name ".git/" dir))
        dir
      (anything-git-grep-find-repo (expand-file-name "../" dir)))))

(defun jp-git-push ()
  (interactive)
  (async-shell-command "~/bin/g -p"))

(defun jp-git-commit ()
  (interactive)
  (setq what
        (read-from-minibuffer
         "Commit msg: "
         (if (and transient-mark-mode mark-active)
             (buffer-substring-no-properties (region-beginning) (region-end))
           (thing-at-point 'symbol))))
  (async-shell-command (concat "cd "
                               (find-git-repo default-directory)
                               " && git add . && git commit -am \""
                               what
                               "\" && git status")))

(provide 'jp-lib-misc)
