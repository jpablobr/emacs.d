(defvar *emacs-load-start* (current-time))
(setq dotfiles-dir "~/.emacs.d/")
(setq vendor-dir (concat dotfiles-dir "vendor"))
(setq jpablobr-dir (concat dotfiles-dir "/custom"))
(setq misc-dir (concat dotfiles-dir "/vendor/misc"))
(setq jpablobr-lib (concat jpablobr-dir "/lib"))
(add-to-list 'load-path jpablobr-lib)
(add-to-list 'load-path misc-dir)

(require 'jp-lib-module-loader)
(jp-main-module-loader)

(message "init.el loaded in %ds"
         (destructuring-bind (hi lo ms)
             (current-time)
           (- (+ hi lo)
              (+
               (first *emacs-load-start*)
               (second *emacs-load-start*)))))
