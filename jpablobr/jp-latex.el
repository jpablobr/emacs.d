;;jp-latex.el ----------------------------------------------------------------------------
;;; -
(require 'reftex)
(load "auctex.el" nil t t)

(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))

;; Configure RefTeX
;; Default Bibliography
;; - This is important when editing source code in Org-babel, since
;; the LaTeX source code block being edited probably doesn't
;; include the \bibliography{} command that RefTeX uses to find
;; bibliographic database(s).  Make certain also that RefTeX has a
;; path to the bibliographic databases.  This source-code block is
;; turned off be default as it should be configured by the user in
;; a personal file/directory.

(setq reftex-default-bibliography
      (quote
       ("bibtex.bib" "local.bib")))
;; (org-babel-add-interpreter "latex")
;; (add-to-list 'org-babel-tangle-langs '("latex" "tex"))
;; (require 'org-babel-latex)

(add-to-list 'org-babel-noweb-error-langs "latex")

(org-add-link-type "ebib" 'ebib)

(org-add-link-type
 "citep" 'ebib
 (lambda (path desc format)
   (cond
    ((eq format 'latex)
     (if (or (not desc) (equal 0 (search "citep:" desc)))
         (format "\\citep{%s}" path)
       (format "\\citep[%s]{%s}" desc path)
       )))))

(autoload 'ebib "ebib" "Ebib, a BibTeX database manager." t)

(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
     ;enable auto-revert-mode to update reftex when bibtex file changes on disk
     (global-auto-revert-mode t)
     (reftex-parse-all)
     ;add a custom reftex cite format to insert links
     (reftex-set-cite-format
      '((?b . "[[bib:%l][%l-bib]]")
        (?n . "[[notes:%l][%l-notes]]")
        (?p . "[[papers:%l][%l-paper]]")
        (?t . "%t")
        (?h . "** %t\n:PROPERTIES:\n:Custom_ID: %l\n:END:\n[[papers:%l][%l-paper]]")))))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

(defun org-mode-reftex-search ()
  ;;jump to the notes for the paper pointed to at from reftex search
  (interactive)
  (org-open-link-from-string (format "[[notes:%s]]" (reftex-citation t))))

(setq org-link-abbrev-alist
      '(("bib" . "~/org/papers/refs/refs.bib::%s")
    ("notes" . "~/org/notes/notes.org::#%s")
    ("papers" . "~/org/papers/%s.pdf")))

(provide 'jp-latex)
