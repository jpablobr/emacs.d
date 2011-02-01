;;; -*- coding: utf-8-unix; -*-
;;jp-plain-text.el ---------------------------------------------------------
;;; - Plain Text
;;; - Stefan Monnier <foo at acm.org>. It is the opposite of
;;; - fill-paragraph. Takes a multi-line paragraph and makes
;;; - it into a single line of text.
;;;
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun refresh-file ()
  (interactive)
  (revert-buffer t t t))
(global-set-key [f5] 'refresh-file)

(defun space2underscore-region (start end)
  "Replace space by underscore in region."
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward " " nil t) (replace-match "_")) ) )

(defun underscore2space-region (start end)
  "Replace underscore by space in region."
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward "_" nil t) (replace-match " ")) ))

(defun replace-underscore-space-toggle ()
  "Replace underscore/space in the current region or line.
If the current line contains more “_” char than space,
then replace them to space, else replace space to _.
If there's a text selection, work on the selected text."
  (interactive)
  (let (li bds)
    (setq bds
          (if (region-active-p)
              (cons (region-beginning) (region-end))
            (bounds-of-thing-at-point 'line)))
    (setq li (buffer-substring-no-properties (car bds) (cdr bds)))
    (if (> (count 32 li) (count 95 li))
        (progn (replace-string " " "_" nil (car bds) (cdr bds)))
      (progn (replace-string "_" " " nil (car bds) (cdr bds))))))

(defun mapcar-head (fn-head fn-rest list)
  "Like MAPCAR, but applies a different function to the first element."
  (if list
      (cons (funcall fn-head (car list)) (mapcar fn-rest (cdr list)))))
(defun camelize (s)
  "Convert under_score string S to CamelCase string."
  (mapconcat 'identity (mapcar
                        '(lambda (word) (capitalize (downcase word)))
                        (split-string s "_")) ""))
(defun camelize-method (s)
  "Convert under_score string S to camelCase string."
  (mapconcat 'identity (mapcar-head
                        '(lambda (word) (downcase word))
                        '(lambda (word) (capitalize (downcase word)))
                        (split-string s "_")) ""))
(defun un-camelcase-string (s &optional sep start)
  "Convert CamelCase string S to lower case with word separator SEP.
    Default for SEP is a hyphen \"-\".
    If third argument START is non-nil, convert words after that
    index in STRING."
  (let ((case-fold-search nil))
    (while (string-match "[A-Z]" s (or start 1))
      (setq s (replace-match (concat (or sep "-")
                                     (downcase (match-string 0 s)))
                             t nil s)))
    (downcase s)))

    (defun split-name (s)
      (split-string
       (let ((case-fold-search nil))
	 (downcase
	  (replace-regexp-in-string "\\([a-z]\\)\\([A-Z]\\)" "\\1 \\2" s)))
       "[^A-Za-z0-9]+"))
    (defun camelcase  (s) (mapconcat 'capitalize (split-name s) ""))
    (defun underscore (s) (mapconcat 'downcase   (split-name s) "_"))
    (defun dasherize  (s) (mapconcat 'downcase   (split-name s) "-"))
    (defun colonize   (s) (mapconcat 'capitalize (split-name s) "::"))
    (defun camelscore (s)
      (cond ((string-match-p "\\(?:[a-z]+_\\)+[a-z]+" s)	(dasherize  s))
	    ((string-match-p "\\(?:[a-z]+-\\)+[a-z]+" s)	(camelcase  s))
	    ((string-match-p "\\(?:[A-Z][a-z]+\\)+$"  s)	(colonize   s))
	    (t						(underscore s)) ))
    (defun camelscore-word-at-point ()
      (interactive)
      (let* ((case-fold-search nil)
	     (beg (and (skip-chars-backward "[:alnum:]:_-") (point)))
	     (end (and (skip-chars-forward  "[:alnum:]:_-") (point)))
	     (txt (buffer-substring beg end))
	     (cml (camelscore txt)) )
	(if cml (progn (delete-region beg end) (insert cml))) ))

(provide 'jp-plain-text)
