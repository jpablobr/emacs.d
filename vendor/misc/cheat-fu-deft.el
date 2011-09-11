;;; cheat-fu-deft.el --- quickly browse, filter, and edit cheat-fu sheets

;; Copyright (C) 2011 Jose Pablo Barrantes  <xjpablobrx@gmail.com>
;; All rights reserved.

;; Based on "deft.el" but modified for cheat-fu sheets.

;; Copyright (C) 2011 Jason R. Blevins <jrblevin@sdf.org>
;; All rights reserved.

;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions are met:
;; 1. Redistributions of source code must retain the above copyright
;;    notice, this list of conditions and the following disclaimer.
;; 2. Redistributions in binary form must reproduce the above copyright
;;    notice, this list of conditions and the following disclaimer in the
;;    documentation  and/or other materials provided with the distribution.
;; 3. Neither the names of the copyright holders nor the names of any
;;    contributors may be used to endorse or promote products derived from
;;    this software without specific prior written permission.

;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;; POSSIBILITY OF SUCH DAMAGE.

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Cheat-Fu-Deft is an Emacs mode for quickly browsing, filtering, and editing
;; directories of cheat-fu mode, inspired by Notational Velocity.
;; It was designed for increased productivity when writing and taking
;; notes by making it fast and simple to find the right file at the
;; right time and by automating many of the usual tasks such as
;; creating new files and saving files.

;;   * [cheat-fu-deft.el](http://github.org/jpablobr/cheat-fu-deft.el)

;; The Cheat-Fu-Deft buffer is simply a file browser which lists the titles of
;; all text files in the Cheat-Fu-Deft directory followed by short summaries
;; and last modified times.  The title is taken to be the first line
;; of the file and the summary is extracted from the text that
;; follows.  Files are sorted in terms of the last modified date, from
;; newest to oldest.

;; All Cheat-Fu-Deft files or notes are simple plain text files where the first
;; line contains a title.  As an example, the following directory
;; structure generated the screenshot above.
;;
;;     % ls ~/.cheat-fu-sheets
;;     about.1.ronn    browser.1.ronn     directory.1.ronn   operations.1.ronn
;;     ack.1.ronn      completion.1.ronn  extensions.1.ronn  text-mode.1.ronn
;;     binding.1.ronn  creation.1.ronn    filtering.1.ronn
;;
;;     % cat ~/.cheat-fu-deft/ronn.1.ronn
;;     ronn
;;
;;     An Emacs mode for slicing and dicing plain text files.

;; Filtering

;; Cheat-Fu-Deft's primary operation is searching and filtering.  The list of
;; files can be limited or filtered using a search string, which will
;; match both the title and the body text.  To initiate a filter,
;; simply start typing.  Filtering happens on the fly.  As you type,
;; the file browser is updated to include only files that match the
;; current string.

;; To open the first matching file, simply press `RET`.  If no files
;; match your search string, pressing `RET` will create a new file
;; using the string as the title.  This is a very fast way to start
;; writing new notes.  The filename will be generated automatically.
;; If you prefer to provide a specific filename, use `C-RET` instead.

;; To open files other than the first match, navigate up and down
;; using `C-p` and `C-n` and press `RET` on the file you want to open.

;; Press `C-c C-c` to clear the filter string and display all files
;; and `C-c C-g` to refresh the file browser using the current filter
;; string.

;; Static filtering is also possible by pressing `C-c C-l`.  This is
;; sometimes useful on its own, and it may be preferable in some
;; situations, such as over slow connections or on older systems,
;; where interactive filtering performance is poor.

;; Common file operations can also be carried out from within Cheat-Fu-Deft.
;; Files can be renamed using `C-c C-r` or deleted using `C-c C-d`.
;; New files can also be created using `C-c C-n` for quick creation or
;; `C-c C-m` for a filename prompt.  You can leave Cheat-Fu-Deft at any time
;; with `C-c C-q`.

;; Files opened with cheat-fu-deft are automatically saved after Emacs has been
;; idle for a customizable number of seconds.  This value is a floating
;; point number given by `cheat-fu-deft-auto-save-interval' (default: 1.0).

;; Getting Started
;; ---------------

;; To start using it, place it somewhere in your Emacs load-path and
;; add the line

;;     (require 'cheat-fu-deft)

;; in your `.emacs` file.  Then run `M-x cheat-fu-deft` to start.  It is useful
;; to create a global keybinding for the `cheat-fu-deft` function (e.g., a
;; function key) to start it quickly (see below for details).

;; When you first run Cheat-Fu-Deft, it will complain that it cannot find the
;; `~/.cheat_fu_sheets` directory.  You can either create a symbolic link to
;; another directory where you keep your notes or run `M-x cheat-fu-deft-setup`
;; to create the `~/.cheat_fu_sheets` directory automatically.

;; Customization
;; -------------

;; Customize the `cheat-fu-deft` group to change the functionality.

;; By default, Cheat-Fu-Deft looks for notes by searching for files with the
;; extension `.txt` in the `~/.cheat-fu-sheets` directory.  You can customize
;; both the file extension and the Cheat-Fu-Deft directory by running
;; `M-x customize-group` and typing `cheat-fu-deft`.  Alternatively, you can
;; configure them in your `.emacs` file:

;;     (setq cheat-fu-deft-extension "ronn")
;;     (setq cheat-fu-deft-directory "~/Dropbox/cheat_fu_sheets")

;; You can also customize the major mode that Cheat-Fu-Deft uses to edit files,
;; either through `M-x customize-group` or by adding something like
;; the following to your `.emacs` file:

;;     (setq cheat-fu-deft-text-mode 'markdown-mode)

;; You can easily set up a global keyboard binding for Cheat-Fu-Deft.  For
;; example, to bind it to F8, add the following code to your `.emacs`
;; file:

;;     (global-set-key [f8] 'cheat-fu-deft)

;; The faces used for highlighting various parts of the screen can
;; also be customized.  By default, these faces inherit their
;; properties from the standard font-lock faces defined by your current
;; color theme.

;; Acknowledgments
;; ---------------

;; Thanks to Konstantinos Efstathiou for writing simplnote.el, from
;; which I borrowed liberally, and to Zachary Schneirov for writing
;; Notational Velocity, which I have never had the pleasure of using,
;; but whose functionality and spirit I wanted to bring to other
;; platforms, such as Linux, via Emacs.

;;; Code:

(require 'widget)

;; Customization

(defgroup cheat-fu-deft nil
  "Emacs Cheat-Fu-Deft mode."
  :group 'local)

(defcustom cheat-fu-deft-directory (expand-file-name "~/.cheat_fu_sheets/")
  "Cheat-Fu-Deft directory."
  :type 'directory
  :safe 'stringp
  :group 'cheat-fu-deft)

(defcustom cheat-fu-deft-extension "ronn"
  "Cheat-Fu-Deft file extension."
  :type 'string
  :safe 'stringp
  :group 'cheat-fu-deft)

(defcustom cheat-fu-deft-text-mode 'markdown-mode
  "Default mode used for editing files."
  :type 'function
  :group 'cheat-fu-deft)

(defcustom cheat-fu-deft-auto-save-interval 1.0
  "Idle time in seconds before automatically saving buffers opened by Cheat-Fu-Deft.
Set to zero to disable."
  :type 'float
  :group 'cheat-fu-deft)

;; Faces

(defgroup cheat-fu-deft-faces nil
  "Faces used in Cheat-Fu-Deft mode"
  :group 'cheat-fu-deft
  :group 'faces)

(defface cheat-fu-deft-header-face
  '((t :inherit font-lock-keyword-face :bold t))
  "Face for Cheat-Fu-Deft header."
  :group 'cheat-fu-deft-faces)

(defface cheat-fu-deft-filter-string-face
  '((t :inherit font-lock-string-face))
  "Face for Cheat-Fu-Deft filter string."
  :group 'cheat-fu-deft-faces)

(defface cheat-fu-deft-title-face
  '((t :inherit font-lock-function-name-face :bold t))
  "Face for Cheat-Fu-Deft file titles."
  :group 'cheat-fu-deft-faces)

(defface cheat-fu-deft-separator-face
  '((t :inherit font-lock-comment-delimiter-face))
  "Face for Cheat-Fu-Deft separator string."
  :group 'cheat-fu-deft-faces)

(defface cheat-fu-deft-summary-face
  '((t :inherit font-lock-comment-face))
  "Face for Cheat-Fu-Deft file summary strings."
  :group 'cheat-fu-deft-faces)

(defface cheat-fu-deft-time-face
  '((t :inherit font-lock-variable-name-face))
  "Face for Cheat-Fu-Deft last modified times."
  :group 'cheat-fu-deft-faces)

;; Constants

(defconst cheat-fu-deft-version "0.1")

(defconst cheat-fu-deft-buffer "*Cheat-Fu-Deft*"
  "Cheat-Fu-Deft buffer name.")

(defconst cheat-fu-deft-separator " --- "
  "Text used to separate file titles and summaries.")

(defconst cheat-fu-deft-line-width 63
  "Total width of lines in file browser, not including modified time.")

;; Global variables

(defvar cheat-fu-deft-mode-hook nil
  "Hook run when entering Cheat-Fu-Deft mode.")

(defvar cheat-fu-deft-filter-regexp nil
  "Current filter regexp used by Cheat-Fu-Deft.")

(defvar cheat-fu-deft-current-files nil
  "List of files matching current filter.")

(defvar cheat-fu-deft-all-files nil
  "List of files matching current filter.")

(defvar cheat-fu-deft-hash-contents nil
  "Hash containing complete cached file contents, keyed by filename.")

(defvar cheat-fu-deft-hash-mtimes nil
  "Hash containing cached file modification times, keyed by filename.")

(defvar cheat-fu-deft-hash-titles nil
  "Hash containing cached file titles, keyed by filename.")

(defvar cheat-fu-deft-hash-summaries nil
  "Hash containing cached file summaries, keyed by filename.")

(defvar cheat-fu-deft-auto-save-buffers nil
  "List of buffers that will be automatically saved.")

;; File processing

(defun cheat-fu-deft-chomp (str)
  "Trim leading and trailing whitespace from STR."
  (let ((s str))
    (replace-regexp-in-string "\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" "" s)))

(defun cheat-fu-deft-base-filename (file)
  "Strip the path and extension from filename FILE."
  (setq file (file-name-nondirectory file))
  (setq file (replace-regexp-in-string (concat "\." cheat-fu-deft-extension "$") "" file)))

(defun cheat-fu-deft-find-all-files ()
  "Return a list of all files in the Cheat-Fu-Deft directory."
  (if (file-exists-p cheat-fu-deft-directory)
      (let (files result)
        ;; List all files
        (setq files
              (directory-files cheat-fu-deft-directory t
                               (concat "\." cheat-fu-deft-extension "$") t))
        ;; Filter out files that are not readable or are directories
        (dolist (file files)
          (when (and (file-readable-p file)
                     (not (file-directory-p file)))
            (setq result (cons file result))))
        result)))

(defun cheat-fu-deft-parse-title (contents)
  "Parse the given file CONTENTS and determine the title.
The title is taken to be the first non-empty line of a file."
  (let ((begin (string-match "^.+$" contents)))
    (when begin
      (substring contents begin (min (match-end 0)
                                 (+ begin cheat-fu-deft-line-width))))))

(defun cheat-fu-deft-parse-summary (contents title)
  "Parse the file CONTENTS, given the TITLE, and extract a summary.
The summary is a string extracted from the contents following the
title."
  (let* ((contents (replace-regexp-in-string "\n" " " contents))
         (begin (when title (string-match (regexp-quote title) contents)))
         (size (- cheat-fu-deft-line-width (length cheat-fu-deft-separator) (match-end 0))))
    (when begin
      (when (< 0 size)
        (setq contents (substring contents (match-end 0) (length contents)))
        (setq contents (cheat-fu-deft-chomp contents))
        (substring contents 0 (min size (length contents)))))))

(defun cheat-fu-deft-cache-file (file)
  "Update file cache if FILE exists."
  (when (file-exists-p file)
    (let ((mtime-cache (cheat-fu-deft-file-mtime file))
          (mtime-file (nth 5 (file-attributes file))))
      (if (or (not mtime-cache)
              (time-less-p mtime-cache mtime-file))
          (cheat-fu-deft-cache-newer-file file mtime-file)))))

(defun cheat-fu-deft-cache-newer-file (file mtime)
  "Update cached information for FILE with given MTIME."
  ;; Modification time
  (puthash file mtime cheat-fu-deft-hash-mtimes)
  (let (contents title)
    ;; Contents
    (with-current-buffer (get-buffer-create "*Cheat-Fu-Deft temp*")
      (insert-file-contents file nil nil nil t)
      (setq contents (concat (buffer-string))))
    (puthash file contents cheat-fu-deft-hash-contents)
    ;; Title
    (setq title (cheat-fu-deft-parse-title contents))
    (puthash file title cheat-fu-deft-hash-titles)
    ;; Summary
    (puthash file (cheat-fu-deft-parse-summary contents title) cheat-fu-deft-hash-summaries))
  (kill-buffer "*Cheat-Fu-Deft temp*"))

(defun cheat-fu-deft-file-newer-p (file1 file2)
  "Return non-nil if FILE1 was modified since FILE2 and nil otherwise."
  (let (time1 time2)
    (setq time1 (cheat-fu-deft-file-mtime file1))
    (setq time2 (cheat-fu-deft-file-mtime file2))
    (time-less-p time2 time1)))

(defun cheat-fu-deft-cache-initialize ()
  "Initialize hash tables for caching files."
  (setq cheat-fu-deft-hash-contents (make-hash-table :test 'equal))
  (setq cheat-fu-deft-hash-mtimes (make-hash-table :test 'equal))
  (setq cheat-fu-deft-hash-titles (make-hash-table :test 'equal))
  (setq cheat-fu-deft-hash-summaries (make-hash-table :test 'equal)))

(defun cheat-fu-deft-cache-update ()
  "Update cached file information."
  (setq cheat-fu-deft-all-files (cheat-fu-deft-find-all-files))             ; List all files
  (mapc 'cheat-fu-deft-cache-file cheat-fu-deft-all-files)                  ; Cache contents
  (setq cheat-fu-deft-all-files (cheat-fu-deft-sort-files cheat-fu-deft-all-files))) ; Sort by mtime

;; Cache access

(defun cheat-fu-deft-file-contents (file)
  "Retrieve complete contents of FILE from cache."
  (gethash file cheat-fu-deft-hash-contents))

(defun cheat-fu-deft-file-mtime (file)
  "Retrieve modified time of FILE from cache."
  (gethash file cheat-fu-deft-hash-mtimes))

(defun cheat-fu-deft-file-title (file)
  "Retrieve title of FILE from cache."
  (gethash file cheat-fu-deft-hash-titles))

(defun cheat-fu-deft-file-summary (file)
  "Retrieve summary of FILE from cache."
  (gethash file cheat-fu-deft-hash-summaries))

;; File list display

(defun cheat-fu-deft-print-header ()
  "Prints the *Cheat-Fu-Deft* buffer header."
  (if cheat-fu-deft-filter-regexp
      (progn
        (widget-insert
         (propertize "Cheat-Fu-Deft: " 'face 'cheat-fu-deft-header-face))
        (widget-insert
         (propertize cheat-fu-deft-filter-regexp 'face 'cheat-fu-deft-filter-string-face)))
    (widget-insert
         (propertize "Cheat-Fu-Deft" 'face 'cheat-fu-deft-header-face)))
  (widget-insert "\n\n"))

(defun cheat-fu-deft-buffer-setup ()
  "Render the file browser in the *Cheat-Fu-Deft* buffer."
  (let ((inhibit-read-only t))
    (erase-buffer))
  (remove-overlays)
  (cheat-fu-deft-print-header)

  ;; Print the files list
  (if (not (file-exists-p cheat-fu-deft-directory))
      (widget-insert (cheat-fu-deft-no-directory-message))
    (if cheat-fu-deft-current-files
        (progn
          (mapc 'cheat-fu-deft-file-widget cheat-fu-deft-current-files))
      (widget-insert (cheat-fu-deft-no-files-message))))

  (use-local-map cheat-fu-deft-mode-map)
  (widget-setup)
  (goto-char 1)
  (forward-line 2))

(defun cheat-fu-deft-file-widget (file)
  "Add a line to the file browser for the given FILE."
  (when file
    (let ((key (file-name-nondirectory file))
          (text (cheat-fu-deft-file-contents file))
          (title (cheat-fu-deft-file-title file))
          (summary (cheat-fu-deft-file-summary file))
          (mtime (cheat-fu-deft-file-mtime file)))
      (widget-create 'link
                     :button-prefix ""
                     :button-suffix ""
                     :button-face 'cheat-fu-deft-title-face
                     :format "%[%v%]"
                     :tag file
                     :help-echo "Edit this file"
                     :notify (lambda (widget &rest ignore)
                               (cheat-fu-deft-open-file (widget-get widget :tag)))
                     (or title "[Empty file]"))
      (when summary
        (widget-insert (propertize cheat-fu-deft-separator 'face 'cheat-fu-deft-separator-face))
        (widget-insert (propertize summary 'face 'cheat-fu-deft-summary-face)))
      (while (< (current-column) cheat-fu-deft-line-width)
        (widget-insert " "))
      (widget-insert (propertize (format-time-string " %Y-%m-%d %H:%M" mtime)
                                 'face 'cheat-fu-deft-time-face))
      (widget-insert "\n"))))

(defun cheat-fu-deft-refresh ()
  "Refresh the *Cheat-Fu-Deft* buffer in the background."
  (interactive)
  (when (get-buffer cheat-fu-deft-buffer)
    (set-buffer cheat-fu-deft-buffer)
    (cheat-fu-deft-cache-update)
    (cheat-fu-deft-filter-update)
    (cheat-fu-deft-buffer-setup)))

(defun cheat-fu-deft-no-directory-message ()
  "Return a short message to display when the Cheat-Fu-Deft directory does not exist."
  (concat "Directory " cheat-fu-deft-directory " does not exist.\n"))

(defun cheat-fu-deft-no-files-message ()
  "Return a short message to display if no files are found."
  (if cheat-fu-deft-filter-regexp
      "No files match the current filter string.\n"
    "No files found."))

;; File list file management actions

(defun cheat-fu-deft-open-file (file)
  "Open FILE in a new buffer and setting its mode."
  (prog1 (find-file file)
    (funcall cheat-fu-deft-text-mode)
    (add-to-list 'cheat-fu-deft-auto-save-buffers (buffer-name))
    (add-hook 'after-save-hook
              (lambda () (save-excursion (cheat-fu-deft-refresh)))
              nil t)))

(defun cheat-fu-deft-find-file (file)
  "Find FILE interactively using the minibuffer."
  (interactive "F")
  (cheat-fu-deft-open-file file))

(defun cheat-fu-deft-new-file-named (file)
  "Create a new file named FILE (or interactively prompt for a filename).
If the filter string is non-nil, use it as the title."
  (interactive "sNew filename (without extension): ")
  (setq file (concat (file-name-as-directory cheat-fu-deft-directory)
                     file "." cheat-fu-deft-extension))
  (if (file-exists-p file)
      (message (concat "Aborting, file already exists: " file))
    (when cheat-fu-deft-filter-regexp
      (write-region cheat-fu-deft-filter-regexp nil file nil))
    (cheat-fu-deft-open-file file)))

(defun cheat-fu-deft-new-file ()
  "Create a new file quickly, with an automatically generated filename.
If the filter string is non-nil, use it as the title."
  (interactive)
  (let (fmt filename counter temp-buffer)
    (setq counter 0)
    (setq fmt (concat "cheat-fu-deft-%d." cheat-fu-deft-extension))
    (setq filename (concat cheat-fu-deft-directory (format fmt counter)))
    (while (or (file-exists-p filename)
               (get-file-buffer filename))
      (setq counter (1+ counter))
      (setq filename (concat cheat-fu-deft-directory (format fmt counter))))
    (when cheat-fu-deft-filter-regexp
      (write-region (concat cheat-fu-deft-filter-regexp "\n\n") nil filename nil))
    (cheat-fu-deft-open-file filename)
    (with-current-buffer (get-file-buffer filename)
      (goto-char (point-max)))))

(defun cheat-fu-deft-delete-file ()
  "Delete the file represented by the widget at the point.
If the point is not on a file widget, do nothing.  Prompts before
proceeding."
  (interactive)
  (let ((filename (widget-get (widget-at) :tag)))
    (when filename
      (when (y-or-n-p
             (concat "Delete file " (file-name-nondirectory filename) "? "))
        (delete-file filename)
        (delq filename cheat-fu-deft-current-files)
        (delq filename cheat-fu-deft-all-files)
        (cheat-fu-deft-refresh)))))

(defun cheat-fu-deft-rename-file ()
  "Rename the file represented by the widget at the point.
If the point is not on a file widget, do nothing."
  (interactive)
  (let (old-filename new-filename old-name new-name)
    (setq old-filename (widget-get (widget-at) :tag))
    (when old-filename
      (setq old-name (cheat-fu-deft-base-filename old-filename))
      (setq new-name (read-string
                      (concat "Rename " old-name " to (without extension): ")))
      (setq new-filename
            (concat (file-name-as-directory cheat-fu-deft-directory)
                    new-name "." cheat-fu-deft-extension))
      (rename-file old-filename new-filename)
      (cheat-fu-deft-refresh))))

;; File list filtering

(defun cheat-fu-deft-sort-files (files)
  "Sort FILES in reverse order by modified time."
  (sort files (lambda (f1 f2) (cheat-fu-deft-file-newer-p f1 f2))))

(defun cheat-fu-deft-filter-initialize ()
  "Initialize the filter string (nil) and files list (all files)."
  (interactive)
  (setq cheat-fu-deft-filter-regexp nil)
  (setq cheat-fu-deft-current-files cheat-fu-deft-all-files))

(defun cheat-fu-deft-filter-update ()
  "Update the filtered files list using the current filter regexp."
  (if (not cheat-fu-deft-filter-regexp)
      (setq cheat-fu-deft-current-files cheat-fu-deft-all-files)
    (setq cheat-fu-deft-current-files (mapcar 'cheat-fu-deft-filter-match-file cheat-fu-deft-all-files))
    (setq cheat-fu-deft-current-files (delq nil cheat-fu-deft-current-files))))

(defun cheat-fu-deft-filter-match-file (file)
  "Return FILE if FILE matches the current filter regexp."
  (if (or (string-match cheat-fu-deft-filter-regexp (cheat-fu-deft-file-title file))
          (string-match cheat-fu-deft-filter-regexp file)
          (string-match cheat-fu-deft-filter-regexp (cheat-fu-deft-file-contents file)))
      file))

;; Filters that cause a refresh

(defun cheat-fu-deft-filter-clear ()
  "Clear the current filter string and refresh the file browser."
  (interactive)
  (when cheat-fu-deft-filter-regexp
    (setq cheat-fu-deft-filter-regexp nil)
    (setq cheat-fu-deft-current-files cheat-fu-deft-all-files)
    (cheat-fu-deft-refresh))
  (message "Filter cleared."))

(defun cheat-fu-deft-filter (str)
  "Set the filter string to STR and update the file browser."
  (interactive "sFilter: ")
  (if (= (length str) 0)
      (setq cheat-fu-deft-filter-regexp nil)
    (setq cheat-fu-deft-filter-regexp str)
    (setq cheat-fu-deft-current-files (mapcar 'cheat-fu-deft-filter-match-file cheat-fu-deft-all-files))
    (setq cheat-fu-deft-current-files (delq nil cheat-fu-deft-current-files)))
  (cheat-fu-deft-refresh))

(defun cheat-fu-deft-filter-increment ()
  "Append character to the filter regexp and update `cheat-fu-deft-current-files'."
  (interactive)
  (let ((char last-command-event))
    (if (= char ?\S-\ )
	(setq char ?\s))
    (setq char (char-to-string char))
    (setq cheat-fu-deft-filter-regexp (concat cheat-fu-deft-filter-regexp char))
    (setq cheat-fu-deft-current-files (mapcar 'cheat-fu-deft-filter-match-file cheat-fu-deft-current-files))
    (setq cheat-fu-deft-current-files (delq nil cheat-fu-deft-current-files)))
  (cheat-fu-deft-refresh))

(defun cheat-fu-deft-filter-decrement ()
  "Remove last character from the filter regexp and update `cheat-fu-deft-current-files'."
  (interactive)
  (if (> (length cheat-fu-deft-filter-regexp) 1)
      (cheat-fu-deft-filter (substring cheat-fu-deft-filter-regexp 0 -1))
    (cheat-fu-deft-filter-clear)))

(defun cheat-fu-deft-complete ()
  "Complete the current action.
If there is a widget at the point, press it.  If a filter is
applied and there is at least one match, open the first matching
file.  If there is an active filter but there are no matches,
quick create a new file using the filter string as the title.
Otherwise, quick create a new file."
  (interactive)
  (cond
   ;; Activate widget
   ((widget-at)
    (widget-button-press (point)))
   ;; Active filter string with match
   ((and cheat-fu-deft-filter-regexp cheat-fu-deft-current-files)
    (cheat-fu-deft-open-file (car cheat-fu-deft-current-files)))
   ;; Default
   (t
    (cheat-fu-deft-new-file))))

;;; Automatic File Saving

(defun cheat-fu-deft-auto-save ()
  (save-excursion
    (dolist (buf cheat-fu-deft-auto-save-buffers)
      (if (get-buffer buf)
          ;; Save open buffers that have been modified.
          (progn
            (set-buffer buf)
            (when (buffer-modified-p)
              (basic-save-buffer)))
        ;; If a buffer is no longer open, remove it from auto save list.
        (delq buf cheat-fu-deft-auto-save-buffers)))))

;;; Mode definition

(defun cheat-fu-deft-show-version ()
  "Show the version number in the minibuffer."
  (interactive)
  (message "Cheat-Fu-Deft %s" cheat-fu-deft-version))

(defun cheat-fu-deft-setup ()
  "Prepare environment by creating the Cheat-Fu-Deft notes directory."
  (interactive)
  (when (not (file-exists-p cheat-fu-deft-directory))
    (make-directory cheat-fu-deft-directory t))
  (cheat-fu-deft-refresh))

(defvar cheat-fu-deft-mode-map
  (let ((i 0)
        (map (copy-keymap widget-keymap)))
    ;; Extend the filter string by default.
    (setq i ?\s)
    (while (< i 256)
      (define-key map (vector i) 'cheat-fu-deft-filter-increment)
      (setq i (1+ i)))
    ;; Handle backspace and delete
    (define-key map (kbd "DEL") 'cheat-fu-deft-filter-decrement)
    ;; Handle return via completion or opening file
    (define-key map (kbd "RET") 'cheat-fu-deft-complete)
    ;; Filtering
    (define-key map (kbd "C-c C-l") 'cheat-fu-deft-filter)
    (define-key map (kbd "C-c C-c") 'cheat-fu-deft-filter-clear)
    ;; File creation
    (define-key map (kbd "C-c C-n") 'cheat-fu-deft-new-file)
    (define-key map (kbd "C-c C-m") 'cheat-fu-deft-new-file-named)
    (define-key map (kbd "<C-return>") 'cheat-fu-deft-new-file-named)
    ;; File management
    (define-key map (kbd "C-c C-d") 'cheat-fu-deft-delete-file)
    (define-key map (kbd "C-c C-r") 'cheat-fu-deft-rename-file)
    (define-key map (kbd "C-c C-f") 'cheat-fu-deft-find-file)
    ;; Miscellaneous
    (define-key map (kbd "C-c C-g") 'cheat-fu-deft-refresh)
    (define-key map (kbd "C-c C-q") 'quit-window)
    map)
  "Keymap for Cheat-Fu-Deft mode.")

(defun cheat-fu-deft-mode ()
  "Major mode for quickly browsing, filtering, and editing plain text notes.
Turning on `cheat-fu-deft-mode' runs the hook `cheat-fu-deft-mode-hook'.

\\{cheat-fu-deft-mode-map}."
  (interactive)
  (kill-all-local-variables)
  (setq truncate-lines t)
  (setq buffer-read-only t)
  (setq default-directory cheat-fu-deft-directory)
  (use-local-map cheat-fu-deft-mode-map)
  (cheat-fu-deft-cache-initialize)
  (cheat-fu-deft-cache-update)
  (cheat-fu-deft-filter-initialize)
  (setq major-mode 'cheat-fu-deft-mode)
  (setq mode-name "Cheat-Fu-Deft")
  (cheat-fu-deft-buffer-setup)
  (when (> cheat-fu-deft-auto-save-interval 0)
    (run-with-idle-timer cheat-fu-deft-auto-save-interval t 'cheat-fu-deft-auto-save))
  (run-mode-hooks 'cheat-fu-deft-mode-hook))

(put 'cheat-fu-deft-mode 'mode-class 'special)

;;;###autoload
(defun cheat-fu-deft ()
  "Switch to *Cheat-Fu-Deft* buffer and load files."
  (interactive)
  (switch-to-buffer cheat-fu-deft-buffer)
  (if (not (eq major-mode 'cheat-fu-deft-mode))
      (cheat-fu-deft-mode)))

(provide 'cheat-fu-deft)

;;; cheat-fu-deft.el ends here
