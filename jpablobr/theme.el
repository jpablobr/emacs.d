;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Theme Sat 2010-08-28 - 10:06 AM
;;;
(load-file "~/.emacs.d/vendor/color-theme-tangotango/color-theme-tango.el")
(load-file "~/.emacs.d/vendor/color-theme-tangotango/color-theme-tangotango.el")
(color-theme-tangotango)

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
(custom-set-variables
'(default-frame-alist (quote ((tool-bar-lines . 0) (foreground-color. "white") (background-color . "black") (menu-bar-lines . 1))))
'(erc-modules (quote (autojoin button completion fill irccontrols match menu netsplit noncommands readonly ring scrolltobottom stamp track))))

(custom-set-faces
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal))))
 '(autoface-default ((t (:inherit default :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal)))))

(provide 'theme)