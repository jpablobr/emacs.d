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

(setq initial-scratch-message
      (shell-command-to-string "/usr/bin/fortune"))

(message "init.el loaded in %ds"
         (destructuring-bind (hi lo ms)
             (current-time)
           (- (+ hi lo)
              (+
               (first *emacs-load-start*)
               (second *emacs-load-start*)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git--timer-sec 1.0)
 '(git-baseline-alist (quote (("/home/jpablobr/code/ruby/gems/ttycoke/" . "master"))) t)
 '(git-state-modeline-decoration (quote git-state-decoration-colored-letter))
 '(git-working-dir-change-behaviour (quote git-refresh-all-saved))
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(vc-follow-symlinks t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:background "red"))))
 '(hl-line ((t (:background "#4f4f4f"))))
 '(isearch ((((class color) (min-colors 8)) (:background "green" :foreground "black")))))
