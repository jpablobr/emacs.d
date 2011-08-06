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
(load-file (concat jpablobr-dir "/jp-keyboard.el"))
(require 'jp-keyboard)
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
(load-file (concat jpablobr-dir "/jp-w3m.el"))
(require 'jp-w3m)
(load-file (concat jpablobr-dir "/jp-perl.el"))
(require 'jp-perl)

;; ---------------------------------------------------------------------
;; - requiring yasnippets after everything has been loaded.
(load-file (concat jpablobr-dir "/jp-yasnippet.el"))
(require 'jp-yasnippet)
(load-file (concat jpablobr-dir "/jp-hippie.el"))
(require 'jp-hippie)

;; ---------------------------------------------------------------------
;; - Startup
(menu-bar-mode 0)
(setq initial-scratch-message (format-time-string "%a %Y-%m-%d - %l:%M %p"))

(server-start)
