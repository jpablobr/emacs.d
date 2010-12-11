;;; DO NOT MODIFY THIS FILE
(if (featurep 'dosbat-autoloads) (error "Already loaded"))

;;;### (autoloads nil "_pkg" "dosbat/_pkg.el")

(package-provide 'dosbat :version 1.04 :type 'regular)

(autoload 'bat-mode "dosbat" "\
Major mode for editing DOS batch files.

Special commands:

Font lock mode:

Turning on font lock mode causes various DOS batch syntactic
structures to be hightlighted.  It is on by default.

" t nil)
(add-to-list 'auto-mode-alist '("\\.\\(?:bat\\|com\\)$" . bat-mode))

;;;***

(provide 'dosbat-autoloads)
