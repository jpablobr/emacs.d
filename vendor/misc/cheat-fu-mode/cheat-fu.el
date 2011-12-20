;; cheat-fu.el
;; Time-stamp: <2011-04-28 21:16:20 jpablobr>

;; Copyright (C) Jose Pablo Barrantes 2011 <xjpablobrx@gmail.com>

;; Licensed under the same terms as Emacs.

;; Keywords: cheats bash
;; Created: 25 April 2011
;; Author: Jose Pablo Barrantes 2011 <xjpablobrx@gmail.com>
;; Version: 0.1.0

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; This minor mode exists to provide emacs with an interface to cheat-fu
;; https://github.com/jpablobr/cheat-fu

;; You can configure the cheat-fu-sheets root directory by appending
;; a directory name onto the `cheat-fu-root'.

;;; Installation

;; In your emacs config:
;;
;; (add-to-list 'load-path "~/.emacs.d/load/path/cheat-fu.el")
;; (require 'cheat-fu)
;; (setq cheat-fu-root "/path/to/.cheat_fu_sheets/")

;;; ----------------------------------------------------------------------------
;;; - Customization
;;;
(defcustom cheat-fu-root nil
  "Used internally for defining cheat-fu_sheets root path."
  :group 'cheat-fu
  :type 'string)

;;; ----------------------------------------------------------------------------
;;; - cheat-fu config
;;;
(define-button-type 'cheat-fu-find-file-button
  'follow-link t
  'action #'cheat-fu-find-file-button)

(defvar *cheat-fu-to-include* "*.1.ronn"
  "Regexp of files to exclude from `cheat-fu-sheets'.")

(defvar cheat-fu-completing-library 'ido
  "The library `cheat-fu-sheets' should use for
  completing sheets (`ido' by default)")

(defvar cheat-fu-roff-convert-command "ronn --roff --html \"%s\" "
  "The command used to convert sheets to man and html pages. %s will be
  replaced with the current cheat-fu-sheet.")

(defvar cheat-fu-find-sheets-command "find \"%s\" -type f -name "
  "The command used to find sheets. %s will be replaced with the cheat-fu-root.")

(defvar cheat-fu-search-sheets-command "cheat_fu -s \"%s\" "
  "The command used to find sheets. %s will be replaced with the search input.")

(defvar *cheat-fu-completing-function-alist* '((ido ido-completing-read)
                                               (icicles  icicle-completing-read)
                                               (none completing-read))
  "The function to call to read sheets.")

(defvar *cheat-fu-completing-minor-mode-alist*
  `((ido ,(lambda (a) (progn (ido-mode a) (setq ido-enable-flex-matching t))))
    (icicles ,(lambda (a) (icy-mode a)))
    (none ,(lambda (a) ())))
  "The list of functions to enable and disable completing minor modes")

;;; ----------------------------------------------------------------------------
;;; - Interctive Functions
;;;
(defun cheat-fu-list ()
  "Output paths to all sheets."
  (interactive)
  (cheat-fu-command "-l"))

(defun cheat-fu-search(what)
  "Output paths to sheets matching search  'input'."
  (interactive "sCheat-fu Sheet: ")
    (cheat-fu-command "-l" what))

(defun cheat-fu-convert ()
  "Converts cheat-fu-sheets to man and html."
  (interactive)
  (shell-command-to-string
   (cheat-fu-string-replace "%s" buffer-file-name cheat-fu-roff-convert-command)) t)

(defun cheat-fu-commit (what)
  "Git commit all helper."
  (interactive  "sCheat-fu commit msg: ")
  (let ((buffer (shell "*cheat-fu commit*")))
  (setq cmd  (concat
              "cd "
              cheat-fu-root
              " && git add . && git commit -v -a -m" " \"cheat-fu-commit: "
              what "\""))
    (ansi-color-for-comint-mode-on)
    (compilation-shell-minor-mode 1)
    (comint-send-string buffer (concat cmd "\n"))))

(defun cheat-fu-sheets ()
  "Uses your completing read to quickly jump to the sheets."
  (interactive)
  (find-file
   (concat
    (expand-file-name cheat-fu-root)
    (cheat-fu-completing-read
     "Find file: "
     (mapcar
      (lambda (e)
        (replace-regexp-in-string cheat-fu-root "" e))
      (cheat-fu-project-files  cheat-fu-root))))))

(defun cheat-fu-buttonize-buffer ()
  "turn all file paths into buttons"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "/[^ \t]*" nil t)
      (make-button (match-beginning 0) (match-end 0) :type 'cheat-fu-find-file-button))))

;;; ----------------------------------------------------------------------------
;;; - Helpers
;;;
(defun cheat-fu-command (&rest rest)
  "Run the cheat-fu command with the given arguments, display the output."
  (interactive "sArguments for cheat-fu: \n")
  (let ((buffer (get-buffer-create "*cheat-fu*"))
        (cmd (string-join " " rest)))
    (with-current-buffer buffer
      (cheat-fu-mode))
    (shell-command (concat "cheat_fu " cmd) buffer)))

(defun cheat-fu-find-file-button (button)
  (find-file (buffer-substring (button-start button) (button-end button))))

(defun cheat-fu-completing-read (&rest args)
  "Uses `*cheat-fu-completing-function-alist*' to call the appropriate completing
  function."
  (let ((reading-fn
         (cadr (assoc cheat-fu-completing-library
                      *cheat-fu-completing-function-alist*))))
    (apply (symbol-function reading-fn) args)))

(defun cheat-fu-project-files (root)
  "Finds all sheets in cheat-fu-sheets."
  (split-string
   (shell-command-to-string
    (concat
     (cheat-fu-string-replace "%s" root cheat-fu-find-sheets-command)
     *cheat-fu-to-include*
     " | sed 's:"
     cheat-fu-root
     "::'")) "\n" t))

;; http://snipplr.com/view/18683/stringreplace/
(defun cheat-fu-string-replace (this withthat in)
  "replace THIS with WITHTHAT' in the string IN"
  (with-temp-buffer
    (insert in)
    (goto-char (point-min))
    (while (search-forward this nil t)
      (replace-match withthat nil t))
    (buffer-substring (point-min) (point-max))))

;;; ----------------------------------------------------------------------------
;;; - cheat-fu mode
;;;
(defvar cheat-fu-mode-map
  (let ((keymap (make-sparse-keymap)))
    (define-key keymap "l" 'cheat-fu-list)
    (define-key keymap "s" 'cheat-fu-search)
    (define-key keymap "c" 'cheat-fu-convert)
    (define-key keymap "b" 'cheat-fu-buttonize-buffer)
    keymap))

(define-minor-mode cheat-fu-mode "Cheat-Fu Emulation Minor Mode"
  :lighter " cheat-fu"
  (use-local-map cheat-fu-mode-map))

(provide 'cheat-fu)
;;; cheat-fu.el ends here