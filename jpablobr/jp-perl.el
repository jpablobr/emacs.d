;;; cperl-mode is preferred to perl-mode
(setq perl-dir (concat vendor-dir "/perl"))
;; (add-to-list 'load-path perl-dir)
(add-to-list 'load-path (concat perl-dir "/pde"))
(load "pde-load")

(setq auto-mode-alist  (cons '("\\.t$" . cperl-mode) auto-mode-alist))

 ;; Rebinding keys for hideshow
(require 'hideshow)
(define-key hs-minor-mode-map "\C-c\C-o"
  (let ((map (lookup-key hs-minor-mode-map "\C-c@")))
    ;; C-h is help to remind me key binding
    (define-key map "\C-h" 'describe-prefix-bindings)
    (define-key map "\C-q" 'hs-toggle-hiding)
    ;; compatible with outline
    (define-key map "\C-c" 'hs-hide-block)
    (define-key map "\C-e" 'hs-show-block)
    map))

(defun pde-perl-mode-hook ()
   (cperl-lazy-install))

(defun pde-perl-mode-hook ()
   ;; chmod when saving
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

(eval-after-load "imenu"
 '(defalias 'imenu--completion-buffer 'pde-ido-imenu-completion))
(autoload 'tags-tree "tags-tree" "Show TAGS tree" t)
;; A wonderful minibuffer completion mode
(partial-completion-mode 1)
(setq PC-include-file-path
      (delete-dups (append PC-include-file-path pde-perl-inc)))
(setq ffap-url-regexp
      (concat
       "\\`\\("
       "news\\(post\\)?:\\|mailto:\\|file:" ; no host ok
       "\\|"
       "\\(ftp\\|https?\\|telnet\\|gopher\\|www\\|wais\\)://" ; needs host
       "\\)[^:]" ; fix for perl module, require one more character that not ":"
       ))
(add-to-list 'ffap-alist  '(cperl-mode . pde-ffap-locate))

(provide 'jp-perl)