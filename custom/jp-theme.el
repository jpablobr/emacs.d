(setq theaming-dir (concat vendor-dir "/theaming"))
(add-to-list 'load-path theaming-dir)
(require 'color-theme)

(load-file (concat theaming-dir "/color-theme-zenburn.el"))
(color-theme-zenburn)

(when window-system
  (defun transparency ()
    "Sets transparency"
    (interactive)
    (set-frame-parameter (selected-frame) 'alpha '(85 85))
    (add-to-list 'default-frame-alist '(alpha 85 85)))

  (defun reset-transparency ()
    "Resets transparency"
    (interactive)
    (set-frame-parameter (selected-frame) 'alpha '(100 100))
    (add-to-list 'default-frame-alist '(alpha 100 100)))); - when window-system

(provide 'jp-theme)