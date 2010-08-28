;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Markdown
;;;
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(setq jpablobr-markdown-imenu-generic-expression
      '(("Top-level Heading" "#\+ \\(\.\*\\)" 1)
        ))

(add-hook 'markdown-mode-hook
          (lambda ()
            (setq imenu-generic-expression jpablobr-markdown-imenu-generic-expression)))

(provide 'markdown)
