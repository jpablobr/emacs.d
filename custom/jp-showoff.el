;;jp-showoff.el ----------------------------------------------------------------------------
;;; - Showoff Pesentations
;;;
(add-to-list 'load-path (concat misc-dir "/showoff-mode"))
(require 'showoff-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . showoff-mode))

(provide 'jp-showoff)