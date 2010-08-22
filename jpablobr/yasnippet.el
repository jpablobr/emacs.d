;; Snippets

(require 'css-mode)
(require 'markdown-mode)
(require 'js)
;(require 'yaml-mode)

(add-to-list 'load-path 
             (concat dotfiles-dir "/vendor/yasnippet.el"))
(require 'yasnippet)

(yas/define-snippets  'nxhtml-mode nil  'html-mode)
(yas/define-snippets  'js2-mode nil  'javascript-mode)

;; other snippets
;;(yas/load-directory (concat dotfiles-dir "vendor/yasnippets-jpablobr"))

;;(yas/load-directory (concat dotfiles-dir "/vendor/yasnippet.el/snippets"))
(require 'dropdown-list)
(setq yas/prompt-functions '(  yas/dropdown-prompt
                               yas/completing-prompt
                               yas/ido-prompt))

(setq yas/root-directory "~/.emacs.d/vendor/yasnippets-jpablobr")
(yas/load-directory yas/root-directory)
(setq yas/global-mode t)
(setq yas/minor-mode-on t)
(add-hook 'the-major-mode-hook 'yas/minor-mode-on)
(provide 'yasnippet)