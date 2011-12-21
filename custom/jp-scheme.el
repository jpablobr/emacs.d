;;; ----------------------------------------------------------------------------
;;; - Scheme
;;; - http://bc.tech.coop/scheme/scheme-emacs.htm
;;;
(require 'quack)

;; Specify modes for Scheme file extensions
(setq auto-mode-alist
      (append '(
		("\\.emacs$" . emacs-lisp-mode)
		("\\.scm$" . scheme-mode)
		("\\.ss$" . scheme-mode)
		("\\.sch$" . scheme-mode)
		)auto-mode-alist))

;; Start up Scheme
(global-set-key [(f5)]
		'(lambda ()
		   (interactive)
		   (require 'quack)
		   (run-scheme mzscheme-program)))

;; Scheme-specific Functions
(defun insert-balanced-comments (arg)
  "Insert a set of balanced comments around the s-expression
containing the point.  If this command is invoked repeatedly
(without any other command occurring between invocations), the
comment progressively moves outward over enclosing expressions."
  (interactive "*p")
  (save-excursion
    (when (eq last-command this-command)
      (when (search-backward "#|" nil t)
        (save-excursion
          (delete-char 2)
          (while (and (< (point) (point-max)) (not (looking-at " *|#")))
            (forward-sexp))
          (replace-match ""))))
    (while (> arg 0)
      (backward-char 1)
      (cond ((looking-at ")") (incf arg))
            ((looking-at "(") (decf arg))))
    (insert "#|")
    (forward-sexp)
    (insert "|#")))

(defun remove-balanced-comments ()
  "Remove a set of balanced comments enclosing point."
  (interactive "*")
  (save-excursion
    (when (search-backward "#|" nil t)
      (delete-char 2)
      (while (and (< (point) (point-max)) (not (looking-at " *|#")))
	(forward-sexp))
      (replace-match ""))))

(defun kill-this-buffer-lisp ()
  (interactive)
  (cond
   ((eq (current-buffer) (get-buffer "*scheme*"))
    (let ((process (get-buffer "*scheme*")))
      (comint-snapshot-last-prompt)
      (process-send-string process "(exit)"))
    (sleep-for .1)
    (kill-this-buffer))
   (t (kill-this-buffer))))

(defun kill-all-process-buffers ()
  (mapc (lambda (buffer)
	  (if (get-buffer buffer)
	      (progn
		(pop-to-buffer buffer)
		(kill-this-buffer-lisp))))
	'("*scheme*"))
  (if mswindows-p
      (ignore-errors
	(progn
	  (require 'gnuserv)
	  (gnuserv-start t)))))

(defun scheme-send-dwim (arg)
  "Send the appropriate forms to Scheme to be evaluated."
  (interactive "P")
  (save-excursion
    (cond
     ;;Region selected - evaluate region
     ((not (equal mark-active nil))
      (scheme-send-region (mark) (point)))
     ;; At/after sexp - evaluate last sexp
     ((or (looking-at "\\s\)")
	  (save-excursion
	    (backward-char 1)
	    (looking-at "\\s\)")))
      (if (looking-at "\\s\)")
	  (forward-char 1))
      (scheme-send-last-sexp))
     ;; At/before sexp - evaluate next sexp
     ((or (looking-at "\\s\(")
	  (save-excursion
	    (forward-char 1)
	    (looking-at "\\s\(")))
      (if (looking-at "\\s\(")
	  (forward-list 1))
      (scheme-send-last-sexp))
     ;; Default - evaluate enclosing top-level sexp
     (t (scheme-send-definition)))
    (if arg (switch-to-scheme t))))

;; MzScheme Macro expansion
(defvar mzexpand-actions
  '(nil :this :expand :expand-once :expand* :pp))

(defvar mzexpand-cache nil)

(defun mzexpand-get-action ()
  (unless (eq (car mzexpand-cache) mzexpand-actions)
    (setq mzexpand-cache
          (cons mzexpand-actions
                (mapcar (lambda (a)
                          (list (replace-regexp-in-string
                                 "^:" "" (format "%s" a))
                                a))
                        mzexpand-actions))))
  (cdr (assoc (completing-read "Action? " mzexpand-cache nil t)
              (cdr mzexpand-cache))))

(defun -test (action)
  "Scheme syntax debugging. Uses Scheme code originally developed by
Eli Barzilay.  Actions: nil set current using sexp at point
 :this        show current
 :expand      expand current (possibly in a context)
 :expand-once expand one step
 :expand*     expand one step repeatedly
 :pp          pprint current"
  (interactive (mzexpand-get-action))
  (comint-send-string (get-buffer-process "*scheme*")
                      (format "(-test %S)" (or action
					       (sexp-at-point))))
  (pop-to-buffer "*scheme*" t)
  (other-window 1))

;; MzScheme Trace
(defun -trace (action &optional prefix)
  (interactive)
  (let ((symb nil))
    (if (or (equal action "trace")
	    (equal action "untrace"))
	(setq symb (symbol-at-point)))
    (if prefix
	(setq action (concat "un" action)))
    (comint-send-string (get-buffer-process "*scheme*")
			(if symb
			    (format "(%s %S)" action symb)
			  (format "(%s)" action))))
  (pop-to-buffer "*scheme*" t)
  (other-window 1))

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)

(provide 'jp-scheme)
