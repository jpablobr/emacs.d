(load-library "compile")

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

;; Turn off trailing space notification

(add-hook 'compilation-mode-hook '(lambda ()
                                    (setq show-trailing-whitespace nil)
                                    (compilation-font-locks)))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(defun compilation-font-locks ()
  "Custom font locks."
  (interactive)
  (custom-set-faces
   '(test-failure ((t (:background "#3f3f3f" :foreground "red" :weight bold :height 140 :family "arial"))) t)
   '(test-heading1 ((t (:background "#3f3f3f" :foreground "#9999ff" :weight bold :height 140 :family "arial"))) t)
   '(test-heading2 ((t (:background "#3f3f3f" :foreground "#9999ff" :weight bold :height 140 :family "arial"))) t)
   '(test-success ((t (:background "#3f3f3f" :foreground "#33ff33" :weight bold :height 140 :family "arial"))) t)))

(provide 'jp-compile)