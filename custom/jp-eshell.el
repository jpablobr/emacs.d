(require 'rvm)
(require 'ansi-color)
(require 'flymake-shell)

(setq shell-cmpl-cycle-completions nil
      shell-save-history-on-exit t
      shell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

(provide 'jp-eshell)
