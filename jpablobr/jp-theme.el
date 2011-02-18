;;; -*- coding: utf-8-unix; -*-
;;jp-theme.el ---------------------------------------------------------
;;; - Theme Sat 2010-08-28 - 10:06 AM
;;;
;; Theaming
(setq theaming-dir (concat vendor-dir "/theaming"))
(load-file (concat theaming-dir "/blackboard.el"))
(load-file (concat theaming-dir "/color-theme-twilight.el"))
(load-file (concat theaming-dir "/color-theme-tangotango/color-theme-tango.el"))
(load-file (concat theaming-dir "/color-theme-tangotango/color-theme-tangotango.el"))
(color-theme-tangotango) ;; (color-theme-twilight) (color-theme-topfunky)

;;; ----------------------------------------------------------------------------
;;; - Transparency
;;; - Also see (transparency) and (reset-trasnparency) helper functions
;;;
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

;;; ---------------------------------------------------------
;;; - maxframe
;;;
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
;;(add-hook 'window-setup-hook 'ecb-redraw-layout t)

;;; ---------------------------------------------------------
;;; - customization
;;;
(custom-set-faces
 '(whitespace-line ((t (:background "purple" :foreground "green"))))
 '(default-frame-alist (quote ((tool-bar-lines . 0) (foreground-color\. "white") (background-color . "black") (menu-bar-lines . 1))))
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
 '(whitespace-line ((t (:background "purple" :foreground "green"))))

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
(provide 'jp-theme)