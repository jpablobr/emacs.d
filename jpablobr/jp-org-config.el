;;; -*- coding: utf-8-unix; -*-
;;jp-org-config.el ---------------------------------------------------------

(require 'org-install)

;;; Startup
(when (file-exists-p "~/org/notes")
  (find-file "~/org/notes")
  (setq default-directory "~/")
  (require 'calendar)
  (when (require 'org nil t)
    (call-interactively 'org-agenda-list)))

(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

  (add-hook 'org-mode-hook
            (lambda ()
n              (local-set-key "\M-\C-n" 'outline-next-visible-heading)
              (local-set-key "\M-\C-p" 'outline-previous-visible-heading)
              (local-set-key "\M-\C-u" 'outline-up-heading)
              ;; table
              (local-set-key "\M-\C-w" 'org-table-copy-region)
              (local-set-key "\M-\C-y" 'org-table-paste-rectangle)
              (local-set-key "\M-\C-l" 'org-table-sort-lines)
              ;; display images
              (local-set-key "\M-I" 'org-toggle-iimage-in-org)
              ;; yasnippet (using the new org-cycle hooks)
              ;; (make-variable-buffer-local 'yas/trigger-key)
              ;; (setq yas/trigger-key [tab])
              ;; (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
              ;; (define-key yas/keymap [tab] 'yas/next-field)
              ))

(setq org-use-speed-commands t)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (sh . t)
   (R . t)
   (perl . t)
   (ruby . t)
   (python . t)
   (js . t)
   (haskell . t)
   (clojure . t)
   (ditaa . t)))

(setq org-confirm-babel-evaluate nil)

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(org-babel-lob-ingest
 (expand-file-name
  "library-of-babel.org"
  (expand-file-name
   "babel"
   (expand-file-name
    "contrib"
    (expand-file-name
     "org"
     (expand-file-name "src" dotfiles-dir))))))

(if (boundp 'Info-directory-list)
    (setq Info-directory-list (append Info-directory-list
                                      Info-default-directory-list))
  (setq Info-directory-list Info-default-directory-list))
(setq Info-directory-list
      (cons (expand-file-name
             "doc"
             (expand-file-name
              "org"
              (expand-file-name "src" dotfiles-dir)))
            Info-directory-list))

(unless (boundp 'org-publish-project-alist)
  (setq org-publish-project-alist nil))
(let ((this-dir (file-name-directory (or load-file-name buffer-file-name))))
  (add-to-list 'org-publish-project-alist
               `("starter-kit-documentation"
                 :base-directory ,this-dir
                 :base-extension "org"
                 :style "<link rel=\"stylesheet\" href=\"emacs.css\" type=\"text/css\"/>"
                 :publishing-directory ,this-dir
                 :index-filename "starter-kit.org"
                 :auto-postamble nil)))

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org-mode")

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org-mode/inbox.org")

;; Set the agenda files
(setq org-agenda-files (list "~/Dropbox/org-mode/work.org"
                             "~/Dropbox/org-mode/school.org"
                             "~/Dropbox/org-mode/jpablobr.org"))

;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")

(defun wicked/org-update-checkbox-count (&optional all)
  "Update the checkbox statistics in the current section.
This will find all statistic cookies like [57%] and [6/12] and update
them with the current numbers.  With optional prefix argument ALL,
do this for the whole buffer."
  (interactive "P")
  (save-excursion
    (let* ((buffer-invisibility-spec (org-inhibit-invisibility))
           (beg (condition-case nil
                    (progn (outline-back-to-heading) (point))
                  (error (point-min))))
           (end (move-marker
                 (make-marker)
                 (progn (or (outline-get-next-sibling) ;; (1)
                            (goto-char (point-max)))
                        (point))))
           (re "\\(\\[[0-9]*%\\]\\)\\|\\(\\[[0-9]*/[0-9]*\\]\\)")
           (re-box
            "^[ \t]*\\(*+\\|[-+*]\\|[0-9]+[.)]\\) +\\(\\[[- X]\\]\\)")
           b1 e1 f1 c-on c-off lim (cstat 0))
      (when all
        (goto-char (point-min))
        (or (outline-get-next-sibling) (goto-char (point-max))) ;; (2)
        (setq beg (point) end (point-max)))
      (goto-char beg)
      (while (re-search-forward re end t)
        (setq cstat (1+ cstat)
              b1 (match-beginning 0)
              e1 (match-end 0)
              f1 (match-beginning 1)
              lim (cond
                   ((org-on-heading-p)
                    (or (outline-get-next-sibling) ;; (3)
                        (goto-char (point-max)))
                    (point))
                   ((org-at-item-p) (org-end-of-item) (point))
                   (t nil))
              c-on 0 c-off 0)
        (goto-char e1)
        (when lim
          (while (re-search-forward re-box lim t)
            (if (member (match-string 2) '("[ ]" "[-]"))
                (setq c-off (1+ c-off))
              (setq c-on (1+ c-on))))
          (goto-char b1)
          (insert (if f1
                      (format "[%d%%]" (/ (* 100 c-on)
                                          (max 1 (+ c-on c-off))))
                    (format "[%d/%d]" c-on (+ c-on c-off))))
          (and (looking-at "\\[.*?\\]")
               (replace-match ""))))
      (when (interactive-p)
        (message "Checkbox statistics updated %s (%d places)"
                 (if all "in entire file" "in current outline entry")
                 cstat)))))
(defadvice org-update-checkbox-count (around wicked activate)
  "Fix the built-in checkbox count to understand headlines."
  (setq ad-return-value
        (wicked/org-update-checkbox-count (ad-get-arg 1))))


;;; ----------------------------------------------------------------------------
;;; - Latex
;;; - description
;;; - % apt-get install texlive-full
(require 'org-latex)
(setq org-export-latex-listings t)
(add-to-list 'org-export-latex-classes
             '("org-article"
               "\\documentclass{org-article}
                 [NO-DEFAULT-PACKAGES]
                 [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-export-latex-packages-alist '("" "listings"))
(add-to-list 'org-export-latex-packages-alist '("" "color"))

;;; ----------------------------------------------------------------------------
;;; - Project Exporting
;;;
; experimenting with docbook exports - not finished
(setq org-export-docbook-xsl-fo-proc-command "fop %s %s")
(setq org-export-docbook-xslt-proc-command "xsltproc --output %s /usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl %s")
;
; Inline images in HTML instead of producting links to the image
(setq org-export-html-inline-images t)
; Do not use sub or superscripts - I currently don't need this functionality in my documents
(setq org-export-with-sub-superscripts nil)
; Use org.css from the norang website for export document stylesheets
(setq org-export-html-style-extra "<link rel=\"stylesheet\" href=\"/org.css\" type=\"text/css\" />")
(setq org-export-html-style-include-default nil)
; Do not generate internal css formatting for HTML exports
(setq org-export-htmlize-output-type (quote css))
; Export with LaTeX fragments
(setq org-export-with-LaTeX-fragments t)

; List of projects
; org - miscellaneous todo lists for publishing
(setq org-publish-project-alist
      ;
      ; http://org-mode-stuff/  (org-mode-stuff website)
      ; org-mode-stuff this document
      ; org-mode-doc-extra are images and css files that need to be included
      ; org-mode-doc is the top-level project that gets published
      ; This uses the same target directory as the 'doc' project
      (quote (("org-mode-stuff"
               :base-directory "~/Dropbox/org-mode/"
               :publishing-directory "~/code/org-html"
               :recursive t
               :section-numbers nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function (org-publish-org-to-html org-publish-org-to-org)
               :plain-source t
               :htmlized-source t
               :style-include-default nil
               :style "<link rel=\"stylesheet\" href=\"/org.css\" type=\"text/css\" />"
               :author-info nil
               :creator-info nil)
              ;; ("org-mode-doc-extra"
              ;;  :base-directory "~/dir/"
              ;;  :publishing-directory "/ssh:www-data@www:~/htdocs"
              ;;  :base-extension "css\\|pdf\\|png\\|jpg\\|gif"
              ;;  :publishing-function org-publish-attachment
              ;;  :recursive t
              ;;  :author nil)
              ;; ("org-mode-doc"
              ;;  :components ("org-mode-suff" "org-mode-doc-extra"))
              )))

;; C-S-F12 so I just edit and hit C-S-F12 when I'm done and move on to the next thing.
(defun bh/save-then-publish ()
  (interactive)
  (save-buffer)
  (org-save-all-org-buffers)
  (org-publish-current-project))

(global-set-key (kbd "C-s-<f12>") 'bh/save-then-publish)

(provide 'jp-org-config)
