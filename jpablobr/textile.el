
(require 'textile-mode)

(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

(setq jpablobr-textile-mode-imenu-generic-expression
      '(("Heading" "\\s-*\\(h[0-9]+\\. .+\\)" 1)
        ))
(add-hook 'textile-mode-hook
          (lambda ()
            (setq imenu-generic-expression
                  jpablobr-textile-mode-imenu-generic-expression)))

(provide 'jpablobr/textile)
