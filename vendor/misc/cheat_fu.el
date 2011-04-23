;; cheat_fu.el
;; Time-stamp: <2011-04-23 18:13:18 jpablobr>

;;; Depends on imenu
(require 'imenu)

;;; Needed for flet
(eval-when-compile
  (require 'cl))

;;; Minor mode

(defvar *cheat_fu-gf-exclude*
  "(/|^)(\\.+[^/]+|vendor|fixtures|tmp|log|classes|build)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc|\\.html)(/|$)"
  "Regexp of files to exclude from `textmate-goto-file'.")

(defvar *cheat_fu-project-roots*
  '(".git" ".hg" "Rakefile" "Makefile" "README" "build.xml" ".emacs-project")
  "The presence of any file/directory in this list indicates a project root.")

(defvar cheat_fu-use-file-cache t
  "Should `cheat_fu-goto-file' keep a local cache of files?")

(defvar cheat_fu-completing-library 'ido
  "The library `cheat_fu-goto-file' should use for
completing filenames and symbols (`ido' by default)")

(defvar cheat_fu-find-files-command "find \"%s\" -type f"
  "The command `cheat_fu-project-root' uses to find files. %s will be replaced
the project root.")

(defvar *cheat_fu-completing-function-alist* '((ido ido-completing-read)
                                               (icicles  icicle-completing-read)
                                               (none completing-read))
  "The function to call to read file names and symbols from the user")

(defvar *cheat_fu-completing-minor-mode-alist*
  `((ido ,(lambda (a) (progn (ido-mode a) (setq ido-enable-flex-matching t))))
    (icicles ,(lambda (a) (icy-mode a)))
    (none ,(lambda (a) ())))
  "The list of functions to enable and disable completing minor modes")

(defvar *cheat_fu-project-root* nil
  "Used internally to cache the project root.")

(defvar *cheat_fu-project-files* '()
  "Used internally to cache the files in a project.")

(defcustom cheat_fu-word-characters "a-zA-Z0-9_" "Word Characters for Column Movement")
;;; Bindings

(defun cheat_fu-ido-fix ()
  "Add up/down keybindings for ido."
  (define-key ido-completion-map [up] 'ido-prev-match)
  (define-key ido-completion-map [down] 'ido-next-match))

(defun cheat_fu-completing-read (&rest args)
  "Uses `*cheat_fu-completing-function-alist*' to call the appropriate completing
function."
  (let ((reading-fn
         (cadr (assoc cheat_fu-completing-library
                      *cheat_fu-completing-function-alist*))))
  (apply (symbol-function reading-fn) args)))

;;; allow-line-as-region-for-function adds an "-or-line" version of
;;; the given comment function which (un)comments the current line is
;;; the mark is not active.  This code comes from Aquamac's osxkeys.el
;;; and is licensed under the GPL

(defmacro allow-line-as-region-for-function (orig-function)
`(defun ,(intern (concat (symbol-name orig-function) "-or-line"))
   ()
   ,(format "Like `%s', but acts on the current line if mark is not active."
            orig-function)
   (interactive)
   (if mark-active
       (call-interactively (function ,orig-function))
     (save-excursion
       ;; define a region (temporarily) -- so any C-u prefixes etc. are preserved.
       (beginning-of-line)
       (set-mark (point))
       (end-of-line)
       (call-interactively (function ,orig-function))))))

(defun cheat_fu-define-comment-line ()
  "Add or-line (un)comment function if not already defined"
  (unless (fboundp 'comment-or-uncomment-region-or-line)
    (allow-line-as-region-for-function comment-or-uncomment-region)))

;;; interactive functions

(defun cheat_fu-goto-file ()
  "Uses your completing read to quickly jump to a file in a project."
  (interactive)
  ;; (let ((root (cheat_fu-project-root)))
  ;;   (when (null root)
  ;;     (message root)
  ;;     (error "Can't find any .git directory"))
    (find-file
     (concat
      ;; (expand-file-name "~/.cheat_fu_sheets") ""
      (cheat_fu-completing-read
       "Find file: "
       (mapcar
	(lambda (e)
	  (replace-regexp-in-string "~/.cheat_fu_sheets" "" e))
	(cheat_fu-cached-project-files (cheat_fu-project-root)))))))

(defun cheat_fu-clear-cache ()
  "Clears the project root and project files cache. Use after adding files."
  (interactive)
  (setq *cheat_fu-project-root* nil)
  (setq *cheat_fu-project-files* nil)
  (message "cheat_fu-mode cache cleared."))

;;; Utilities

(defun cheat_fu-project-files (root)
  "Finds all files in a given project."
  (split-string
    (shell-command-to-string
     (concat
      (cheat_fu-string-replace "%s" root cheat_fu-find-files-command)
      "  | grep -vE '"
      *cheat_fu-gf-exclude*
      "' | sed 's:"
      *cheat_fu-project-root*
      "/::'")) "\n" t))

;; http://snipplr.com/view/18683/stringreplace/
(defun cheat_fu-string-replace (this withthat in)
  "replace THIS with WITHTHAT' in the string IN"
  (with-temp-buffer
    (insert in)
    (goto-char (point-min))
    (while (search-forward this nil t)
      (replace-match withthat nil t))
    (buffer-substring (point-min) (point-max))))

(defun cheat_fu-cached-project-files (&optional root)
  "Finds and caches all files in a given project."
  (cond
   ((null cheat_fu-use-file-cache) (cheat_fu-project-files root))
   ((equal (cheat_fu-project-root) (car *cheat_fu-project-files*))
    (cdr *cheat_fu-project-files*))
   (t (cdr (setq *cheat_fu-project-files*
                 `(,root . ,(cheat_fu-project-files root)))))))

(defun cheat_fu-project-root ()
  "Returns the current project root."
   ;; "~/.cheat_fu_sheets/")
  (when (or
         (null *cheat_fu-project-root*)
         (not (string-match *cheat_fu-project-root* default-directory)))
    (let ((root (cheat_fu-find-project-root)))
      (if root
          (setq *cheat_fu-project-root* (expand-file-name (concat root "/")))
        (setq *cheat_fu-project-root* nil))))
  *cheat_fu-project-root*)

(defun root-match(root names)
  (member (car names) (directory-files root)))

(defun root-matches(root names)
  (if (root-match root names)
      (root-match root names)
      (if (eq (length (cdr names)) 0)
          'nil
          (root-matches root (cdr names))
          )))

(defun cheat_fu-find-project-root (&optional root)
  "Determines the current project root by recursively searching for an indicator."

  ;; "~/.cheat_fu_sheets")
  (when (null root) (setq root default-directory))
  (cond
   ((root-matches root *cheat_fu-project-roots*)
    (expand-file-name root))
   ((equal (expand-file-name root) "/") nil)
   (t (cheat_fu-find-project-root (concat (file-name-as-directory root) "..")))))

;;;###autoload
(define-minor-mode cheat_fu-mode "Cheat_Fu Emulation Minor Mode"
  :lighter " cheat_fu" :global t ;:keymap *cheat_fu-mode-map*
  (add-hook 'ido-setup-hook 'cheat_fu-ido-fix)
  (cheat_fu-define-comment-line)
  ; activate preferred completion library
  (dolist (mode *cheat_fu-completing-minor-mode-alist*)
    (if (eq (car mode) cheat_fu-completing-library)
        (funcall (cadr mode) t)
      (when (fboundp
             (cadr (assoc (car mode) *cheat_fu-completing-function-alist*)))
        (funcall (cadr mode) -1)))))

(provide 'cheat_fu)
