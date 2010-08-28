;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Yasnippets
;;;
(require 'css-mode)
(require 'markdown-mode)
(require 'espresso)
(require 'yaml-mode)

(add-to-list 'load-path 
             (concat dotfiles-dir "/vendor/yasnippet.el"))
(require 'yasnippet)

(require 'dropdown-list)
(setq yas/prompt-functions '(  yas/dropdown-prompt
                               yas/completing-prompt
                               yas/ido-prompt))

(setq yas/root-directory (concat dotfiles-dir "vendor/yasnippets-jpablobr")) ;"~/.emacs.d/vendor/yasnippets-jpablobr")
(yas/load-directory yas/root-directory)
(setq yas/global-mode t)
(setq yas/minor-mode t)
(setq yas/minor-mode-on)
(add-hook 'the-major-mode-hook 'yas/minor-mode-on)

;;; ---------------------------------------------------------
;;; - hooks for different modes on specific modes
;;;
(yas/define-snippets  'nxhtml-mode nil  'html-mode)
(yas/define-snippets  'js2-mode nil  'javascript-mode)

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (setq yas/mode-symbol 'text-mode)))

(add-hook 'js2-mode-hook
          '(lambda ()
             (setq yas/mode-symbol 'espresso-mode)))

(provide 'yasnippet)