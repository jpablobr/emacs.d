(setq theaming-dir (concat vendor-dir "/theaming"))
(add-to-list 'load-path theaming-dir)
(require 'color-theme)

(load-file (concat theaming-dir "/color-theme-zenburn.el"))
(color-theme-zenburn)

(provide 'jp-theme)