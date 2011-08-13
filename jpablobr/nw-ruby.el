(setq dotfiles-dir "~/.emacs.d/")
(setq vendor-dir (concat dotfiles-dir "vendor"))
(setq jpablobr-dir (concat dotfiles-dir "/jpablobr"))
(setq misc-dir (concat dotfiles-dir "/vendor/misc"))
(add-to-list 'load-path misc-dir)

(load-file (concat jpablobr-dir "/jp-meta.el"))
(require 'jp-meta)
(load-file (concat jpablobr-dir "/jp-misc.el"))
(require 'jp-misc)
(load-file (concat jpablobr-dir "/jp-defuns.el"))
(require 'jp-defuns)
(load-file (concat jpablobr-dir "/jp-registers.el"))
(require 'jp-registers)
(load-file (concat jpablobr-dir "/jp-yaml.el"))
(require 'jp-yaml)
(load-file (concat jpablobr-dir "/jp-markdown.el"))
(require 'jp-markdown)
(load-file (concat jpablobr-dir "/jp-ruby.el"))
(require 'jp-ruby)
(load-file (concat jpablobr-dir "/jp-eshell.el"))
(require 'jp-eshell)
(load-file (concat jpablobr-dir "/jp-autocomplete.el"))
(require 'jp-autocomplete)
(load-file (concat jpablobr-dir "/jp-theme.el"))
(require 'jp-theme)

;; ---------------------------------------------------------------------
;; - requiring yasnippets after everything has been loaded.
(load-file (concat jpablobr-dir "/jp-yasnippet.el"))
(require 'jp-yasnippet)
(load-file (concat jpablobr-dir "/jp-hippie.el"))
(require 'jp-hippie)

;; ---------------------------------------------------------------------
;; - ECB
(custom-set-variables
 '(ecb-source-path (quote ("./"))))

;; To reset every other keybinding.
(load-file (concat jpablobr-dir "/jp-keyboard.el"))
(require 'jp-keyboard)

;; ---------------------------------------------------------------------
;; Base rails pre-loading env stuff
(global-whitespace-mode 1)
(setq whitespace-style '(trailing))
(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(menu-bar-mode 0)
(cd "./")
(autotest)
(find-file "readme.md")
(shell)
(ibuffer)
(kill-buffer "*scratch*")