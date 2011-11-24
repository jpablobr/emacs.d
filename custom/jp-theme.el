(setq theaming-dir (concat vendor-dir "/theaming"))
(add-to-list 'load-path theaming-dir)
(require 'color-theme)

;; (add-to-list 'load-path (concat theaming-dir "/solarized"))
;; (require 'color-theme-solarized)
;; (color-theme-solarized-dark)

;; (load-file (concat theaming-dir "/color-theme-zenburn.el"))
;; (color-theme-zenburn)

(provide 'jp-theme)