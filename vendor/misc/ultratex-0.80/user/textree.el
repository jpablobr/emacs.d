;;; textree.el --- sample textree file.
;; Copyright (c) 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999
;; Mark Haiman, Nick Reingold, John Palmieri

;; (This is a sample file; it is part of the Ultra-TeX package.)

;; This is the alist of TeX control sequences for lightning
;; completion.  If you edit this by hand, then notice that certain
;; special characters, like \ and ", need to be `quoted' with \.  For
;; instance, the string consisting of one double quote is written \",
;; or in quotes, as "\"".  The string consisting of a single backslash
;; is written as "\\".

;; See the documentation for the format of the elements of this list.

(

("\\newcommand{\\}[]{}" -5)

("\\renewcommand{\\}[]{}" -5)

("\\input{}" -1)

("\\newenvironment{}[]{}{}" -7)

("\\newcounter{}" -1)

("\\newtheorem{}[]{}" -5)

("\\cite[]{}" -3)


("\\ " 0)

("\\noindent " 0)

("\\," 0)

("\\!" 0 . ultex-math-mode)

("\\qquad " 0 . ultex-math-mode)

("\\quad " 0 . ultex-math-mode)

("\\hfill " 0)


("\\\\
" 0 . ultex-next-item)

("\\vspace{in}
" -4)

("\\smallskip
" 0)

("\\bigskip
" 0)

("\\allowbreak " 0)

("\\pagebreak

" 0)

("\\newpage
" 0)


("\\item []" -1)

("\\begin{enumerate}
\\item []
\\end{enumerate}" -17)

("\\begin{itemize}
\\item []
\\end{itemize}" -15)

("\\begin{list}{}{}
\\item []
\\end{list}" -23)

("\\begin{quote}

\\end{quote}
" -13)

("\\begin{quotation}

\\end{quotation}
" -17)

("\\begin{tabular}[]{}

\\end{tabular}" -18)

("\\begin{center}

\\end{center}" -13)

("\\begin{array}[]{}

\\end{array}" -16 . ultex-math-mode)


("\\`" 0)

("\\'" 0)

("\\\"" 0)


("\\frac{}{}" -3 . ultex-math-mode)

("\\tilde{}" -1 . ultex-math-mode)

("\\sqrt[]{}" -3 . ultex-math-mode)

("\\%" 0)

("\\$" 0)


("\\{ \\}" -3 . ultex-math-mode)

("\\left( \\right)" -8 . ultex-math-mode)

("\\left( \\right." -8 . ultex-math-mode)

("\\left\\{ \\right\\}" -9 . ultex-math-mode)

("\\left\\{ \\right." -8 . ultex-math-mode)

("\\left[ \\right]" -8 . ultex-math-mode)

("\\left[ \\right." -8 . ultex-math-mode)


("\\relax" 0)

("\\section{}\\label{}" -10)

("\\subsection{}\\label{}" -10)

("\\subsubsection{}\\label{}" -10)

("\\footnote{}" -1)

("\\bibitem[]{}" -3)

)

;;; textree.el ends here
