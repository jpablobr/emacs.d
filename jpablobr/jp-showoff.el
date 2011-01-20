;;; ----------------------------------------------------------------------------
;;; - Showoff Pesentations
;;;

(add-to-list 'load-path "~/.emacs.d/vendor/showoff-mode")
     (require 'showoff-mode)
     (add-to-list 'auto-mode-alist '("\\.md$" . showoff-mode))

(provide 'jp-showoff)