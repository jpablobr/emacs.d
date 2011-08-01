;;; -*- coding: utf-8-unix; -*-
;;;  jp-registers.el ---------------------------------------------------------
;;; - Set up registers
;;; - Registers allow you to jump to a file or other location
;;; - quickly. Use C-x r j followed by the letter of the register (i for
;;; - init.el, r for this file) to jump to it.
;;; - You should add registers here for the files you edit most often.

(dolist (r `((?i (file . ,(concat dotfiles-dir "init.el")))
             (?k (file . ,(concat jpablobr-dir "/jp-keyboard.el")))
             (?m (file . ,(concat jpablobr-dir "/jp-misc.el")))
             (?d (file . ,(concat jpablobr-dir "/jp-defuns.el")))
             (?t (file . ,(concat jpablobr-dir "/nw-init.el")))
             (?j (file . ,(concat jpablobr-dir "/nw-jpablobr.el")))
             (?a (file . ,"~/.my-precious/bash/plugins/aliases"))
             (?c (file . ,"~/.my-precious/bash/config"))
             (?l (file . ,"~/org/yacs/linux.org"))
             (?z (file . ,"~/.emacs.d/vendor/misc/cheat-fu-mode/cheat-fu.el"))
             (?r (file . ,(concat jpablobr-dir "/jp-registers.el")))))
  (set-register (car r) (cadr r)))

(provide 'jp-registers)