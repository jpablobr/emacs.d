;; init.el -------------------------------------------------------------
;; - Jose Pablo Barrantes <xjpablobrx@gmail.com>
;; - emacs.d initializations
(setq dotfiles-dir (file-name-directory (or load-file-name (buffer-file-name))))
(setq custom-file (concat dotfiles-dir "custom.el"))
(setq vendor-dir (concat dotfiles-dir "vendor"))
(setq jpablobr-dir (concat dotfiles-dir "/jpablobr"))
(setq misc-dir (concat dotfiles-dir "/vendor/misc"))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path misc-dir)
(load custom-file 'noerror)

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

(provide 'init)