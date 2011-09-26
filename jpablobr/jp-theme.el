(defun jp-theme()
  "load theme interactively."
  (interactive)

  (setq theaming-dir (concat vendor-dir "/theaming"))
  (add-to-list 'load-path theaming-dir)
  (require 'color-theme)

  (load-file (concat theaming-dir "/rainbow-mode.el"))
  (autoload 'rainbow-mode "rainbow-mode" t)

  (require 'color-theme-jp-solarized)
  (color-theme-jp-solarized-light)
  (set-face-background 'region "#444444")
  (set-face-background 'hl-line "#111111")
  (set-face-foreground 'font-lock-comment-face "#93a1a1")
  (set-face-foreground 'font-lock-comment-delimiter-face "#93a1a1")
  ;; (set-face-foreground 'font-lock-string-face "#d7d7af")
  ;; (set-face-foreground 'font-lock-builtin-face "")
  ;; (set-face-foreground 'font-lock-comment-face "")
  ;; (set-face-foreground 'font-lock-constant-face "")
  ;; (set-face-foreground 'font-lock-function-name-face "")
  ;; (set-face-foreground 'font-lock-keyword-face "")
  ;; (set-face-foreground 'font-lock-type-face "")
  ;; (set-face-foreground 'font-lock-variable-name-face "")
  ;; (set-face-foreground 'font-lock-warning-face "")

(when window-system
  ;; (load-file (concat theaming-dir "/color-theme-tango.el"))
  ;; (load-file (concat theaming-dir "/color-theme-tangotango.el"))
  ;; (color-theme-tangotango)

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

   '(whitespace-line ((t (:background "purple" :foreground "green"))))))

(provide 'jp-theme)