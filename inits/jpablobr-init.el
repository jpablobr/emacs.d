(defvar *emacs-load-start* (current-time))
(setq dotfiles-dir "~/.emacs.d/")
(setq vendor-dir (concat dotfiles-dir "vendor"))
(setq jpablobr-dir (concat dotfiles-dir "/custom"))
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
(load-file (concat jpablobr-dir "/jp-flymake.el"))
(require 'jp-flymake)
(load-file (concat jpablobr-dir "/jp-ruby.el"))
(require 'jp-ruby)
(load-file (concat jpablobr-dir "/jp-autocomplete.el"))
(require 'jp-autocomplete)
(load-file (concat jpablobr-dir "/jp-w3m.el"))
(require 'jp-w3m)
(load-file (concat jpablobr-dir "/jp-eshell.el"))
(require 'jp-eshell)
(load-file (concat jpablobr-dir "/jp-anything.el"))
(require 'jp-anything)
(load-file (concat jpablobr-dir "/jp-compile.el"))
(require 'jp-compile)
(load-file (concat jpablobr-dir "/jp-php.el"))
(require 'jp-php)
(load-file (concat jpablobr-dir "/jp-keyboard.el"))
(require 'jp-keyboard)
(load-file "~/.private/.jp-private.el")
(require 'jp-private)


;; ---------------------------------------------------------------------
;; - requiring yasnippets after everything has been loaded.
(load-file (concat jpablobr-dir "/jp-yasnippet.el"))
(require 'jp-yasnippet)
(load-file (concat jpablobr-dir "/jp-hippie.el"))
(require 'jp-hippie)

;; ---------------------------------------------------------------------
;; - Startup
;; (fullscreen-toggle)
(menu-bar-mode 0)
(shell)
(jp-load-yasnippets)
(r-rhtml)
(setq deft-extension "md")
(setq deft-directory "~/.private/notes")
(setq deft-text-mode 'markdown-mode)
(cheat-fu-deft)
(deft)
(setq initial-scratch-message nil)
(cd "~/")
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
(message "nw-jpablobr.el loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))