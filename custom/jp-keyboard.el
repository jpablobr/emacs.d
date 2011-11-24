;; http://www.nongnu.org/emacs-tiny-tools/keybindings/
(lookup-key global-map "\C-x"); --> Control-X-prefix
(define-key global-map "\C-[" 'Control-X-prefix)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(define-key global-map (kbd "C-;") 'isearch-forward-at-point)
(define-key global-map "\M-x" 'execute-extended-command)
(define-key global-map "\M-x" 'anything-M-x)
(define-key global-map (kbd "M-;") 'anything-for-files)
(global-set-key (kbd "M-=") 'dabbrev-expand)
(global-set-key (kbd "M-w") 'copy-region-as-kill)
(global-set-key (kbd "M-\d") 'backward-kill-word)
(global-set-key (kbd "M-d") 'kill-word)
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "M-a") 'beginning-of-line)
(global-set-key (kbd "M-e") 'end-of-line)
(global-set-key (kbd "M-z") 'cua-set-rectangle-mark)
(global-set-key (kbd "M-,") 'textmate-goto-symbol)
(global-set-key (kbd "M-l") 'textmate-goto-file)
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "M-b") 'backward-word)
(global-set-key (kbd "M-a") 'save-buffer)
(global-set-key (kbd "M-g") 'keyboard-quit)
(global-set-key (kbd "M-q") 'find-file)
(global-set-key (kbd "M-.") 'anything-c-etags-select)
(global-set-key [(meta j)] 'fill-region)
(global-set-key [(meta up)] 'beginning-of-buffer)
(global-set-key [(meta down)] 'end-of-buffer)
(global-set-key [(meta p)] 'beginning-of-buffer)
(global-set-key [(meta n)] 'end-of-buffer)
(global-set-key [(meta y)] 'yank-pop)

;; Texmate mode
(global-set-key [(meta \])] 'textmate-shift-right)
(global-set-key [(meta \[)] 'textmate-shift-left)
(global-set-key [(meta /)] 'comment-or-uncomment-region-or-line)
(global-set-key [(meta L)] 'textmate-select-line)

;;; --------------------------------------------------------------------
;;; \C-l redefined -----------------------------------------------------
(global-unset-key "\C-l")
(global-set-key (kbd "C-l bu") 'browse-url)
(global-set-key (kbd "C-l cs") 'cheat-fu-sheets)
(global-set-key (kbd "C-l cc") 'cheat-fu-convert)
(global-set-key (kbd "C-l cg") 'cheat-fu-commit)
(global-set-key (kbd "C-l cr") 'ruby-compile-region)
(global-set-key (kbd "C-l cn") 'cheat-fu-new)
(global-set-key (kbd "C-l df") 'delete-current-file)
(global-set-key (kbd "C-l dm") 'ido-imenu); (This is awesome.)
(global-set-key (kbd "C-l ee") 'eval-buffer)
(global-set-key (kbd "C-l ei") 'ecb-init-stuff)
(global-set-key (kbd "C-l fl") 'beginning-of-buffer)
(global-set-key (kbd "C-l fg") 'find-grep)
(global-set-key (kbd "C-l gt") 'register-to-point)
(global-set-key (kbd "C-l gs") 'google-s)
(global-set-key (kbd "C-l gp") 'gist-buffer-private)
(global-set-key (kbd "C-l gr") 'gist-buffer)
(global-set-key (kbd "C-l gl") 'goto-line)
(global-set-key (kbd "C-l ie") 'insert-email)
(global-set-key (kbd "C-l in") 'insert-name)
(global-set-key (kbd "C-l id") 'insert-date)
(global-set-key (kbd "C-l is") 'ispell-region)
(global-set-key (kbd "C-l jp") 'jp-init-stuff)
(global-set-key (kbd "C-l jt") 'jp-theme)
(global-set-key (kbd "C-l ha") 'hs-hide-all)
(global-set-key (kbd "C-l hs") 'hs-show-all)
(global-set-key (kbd "C-l hl") 'hs-toggle-hiding)
(global-set-key (kbd "C-l ll") 'end-of-buffer)
(global-set-key (kbd "C-l lk") 'tex-compile)
(global-set-key (kbd "C-l mb") 'menu-bar-mode)
(global-set-key (kbd "C-l mp") 'match-paren)
(global-set-key (kbd "C-l rr") 'replace-regexp)
(global-set-key (kbd "C-l rf") 'rename-file)
(global-set-key (kbd "C-l rh") 'byte-recompile-home)
(global-set-key (kbd "C-l rc") 'r-ruby-complexity)
(global-set-key (kbd "C-l rk") 'r-koans)
(global-set-key (kbd "C-l tl") 't-linum)
(global-set-key (kbd "C-l ta") 't-anything)
(global-set-key (kbd "C-l tm") 't-anything-min)
(global-set-key (kbd "C-l ss") 'synonym-s)
(global-set-key (kbd "C-l st") 'test-sh-script)

(provide 'jp-keyboard)