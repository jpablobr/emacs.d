(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

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

(defun jp-unansi ()
  "Remove the ansi markup in files"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "\\([\\[0-9;\\]*m\\|\r\\)" "")))

(defun jp-unhtml ()
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

(defun jp-decamelize (string)
  "Convert from CamelCaseString to camel_case_string."
  (let ((case-fold-search nil))
    (downcase
     (replace-regexp-in-string
      "\\([A-Z]+\\)\\([A-Z][a-z]\\)" "\\1_\\2"
      (replace-regexp-in-string
       "\\([a-z0-9]\\)\\([A-Z]\\)" "\\1_\\2"
       string)))))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(defun jp-make-script-executable ()
  "If file starts with a shebang, make `buffer-file-name' executable"
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (when (and (looking-at "^#!")
                 (not (file-executable-p buffer-file-name)))
        (set-file-modes buffer-file-name
                        (logior (file-modes buffer-file-name) #o100))
        (message (concat "Made " buffer-file-name " executable"))))))

(add-hook 'after-save-hook 'jp-make-script-executable)

(defun jp-ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (prelude-ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (prelude-ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))

(defun jp-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(defun jp-prog-coding-hook ()
  "Enable things that are convenient across all coding buffers."
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (setq save-place t)
  (jp-add-watchwords)
  (auto-fill-mode)
  (if window-system (hl-line-mode t))
  (pretty-lambdas))

(defun jp-visit-term-buffer ()
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (ansi-term "/bin/bash")
    (switch-to-buffer "*ansi-term*")))

(defun jp-turn-on-whitespace ()
  (whitespace-mode +1))

(defun jp-turn-off-whitespace ()
  (whitespace-mode -1))

(defun jp-turn-on-abbrev ()
  (abbrev-mode +1))

(defun jp-turn-off-abbrev ()
  (abbrev-mode -1))

(defun jp-untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun jp-comment-or-uncomment-region-or-line ()
  "Like comment-or-uncomment-region, but if there's no mark \(that means no
region\) apply comment-or-uncomment to the current line"
  (interactive)
  (if (not mark-active)
      (comment-or-uncomment-region
        (line-beginning-position) (line-end-position))
      (if (< (point) (mark))
          (comment-or-uncomment-region (point) (mark))
        (comment-or-uncomment-region (mark) (point)))))

;; in Emacs 24 programming major modes generally derive
;; from a common mode named prog-mode
(add-hook 'prog-mode-hook 'jp-prog-mode-hook)

(provide 'jp-lib-programming)