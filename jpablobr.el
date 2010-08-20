;; Jose Pablo Barrantes emacs.d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

(require 'meta)
(require 'plain-text)
(require 'unbound)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/textmate.el"))
(require 'textmate)
(textmate-mode)
(require 'whitespace)
(require 'js)
(require 'org)
(require 'markdown)
(require 'haml)
(require 'gist)
(require 'keyboard)
(require 'cedet)

;; ecb
(add-to-list 'load-path "~/.emacs.d/vendor/ecb")
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(ecb-activate)

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

;; RVM MODE
(load-file "~/.emacs.d/vendor/rvm.el/rvm.el")
(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session

;;Artist-mode
(autoload 'artist-mode "artist" "Enter artist-mode" t)

;;Twittering Mode
(add-to-list 'load-path "~/.emacs.d/vendor/twittering-mode")
(require 'twittering-mode)
(setq twittering-username "jpablobr")

;;IRC
(require 'erc)
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#github" "#greasemonkey" "#mongodb" "#emacs" "#heroku" "#rubyonrails" "#padrino" "#sinatra")))

;; Line Numbers
(add-to-list 'load-path "~/.emacs.d/vendor/cheat")
(add-to-list 'auto-mode-alist '("\\.cheat$" . cheat))
(require 'cheat)

;; Line Numbers
(require 'linum)
(global-linum-mode)

;; redo
(add-to-list  'load-path "~/.emacs.d/vendor/redo")
(require 'redo)
(global-set-key [(control -)] 'redo)

;; find-recursive
(add-to-list 'load-path "~/.emacs.d/vendor/find-recursive")
(require 'find-recursive)

;; find-recursive
(add-to-list 'load-path "~/.emacs.d/vendor/ruby-electric")
(require 'ruby-electric)

;; rails-emacs
;;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-rails")
;;(require 'rails)

;; rails-emacs-reloaded
;; (setq load-path (cons (expand-file-name "~/.emacs.d/vendor/emacs-rails-reloaded") load-path))
;; (require 'rails-autoload)

;; css
(add-to-list  'load-path "~/.emacs.d/vendor/css-mode")
(autoload 'css-mode "css-mode" "Mode for editing CSS files" t)
(setq auto-mode-alist (append '(("\\.css$" . css-mode)) auto-mode-alist))
(add-hook 'css-mode-hook
         (lambda()
           (local-set-key (kbd "<return>") 'newline-and-indent)
))
