;;; -*- coding: utf-8-unix; -*-
;;jp-registers.el ---------------------------------------------------------
;;; - Set up registers
;;; - Registers allow you to jump to a file or other location
;;; - quickly. Use C-x r j followed by the letter of the register (i for
;;; - init.el, r for this file) to jump to it.
;;; - You should add registers here for the files you edit most often.

(dolist (r `((?i (file . ,(concat dotfiles-dir "init.el")))
             (?p (file . ,(concat jpablobr-dir "/jp-keyboard.el")))
             (?m (file . ,(concat jpablobr-dir "/jp-misc.el")))
             (?r (file . ,(concat dotfiles-dir "/jp-registers.el")))))
  (set-register (car r) (cadr r)))

(provide 'jp-registers)