(setq perl-dir (concat vendor-dir "/perl"))
(add-to-list 'load-path (concat perl-dir "/pde"))
(load "pde-load")

(setq auto-mode-alist  (cons '("\\.t$" . cperl-mode) auto-mode-alist))

(defun pde-perl-mode-hook ()
  (cperl-lazy-install))

(defun pde-perl-mode-hook ()
  (when (and buffer-file-name
             (not (string-match "\\.\\(pm\\|pod\\)$" (buffer-file-name))))
    (add-hook 'after-save-hook 'executable-chmod nil t))
  (set (make-local-variable 'compile-dwim-check-tools) nil))

(defun pde-perl-mode-hook ()
  (abbrev-mode t)
  (add-to-list 'cperl-style-alist
               '("PDE"
                 (cperl-brace-offset                         . 0)
                 (cperl-close-paren-offset                   . -4)
                 (cperl-continued-brace-offset               . 0)
                 (cperl-continued-statement-offset           . 4)
                 (cperl-extra-newline-before-brace           . nil)
                 (cperl-extra-newline-before-brace-multiline . nil)
                 (cperl-indent-level                         . 4)
                 (cperl-indent-parens-as-block               . t)
                 (cperl-label-offset                         . -4)
                 (cperl-merge-trailing-else                  . t)
                 (cperl-tab-always-indent                    . t)))
  (cperl-set-style "PDE"))

(setq cperl-auto-newline nil)
(setq cperl-electric-keywords t)

(add-to-list 'ffap-alist  '(cperl-mode . pde-ffap-locate))

(provide 'jp-perl)
