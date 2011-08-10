;;; -*- coding: utf-8-unix; -*-
;;jp-keyboard.el ---------------------------------------------------------

;; http://www.nongnu.org/emacs-tiny-tools/keybindings/
(lookup-key global-map "\C-x"); --> Control-X-prefix
(define-key global-map "\C-[" 'Control-X-prefix)
(define-key global-map "\M-x" 'execute-extended-command)

;;; - Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)
;;; - Completion that uses many different methods to find options.
(global-set-key (kbd "M-=") 'dabbrev-expand)
;;; - Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)
;;; - Use regex searches by default.
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)
;;; - File finding
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p") 'find-file-at-point)
(global-set-key (kbd "C-x b") 'ibuffer)
;;; - Fetch the contents at a URL, display it raw.
(global-set-key (kbd "C-x u") 'view-url)
;;; - mark-whole-buffer
(global-set-key (kbd "C-x h") 'mark-whole-buffer)
;;; - Help should search more than just commands
(global-set-key (kbd "C-h a") 'apropos)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key [(meta D)] 'backward-kill-word) ;; (meta d) is opposite
;; Texmate mode
(global-set-key [(meta \])] 'textmate-shift-right)
(global-set-key [(meta \[)] 'textmate-shift-left)
(global-set-key [(meta /)] 'comment-or-uncomment-region-or-line)
(global-set-key [(meta L)] 'textmate-select-line)
;;; Jump to matching parent
(global-unset-key "\C-l")
(global-set-key (kbd "C-l bu") 'browse-url)
(global-set-key (kbd "C-l cs") 'cheat-fu-sheets)
(global-set-key (kbd "C-l cc") 'cheat-fu-convert)
(global-set-key (kbd "C-l cg") 'cheat-fu-commit)
(global-set-key (kbd "C-l cr") 'cua-set-rectangle-mark)
(global-set-key (kbd "C-l cn") 'cheat-fu-new)
(global-set-key (kbd "C-l df") 'delete-current-file)
(global-set-key (kbd "C-l dm") 'ido-imenu); (This is awesome.)
(global-set-key (kbd "C-l ee") 'eval-buffer)
(global-set-key (kbd "C-l fl") 'beginning-of-buffer)
(global-set-key (kbd "C-l fg") 'find-grep)
(global-set-key (kbd "C-l gt") 'register-to-point)
(global-set-key (kbd "C-l gs") 'google-s)
(global-set-key (kbd "C-l gp") 'gist-buffer-private)
(global-set-key (kbd "C-l gr") 'gist-buffer)
(global-set-key (kbd "C-l ie") 'insert-email)
(global-set-key (kbd "C-l in") 'insert-name)
(global-set-key (kbd "C-l id") 'insert-date)
(global-set-key (kbd "C-l is") 'ispell-region)
(global-set-key (kbd "C-l jp") 'jp-init-stuff)
(global-set-key (kbd "C-l ha") 'hs-hide-all)
(global-set-key (kbd "C-l hs") 'hs-show-all)
(global-set-key (kbd "C-l hl") 'hs-toggle-hiding)
(global-set-key (kbd "C-l ll") 'end-of-buffer)
(global-set-key (kbd "C-l mb") 'menu-bar-mode)
(global-set-key (kbd "C-l mp") 'match-paren)
(global-set-key (kbd "C-l rr") 'replace-regexp)
(global-set-key (kbd "C-l rf") 'rename-file)
(global-set-key (kbd "C-l sd") 'definition-s)
(global-set-key (kbd "C-l ss") 'synonym-s)
(global-set-key (kbd "C-l sg") 'github-s)
(global-set-key (kbd "C-l sb") 'sr-speedbar-toggle)
(global-set-key (kbd "C-x s") 'save-buffer)
(global-set-key (kbd "M-q") 'org-cycle)
(global-set-key (kbd "M-w") 'copy-region-as-kill)
(global-set-key [(meta F)] 'fill-region)
(global-set-key [(meta up)] 'beginning-of-buffer)
(global-set-key [(meta down)] 'end-of-buffer)
(global-set-key [(meta p)] 'beginning-of-buffer)
(global-set-key [(meta n)] 'end-of-buffer)

(provide 'jp-keyboard)