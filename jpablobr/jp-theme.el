;;jp-theme.el ---------------------------------------------------------

;; Theaming
(setq theaming-dir (concat vendor-dir "/theaming"))
(load-file (concat theaming-dir "/color-theme-tangotango/color-theme-tango.el"))
(load-file (concat theaming-dir "/color-theme-tangotango/color-theme-tangotango.el"))
(color-theme-tangotango) ;; (color-theme-twilight) (color-theme-topfunky)

;; ----------------------------------------------------------------------------
;; - Transparency
;; - Also see (transparency) and (reset-trasnparency) helper functions
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))

;;; ---------------------------------------------------------
;;; - maxframe
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
;;(add-hook 'window-setup-hook 'ecb-redraw-layout t)

(provide 'jp-theme)