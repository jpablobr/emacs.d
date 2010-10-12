;;; ----------------------------------------------------------------------------
;;; - Clojure
;;; - 
;;;
(require 'clojure-mode)

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)

(provide 'jp-clojure)
