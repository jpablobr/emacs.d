;;; ----------------------------------------------------------------------------
;;; - Yaml
;;; - 
;;;
(add-to-list 'load-path (concat vendor-dir "/yaml-mode"))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(provide 'jp-yaml)