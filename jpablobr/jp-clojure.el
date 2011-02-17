;;jp-clojure.el ----------------------------------------------------------------------------
;;
(setq clojure-dir (concat vendor-dir "/clojure"))
(add-to-list 'load-path clojure-dir)

(require 'clojure-mode)

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)

(provide 'jp-clojure)
