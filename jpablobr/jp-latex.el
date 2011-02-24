;;jp-latex.el ----------------------------------------------------------------------------
;;; -
(require 'reftex)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))

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

(provide 'jp-latex)
