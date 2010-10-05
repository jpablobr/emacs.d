;;; ----------------------------------------------------------------------------
;;; - Erlang
;;;
(add-to-list 'load-path (concat dotfiles-dir "/vendor/erlware-mode"))
(require 'erlang-start)

(eval-after-load 'erlang-mode
  '(progn
     (flymake-mode)))

(add-hook 'erlang-mode-hook 'run-coding-hook)

(provide 'jp-erlang)