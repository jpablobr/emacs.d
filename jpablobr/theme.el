;; Theme
(load-file "~/.emacs.d/vendor/color-theme-tangotango/color-theme-tango.el")
(load-file "~/.emacs.d/vendor/color-theme-tangotango/color-theme-tangotango.el")
(color-theme-tangotango)

;; customization
(custom-set-variables
'(default-frame-alist (quote ((tool-bar-lines . 0) (foreground-color. "white") (background-color . "black") (menu-bar-lines . 1))))
'(erc-modules (quote (autojoin button completion fill irccontrols match menu netsplit noncommands readonly ring scrolltobottom stamp track))))

(custom-set-faces
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal))))
 '(autoface-default ((t (:inherit default :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal)))))

(provide 'theme)