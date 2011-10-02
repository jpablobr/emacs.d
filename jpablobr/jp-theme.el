(setq theaming-dir (concat vendor-dir "/theaming"))
(add-to-list 'load-path theaming-dir)
(require 'color-theme)

(defun jp-theme()
  "load theme interactively."
  (interactive)

  (load-file (concat theaming-dir "/rainbow-mode.el"))
  (autoload 'rainbow-mode "rainbow-mode" t)

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

  (custom-set-faces
   '(diff-added ((((background dark)) (:foreground "#FFFF9B9BFFFF")) (t (:foreground "DarkGreen"))))
   '(diff-changed ((((background dark)) (:foreground "Yellow")) (t (:foreground "MediumBlue"))))
   '(diff-context ((((background dark)) (:foreground "White")) (t (:foreground "Black"))))
   '(diff-file-header ((((background dark)) (:foreground "Cyan" :background "Black")) (t (:foreground "Red" :background "White"))))
   '(diff-function ((t (:foreground "#00bbdd"))))
   '(diff-header ((((background dark)) (:foreground "Cyan")) (t (:foreground "Red"))))
   '(diff-hunk-header ((((background dark)) (:foreground "Black" :background "#05057F7F8D8D")) (t (:foreground "White" :background "Salmon"))))
   '(diff-index ((((background dark)) (:foreground "Magenta")) (t (:foreground "Green"))))
   '(diff-nonexistent ((((background dark)) (:foreground "#FFFFFFFF7474")) (t (:foreground "DarkBlue"))))
   '(diff-refine-change ((((class color) (min-colors 88) (background dark)) (:background "#182042"))))
   '(diff-removed ((((background dark)) (:foreground "#7474FFFF7474")) (t (:foreground "DarkMagenta"))))
   '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
   '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) nil)))
   '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) nil)))
   '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) nil)))
   '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) nil)))
   '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) nil)))
   '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "apple-inconsolata"))))
   '(autoface-default ((t (:inherit default :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "apple-inconsolata"))))
 '(test-failure ((t (:background "black" :foreground "ff3333" :weight bold :height 140 :family "arial"))) t)
 '(test-heading1 ((t (:background "#000000" :foreground "#9999ff" :weight bold :height 140 :family "arial"))) t)
 '(test-heading2 ((t (:background "#000000" :foreground "#9999ff" :weight bold :height 140 :family "arial"))) t)
 '(test-success ((t (:background "black" :foreground "#33ff33" :weight bold :height 140 :family "arial"))) t)
   '(whitespace-line ((t (:background "purple" :foreground "green"))))))

(provide 'jp-theme)