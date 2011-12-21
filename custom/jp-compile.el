(load-library "compile")

(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)

(global-set-key "\C-cc" 'mode-compile)

(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)

(global-set-key "\C-ck" 'mode-compile-kill)

;;; For some reason, the gnu regex is capturing leading white space.
(setq compilation-error-regexp-alist
      (remq 'gnu compilation-error-regexp-alist))

;; Ruby test unit patterns.
(add-to-list 'compilation-error-regexp-alist
             '("\\([^ \t:\\[]+\\):\\([0-9]+\\):in" 1 2))
(add-to-list 'compilation-error-regexp-alist
             '("test[a-zA-Z0-9_]*([A-Z][a-zA-Z0-9_]*) \\[\\(.*\\):\\([0-9]+\\)\\]:" 1 2))

;; FIC pattern
(add-to-list 'compilation-error-regexp-alist
             '("^\\([^ \t:\\[]+\\):\\([0-9]+\\):" 1 2))

;; SmallEiffel:
;; Line 81 column 13 in GREED_GAME (./greed_game.e) :
(add-to-list 'compilation-error-regexp-alist
             '("Line \\([0-9]+\\) column [0-9]+ in [A-Za-z0-9_]+ (\\(.*\\)) +:" 2 1) )

(provide 'jp-compile)
