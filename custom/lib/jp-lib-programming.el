(defun jp-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun jp-escape-quotes-region (start end)
  "escape quotes"
  (interactive "r")
  "Replace \" by \\\"."
  (replace-pairs-region start end '(["\"" "\\\""])))

(defun jp-unescape-quotes-region (start end)
  (interactive "r")
  "Replace \\\" by \"."
  (replace-pairs-region start end '(["\\\"" "\""])))

(defun jp-add-string-to-end-of-lines-in-region (str b e)
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
  n  (interactive)
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
(defun jp-colorize-compilation-buffer ()
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

(defun jp-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|todo\\|fixme\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(defun jp-ansi-term ()
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

;; https://github.com/purcell/emacs.d/blob/master/init-flymake.el
(setq flymake-gui-warnings-enabled nil)

;; Stop flymake from breaking when ruby-mode is invoked by mmm-mode,
;; at which point buffer-file-name is nil
(eval-after-load "flymake"
  '(progn
     (defun flymake-can-syntax-check-file (file-name)
       "Determine whether we can syntax check FILE-NAME.
Return nil if we cannot, non-nil if we can."
       (if (and file-name (flymake-get-init-function file-name)) t nil))))

(provide 'jp-lib-programming)
