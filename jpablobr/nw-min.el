(load-file "~/.emacs.d/jpablobr/jp-meta.el")
(require 'jp-meta)

;; http://www.nongnu.org/emacs-tiny-tools/keybindings/
(lookup-key global-map "\C-x"); --> Control-X-prefi
(define-key global-map "\C-[" 'Control-X-prefix)
(define-key global-map "\M-x" 'execute-extended-command)

;; Keyboard
;;; - Use regex searches by default.
(global-set-key "\C-x \C-s" 'save-buffer)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
;;; - File finding
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;; - mark-whole-buffer
(global-set-key (kbd "C-x h") 'mark-whole-buffer)
(global-set-key [(meta D)] 'backward-kill-word) ;; (meta d) is opposite
;; Texmate mode
(global-set-key [(meta \])] 'textmate-shift-right)
(global-set-key [(meta \[)] 'textmate-shift-left)
(global-set-key [(meta /)] 'comment-or-uncomment-region-or-line)
(global-set-key [(meta L)] 'textmate-select-line)
;;; Jump to matching parent
(global-unset-key "\C-l")
(global-set-key (kbd "C-l cs") 'cheat-fu-sheets)
(global-set-key (kbd "C-l cc") 'cheat-fu-convert)
(global-set-key (kbd "C-l cg") 'cheat-fu-commit)
(global-set-key (kbd "C-l cr") 'cua-set-rectangle-mark)
(global-set-key (kbd "C-l df") 'delete-current-file)
(global-set-key (kbd "C-l dm") 'ido-imenu); (This is awesome.)
(global-set-key (kbd "C-l ee") 'eval-buffer)
(global-set-key (kbd "C-l fl") 'beginning-of-buffer)
(global-set-key (kbd "C-l fg") 'find-grep)
(global-set-key (kbd "C-l gt") 'register-to-point)
(global-set-key (kbd "C-l gp") 'gist-buffer-private)
(global-set-key (kbd "C-l gr") 'gist-buffer)
(global-set-key (kbd "C-l ie") 'insert-email)
(global-set-key (kbd "C-l in") 'insert-name)
(global-set-key (kbd "C-l id") 'insert-date)
(global-set-key (kbd "C-l is") 'ispell-region)
(global-set-key (kbd "C-l hl") 'hs-toggle-hiding)
(global-set-key (kbd "C-l ll") 'end-of-buffer)
(global-set-key (kbd "C-l rr") 'replace-regexp)
(global-set-key (kbd "C-l rf") 'rename-file)
(global-set-key (kbd "C-l sb") 'sr-speedbar-toggle)
(global-set-key (kbd "M-q") 'org-cycle)
(global-set-key (kbd "M-w") 'copy-region-as-kill)
(global-set-key [(meta F)] 'fill-region)
(global-set-key [(meta up)] 'beginning-of-buffer)
(global-set-key [(meta down)] 'end-of-buffer)
(global-set-key [(meta p)] 'beginning-of-buffer)
(global-set-key [(meta n)] 'end-of-buffer)

(menu-bar-mode 0)
(setq initial-scratch-message "")