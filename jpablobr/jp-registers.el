;;; -*- coding: utf-8-unix; -*-
;;jp-registers.el ---------------------------------------------------------
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
             (?j (file . ,"~/org/jpablobr.org"))
             (?a (file . ,"~/.my-precious/bash/aliases"))
             (?c (file . ,"~/.my-precious/bash/config"))
             (?l (file . ,"~/org/yacs/linux.org"))
             (?1 (file . ,"~/code/ruby/rails/rails3-base/Gemfile"))
             (?2 (file . ,"~/code/ruby/rails/mp3box/Gemfile"))
             (?3 (file . ,"~/code/ruby/rails/aquadayspa/Gemfile"))
             (?4 (file . ,"~/code/ruby/rails/birbecks/Gemfile"))
             (?z (file . ,"~/.emacs.d/vendor/misc/cheat_fu-mode/cheat_fu.el"))
             (?r (file . ,(concat jpablobr-dir "/jp-registers.el")))))
  (set-register (car r) (cadr r)))

(provide 'jp-registers)