;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Theme Sat 2010-08-28 - 10:06 AM
;;;
(load-file "~/.emacs.d/vendor/color-theme-twilight.el")
(load-file "~/.emacs.d/vendor/color-theme-tangotango/color-theme-tango.el")
(load-file "~/.emacs.d/vendor/color-theme-tangotango/color-theme-tangotango.el")
(color-theme-tangotango) ;; (color-theme-twilight)

;;; ----------------------------------------------------------------------------
;;; - Transparency
;;; - Also see (transparency) and (reset-trasnparency) helper functions
;;;
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;;; ---------------------------------------------------------
;;; - maxframe
;;;
(add-to-list  'load-path "~/.emacs.d/vendor/maxframe")
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
(add-hook 'window-setup-hook 'ecb-redraw-layout t)

;;; ---------------------------------------------------------
;;; - customization
;;;
(custom-set-faces
 '(default ((t (:stipple nil
                :background "black"
                :foreground "white"
                :inverse-video nil
                :box nil
                :strike-through nil
                :overline nil
                :underline nil
                :slant normal
                :weight normal
                :height 90 normal))))
 
 '(autoface-default ((t (:inherit default
                         :background "black"
                         :foreground "white"
                         :inverse-video nil
                         :box nil
                         :strike-through nil
                         :overline nil
                         :underline nil
                         :slant normal
                         :weight normal
                         :height 90
                         :width normal)))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) nil))))

(provide 'jp-theme)