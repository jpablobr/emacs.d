(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(dolist (i '("tex" "toc" "sty" "cls" "clo"))
  (add-to-list 'auto-mode-alist (cons (concat "\\." i "\\'") 'tex-mode)))

  ;; Make RefTeX faster
  (setq reftex-enable-partial-scans t)
  (setq reftex-save-parse-info t)
  (setq reftex-use-multiple-selection-buffers t)
  (setq reftex-plug-into-AUCTeX t)

  ;; Make RefTeX work with Org-Mode
  ;; use 'C-c (' instead of 'C-c [' because the latter is already
  ;; defined in orgmode to the add-to-agenda command.
  (defun org-mode-reftex-setup ()
    (load-library "reftex")
    (and (buffer-file-name)
    (file-exists-p (buffer-file-name))
    (reftex-parse-all))
    (define-key org-mode-map (kbd "C-c (") 'reftex-citation))

  ;; RefTeX formats for biblatex (not natbib)
  (setq reftex-cite-format
        '(
          (?\C-m . "\\cite[]{%l}")
          (?t . "\\textcite{%l}")
          (?a . "\\autocite[]{%l}")
          (?p . "\\parencite{%l}")
          (?f . "\\footcite[][]{%l}")
          (?F . "\\fullcite[]{%l}")
          (?x . "[]{%l}")
          (?X . "{%l}")
          ))

  (setq font-latex-match-reference-keywords
        '(("cite" "[{")
          ("cites" "[{}]")
          ("footcite" "[{")
          ("footcites" "[{")
          ("parencite" "[{")
          ("textcite" "[{")
          ("fullcite" "[{")
          ("citetitle" "[{")
          ("citetitles" "[{")
          ("headlessfullcite" "[{")))

  (setq reftex-cite-prompt-optional-args nil)
  (setq reftex-cite-cleanup-optional-args t)

(autoload 'ebib "ebib" "Ebib, a BibTeX database manager." t)
(setq ebib-preload-bib-files
      '("/Users/jpablobr/org/bibs/socbib.bib"))
(add-hook 'LaTeX-mode-hook #'(lambda ()
        (local-set-key "\C-cb" 'ebib-insert-bibtex-key)))

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

(require 'ob-latex)
;; (org-babel-add-interpreter "latex")
;; (add-to-list 'org-babel-tangle-langs '("latex" "tex"))

(add-to-list 'org-babel-noweb-error-langs "latex")
