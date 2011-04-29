;;jp-latex.el ----------------------------------------------------------------------------
;; (add-to-list 'load-path (concat misc-dir "/ultratex-0.80/lisp"))
;;; Ultratex settings
;; (require 'light)
;; (require 'ultex-setup)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
;; (autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
;; (autoload 'reftex-citation "reftex-cite" "Make citation" t)
;; (autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

(dolist (i '("tex" "toc" "sty" "cls" "clo"))
  (add-to-list 'auto-mode-alist (cons (concat "\\." i "\\'") 'tex-mode)))

;; Make RefTeX faster
;; (setq reftex-enable-partial-scans t)
;; (setq reftex-save-parse-info t)
;; (setq reftex-use-multiple-selection-buffers t)
;; (setq reftex-plug-into-AUCTeX t)
;; Make RefTeX work with Org-Mode
;; use 'C-c (' instead of 'C-c [' because the latter is already
;; defined in orgmode to the add-to-agenda command.
;; (defun org-mode-reftex-setup ()
;;   (load-library "reftex")
;;   (and (buffer-file-name)
;;        (file-exists-p (buffer-file-name))
;;        (reftex-parse-all))
;;   (define-key org-mode-map (kbd "C-c (") 'reftex-citation))
;; (add-hook 'org-mode-hook 'org-mode-reftex-setup)
;; ;; RefTeX formats for biblatex (not natbib)
;; (setq reftex-cite-format
;;       '(
;;         (?\C-m . "\\cite[]{%l}")
;;         (?t . "\\textcite{%l}")
;;         (?a . "\\autocite[]{%l}")
;;         (?p . "\\parencite{%l}")
;;         (?f . "\\footcite[][]{%l}")
;;         (?F . "\\fullcite[]{%l}")
;;         (?x . "[]{%l}")
;;         (?X . "{%l}")
;;         ))

;; (setq font-latex-match-reference-keywords
;;       '(("cite" "[{")
;;         ("cites" "[{}]")
;;         ("footcite" "[{")
;;         ("footcites" "[{")
;;         ("parencite" "[{")
;;         ("textcite" "[{")
;;         ("fullcite" "[{")
;;         ("citetitle" "[{")
;;         ("citetitles" "[{")
;;         ("headlessfullcite" "[{")))

;; (setq reftex-cite-prompt-optional-args nil)
;; (setq reftex-cite-cleanup-optional-args t)
;; (add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
;; Biber under AUCTeX
(defun TeX-run-Biber (name command file)
  "Create a process for NAME using COMMAND to format FILE with Biber."
  (let ((process (TeX-run-command name command file)))
    (setq TeX-sentinel-function 'TeX-Biber-sentinel)
    (if TeX-process-asynchronous
        process
      (TeX-synchronous-sentinel name file process))))

(defun TeX-Biber-sentinel (process name)
  "Cleanup TeX output buffer after running Biber."
  (goto-char (point-max))
  (cond
   ;; Check whether Biber reports any warnings or errors.
   ((re-search-backward (concat
                         "^(There \\(?:was\\|were\\) \\([0-9]+\\) "
                         "\\(warnings?\\|error messages?\\))") nil t)
    ;; Tell the user their number so that she sees whether the
    ;; situation is getting better or worse.
    (message (concat "Biber finished with %s %s. "
                     "Type `%s' to display output.")
             (match-string 1) (match-string 2)
             (substitute-command-keys
              "\\\\[TeX-recenter-output-buffer]")))
   (t
    (message (concat "Biber finished successfully. "
                     "Run LaTeX again to get citations right."))))
  (setq TeX-command-next TeX-command-default))

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber"))
  )
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))
(setq reftex-default-bibliography
      (quote
       ("user.bib" "local.bib")))
(require 'ob-latex)
;; (org-babel-add-interpreter "latex")
;; (add-to-list 'org-babel-tangle-langs '("latex" "tex"))
(add-to-list 'org-babel-noweb-error-langs "latex")




;; (require 'reftex)
;; ;; (load "auctex.el" nil t t)
;; ;; (load "preview-latex.el" nil t t)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
;; (add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
;; (setq TeX-PDF-mode t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)
;; ;; (setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))

;; (defun pdf-with-okular ()
;; (add-to-list 'TeX-output-view-style
;; (quote ("^pdf$" "." "okular %o %(outpage)"))))
;; (add-hook 'LaTeX-mode-hook 'pdf-with-okular t)

;; ;;; - Latex
;; ;;; - description
;; ;;; - % apt-get install texlive-full
;; (require 'org-latex)
;; (setq org-export-latex-listings t)
;; (add-to-list 'org-export-latex-classes
;;              '("org-article"
;;                "\\documentclass{org-article}
;;                  [NO-DEFAULT-PACKAGES]
;;                  [EXTRA]"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; (add-to-list 'org-export-latex-packages-alist '("" "listings"))
;; (add-to-list 'org-export-latex-packages-alist '("" "color"))

;; ;; Configure RefTeX
;; ;; Default Bibliography
;; ;; - This is important when editing source code in Org-babel, since
;; ;; the LaTeX source code block being edited probably doesn't
;; ;; include the \bibliography{} command that RefTeX uses to find
;; ;; bibliographic database(s).  Make certain also that RefTeX has a
;; ;; path to the bibliographic databases.  This source-code block is
;; ;; turned off be default as it should be configured by the user in
;; ;; a personal file/directory.

;; (setq reftex-default-bibliography
;;       (quote
;;        ("bibtex.bib" "local.bib")))

(provide 'jp-latex)
