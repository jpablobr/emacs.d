
(setq org-completion-use-ido t)
(require 'org-special-blocks)
;; (if window-system (require 'org-mouse))

;; Compatibility with WindMove
;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\M-\C-n" 'outline-next-visible-heading)
            (local-set-key "\M-\C-p" 'outline-previous-visible-heading)
            (local-set-key "\M-\C-u" 'outline-up-heading)
            ;; table
            (local-set-key "\M-\C-w" 'org-table-copy-region)
            (local-set-key "\M-\C-y" 'org-table-paste-rectangle)
            (local-set-key "\M-\C-l" 'org-table-sort-lines)
            ;; display images
            (local-set-key "\M-I" 'org-toggle-iimage-in-org)
            ;; yasnippet (using the new org-cycle hooks)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)
            ))

(setq org-plantuml-jar-path
      (expand-file-name "~/bin/java/plantuml.jar"))

(org-babel-lob-ingest
 (expand-file-name
  "library-of-babel.org"
  (expand-file-name
   "babel"
   (expand-file-name
    "contrib"
     (expand-file-name "org" misc-dir)))))

(setq org-use-speed-commands t)

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
   (plantuml . t)
   (ditaa . t)))

(add-to-list 'org-src-lang-modes
             '("r" . ess-mode))

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(setq org-confirm-babel-evaluate nil)

(unless (boundp 'Info-directory-list)
  (setq Info-directory-list Info-default-directory-list))
(setq Info-directory-list
      (cons (expand-file-name
             "doc"
              (expand-file-name "org" misc-dir))
            Info-directory-list))

(setq TeX-open-quote "“")
(setq TeX-close-quote "”")

;; Synctex with Skim
;;(add-hook 'TeX-mode-hook
;;(lambda ()
;;(add-to-list 'TeX-output-view-style
;;'("^pdf$" "."
;; "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")))
;; )

;; Make emacs aware of multi-file projects
;; (setq-default TeX-master nil)

;; Auto-raise Emacs on activation (from Skim, usually)
;; (defun raise-emacs-on-aqua()
;; (shell-command "osascript -e 'tell application \"Emacs\" to activate' &"))
;; (add-hook 'server-switch-hook 'raise-emacs-on-aqua)

;; Make RefTex able to find my local bib files
(setq reftex-bibpath-environment-variables
'("/home/jpablobr/Dropbox/private-dotfiles/texmf/bibtex/bib"))

;; Default bibliography
(setq reftex-default-bibliography
'("/home/jpablobr/Dropbox/documents/bibs/socbib.bib"))


;; CDLaTex minor mode: tab-trigger environments, paired paren
;; insertion, etc
;; (autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
;; (autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)
;; (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX
;;                                         ; mode

;; set which characters are autopaired // Doesn't work. Set in custom, below.
;; (add-hook 'cdlatex-mode-hook
;;   (function (lambda ()
;;               (setq cdlatex-paired-parens
;;                     '("$[{("))
;;             )))

(fset 'run-vc-then-xelatex
[?\M-! ?v ?c return ?\C-c ?\C-c return])
(global-set-key (kbd "C-c c") 'run-vc-then-xelatex);; Run the VC command before running xelatex
(fset 'run-vc-then-xelatex
[?\M-! ?v ?c return ?\C-c ?\C-c return])
(global-set-key (kbd "C-c c") 'run-vc-then-xelatex)

(global-set-key (kbd "C-c v")
                    (lambda ()
                      (interactive)
                      (shell-command "vc")))

(setenv "PATH" (concat "/home/jpablobr/.cabal/bin:" (getenv "PATH")))
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)

(setq ibuffer-saved-filter-groups
    '(("home"
 ("emacs-config" (or (filename . ".emacs.d")
         (filename . "emacs-config")))
 ("Org" (or (mode . org-mode)
      (filename . "OrgMode")))
 ("Web Dev" (or (mode . html-mode)
    (mode . css-mode)))
 ("Magit" (name . "\*magit"))
 ("ESS" (mode . ess-mode))
       ("LaTeX" (mode . latex-mode))
 ("Help" (or (name . "\*Help\*")
       (name . "\*Apropos\*")
       (name . "\*info\*"))))))

      (add-hook 'ibuffer-mode-hook
             '(lambda ()
             (ibuffer-switch-to-saved-filter-groups "home")))
     (setq ibuffer-show-empty-filter-groups nil)
     (setq ibuffer-expert t)
     (add-hook 'ibuffer-mode-hook
     '(lambda ()
     (ibuffer-auto-mode 1)
     (ibuffer-switch-to-saved-filter-groups "home")))

(setq org-archive-location "~/Dropbox/org/archive.org::From %s")

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
;; Set to the files (or directory of files) you want sync'd
(setq org-agenda-files (quote ("~/Dropbox/org")))
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/from-mobile.org")

(setq org-src-window-setup 'current-window)

(require 'org-latex)
;; Choose either listings or minted for exporting source code blocks.
;; Using minted (as here) requires pygments be installed. To use the
;; default listings package instead, use
;; (setq org-export-latex-listings t)
;; and change references to "minted" below to "listings"
(setq org-export-latex-listings 'minted)

;; default settings for minted code blocks
(setq org-export-latex-minted-options
      '(;("frame" "single")
        ("bgcolor" "bg") ; bg will need to be defined in the preamble of your document. It's defined in org-preamble-pdflatex.sty and org-preamble-xelatex.sty below.
        ("fontsize" "\\small")))


;; Originally taken from Bruno Tavernier: http://thread.gmane.org/gmane.emacs.orgmode/31150/focus=31432
;; but adapted to use latexmk 4.22 or higher.
(defun my-auto-tex-cmd ()
  "When exporting from .org with latex, automatically run latex,
               pdflatex, or xelatex as appropriate, using latexmk."
  (let ((texcmd)))
  ;; default command: pdflatex
  (setq texcmd "latexmk -pdflatex='pdflatex --shell-escape' -pdf %f")
  ;; pdflatex -> .pdf
  (if (string-match "LATEX_CMD: pdflatex" (buffer-string))
      (setq texcmd "latexmk -pdflatex='pdflatex --shell-escape' -pdf %f"))
  ;; xelatex -> .pdf
            (if (string-match "LATEX_CMD: xelatex" (buffer-string))
                (setq texcmd "latexmk -pdflatex='xelatex --shell-escape' -pdf %f"))
            ;; LaTeX compilation command
            (setq org-latex-to-pdf-process (list texcmd)))

(add-hook 'org-export-latex-after-initial-vars-hook 'my-auto-tex-cmd)

;; Default packages included in /every/ tex file, latex, pdflatex or xelatex
(setq org-export-latex-packages-alist
                '(("" "graphicx" t)
                      ("" "longtable" nil)
                      ("" "float" )))

;; Custom packages
(defun my-auto-tex-parameters ()
  "Automatically select the tex packages to include."
  ;; default packages for ordinary latex or pdflatex export
  (setq org-export-latex-default-packages-alist
        '(("AUTO" "inputenc" t)
          ("minted,minion" "org-preamble-pdflatex" t)))
  ;; Packages to include when xelatex is used
                (if (string-match "LATEX_CMD: xelatex" (buffer-string))
                    (setq org-export-latex-default-packages-alist
                          '(("minted" "org-preamble-xelatex" t) )))


                (if (string-match "LATEX_CMD: pdflatex" (buffer-string))
                    (setq org-export-latex-classes
                          (cons '("article"
                                  "\\documentclass[11pt,article,oneside]{memoir}
  \\input{vc} % vc package"
                                  ("\\section{%s}" . "\\section*{%s}")
                                  ("\\subsection{%s}" . "\\subsection*{%s}")
                                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
                                org-export-latex-classes)))

                (if (string-match "LATEX_CMD: xelatex" (buffer-string))
                    (setq org-export-latex-classes
                          (cons '("article"
                                  "\\documentclass[11pt,article,oneside]{memoir}
\\input{vc} % vc package"
                                  ("\\section{%s}" . "\\section*{%s}")
                                  ("\\subsection{%s}" . "\\subsection*{%s}")
                                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
                                org-export-latex-classes))))

          (add-hook 'org-export-latex-after-initial-vars-hook 'my-auto-tex-parameters)

(org-add-link-type "ebib" 'ebib)

 (org-add-link-type
   "cite" 'ebib
   (lambda (path desc format)
     (cond
      ((eq format 'latex)
       (if (or (not desc) (equal 0 (search "cite:" desc)))
             (format "\\cite{%s}" path)
             (format "\\cite[%s]{%s}" desc path))))))

 (org-add-link-type
   "parencite" 'ebib
   (lambda (path desc format)
     (cond
      ((eq format 'latex)
       (if (or (not desc) (equal 0 (search "parencite:" desc)))
             (format "\\parencite{%s}" path)
             (format "\\parencite[%s]{%s}" desc path))))))

(org-add-link-type
   "textcite" 'ebib
   (lambda (path desc format)
     (cond
      ((eq format 'latex)
       (if (or (not desc) (equal 0 (search "textcite:" desc)))
             (format "\\textcite{%s}" path)
             (format "\\textcite[%s]{%s}" desc path))))))

(org-add-link-type
   "autocite" 'ebib
   (lambda (path desc format)
     (cond
      ((eq format 'latex)
       (if (or (not desc) (equal 0 (search "autocite:" desc)))
             (format "\\autocite{%s}" path)
         (format "\\autocite[%s]{%s}" desc path))))))

(org-add-link-type
 "footcite" 'ebib
 (lambda (path desc format)
   (cond
    ((eq format 'latex)
     (if (or (not desc) (equal 0 (search "footcite:" desc)))
         (format "\\footcite{%s}" path)
       (format "\\footcite[%s]{%s}" desc path))))))

(org-add-link-type
 "fullcite" 'ebib
 (lambda (path desc format)
   (cond
    ((eq format 'latex)
     (if (or (not desc) (equal 0 (search "fullcite:" desc)))
         (format "\\fullcite{%s}" path)
       (format "\\fullcite[%s]{%s}" desc path))))))

(org-add-link-type
 "citetitle" 'ebib
 (lambda (path desc format)
   (cond
    ((eq format 'latex)
     (if (or (not desc) (equal 0 (search "citetitle:" desc)))
         (format "\\citetitle{%s}" path)
       (format "\\citetitle[%s]{%s}" desc path))))))

(org-add-link-type
 "citetitles" 'ebib
 (lambda (path desc format)
   (cond
    ((eq format 'latex)
     (if (or (not desc) (equal 0 (search "citetitles:" desc)))
         (format "\\citetitles{%s}" path)
       (format "\\citetitles[%s]{%s}" desc path))))))

(org-add-link-type
   "headlessfullcite" 'ebib
   (lambda (path desc format)
     (cond
      ((eq format 'latex)
       (if (or (not desc) (equal 0 (search "headlessfullcite:" desc)))
             (format "\\headlessfullcite{%s}" path)
             (format "\\headlessfullcite[%s]{%s}" desc path))))))
