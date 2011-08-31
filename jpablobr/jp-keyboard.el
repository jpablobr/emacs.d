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

;;; - Fetch the contents at a URL, display it raw.
(global-set-key (kbd "C-x u") 'view-url)
;;; - mark-whole-buffer
(global-set-key (kbd "C-x h") 'mark-whole-buffer)
;;; - Help should search more than just commands
(global-set-key (kbd "C-h a") 'apropos)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-n") 'ibuffer)

;; Texmate mode
(global-set-key [(meta \])] 'textmate-shift-right)
(global-set-key [(meta \[)] 'textmate-shift-left)
(global-set-key [(meta /)] 'comment-or-uncomment-region-or-line)
(global-set-key [(meta L)] 'textmate-select-line)

;;; --------------------------------------------------------------------
;;; \C-l redefined -----------------------------------------------------
(global-unset-key "\C-l")
(global-set-key (kbd "C-l aa") 'jp-anything)
(global-set-key (kbd "C-l am") 'jp-anything-min)
(global-set-key (kbd "C-l at") 'anything-c-etags-select)
(global-set-key (kbd "C-l bu") 'browse-url)
(global-set-key (kbd "C-l cs") 'cheat-fu-sheets)
(global-set-key (kbd "C-l cc") 'cheat-fu-convert)
(global-set-key (kbd "C-l cg") 'cheat-fu-commit)
(global-set-key (kbd "C-l cr") 'ruby-compile-region)
(global-set-key (kbd "C-l cf") 'ruby-compile-file)
(global-set-key (kbd "C-l cn") 'cheat-fu-new)
(global-set-key (kbd "C-l df") 'delete-current-file)
(global-set-key (kbd "C-l dm") 'ido-imenu); (This is awesome.)
(global-set-key (kbd "C-l ee") 'eval-buffer)
(global-set-key (kbd "C-l ei") 'ecb-init-stuff)
;;; ecb
(global-set-key (kbd "C-l em") 'ecb-goto-window-methods)
(global-set-key (kbd "C-l eb") 'ecb-goto-window-edit-by-smart-selection)
(global-set-key (kbd "C-l ed") 'ecb-goto-window-directories)
(global-set-key (kbd "C-l es") 'ecb-goto-window-symboldef)
(global-set-key (kbd "C-l eh") 'ecb-goto-window-history)
(global-set-key (kbd "C-l el") 'ecb-goto-window-edit-last)
(global-set-key (kbd "C-l ea") 'ecb-goto-window-analyse)
;;; ecb
(global-set-key (kbd "C-l ff") 'find-file)
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
(global-set-key (kbd "C-l mb") 'menu-bar-mode)
(global-set-key (kbd "C-l mp") 'match-paren)
(global-set-key (kbd "C-l rr") 'replace-regexp)
(global-set-key (kbd "C-l rf") 'rename-file)
(global-set-key (kbd "C-l ri") 'rails-init-stuff)
(global-set-key (kbd "C-l rh") 'byte-recompile-home)
(global-set-key (kbd "C-l sd") 'definition-s)
(global-set-key (kbd "C-l ss") 'synonym-s)
(global-set-key (kbd "C-l sg") 'github-s)
(global-set-key (kbd "C-l sb") 'sr-speedbar-toggle)
(global-set-key (kbd "C-l st") 'jp-test-sh-script)
(global-set-key (kbd "M-q") 'org-cycle)
(global-set-key (kbd "M-w") 'copy-region-as-kill)
(global-set-key (kbd "M-\d") 'backward-kill-word)
(global-set-key (kbd "M-d") 'kill-word)
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "C-x C-s") 'save-buffer)
(global-set-key [(meta j)] 'fill-region)
(global-set-key [(meta up)] 'beginning-of-buffer)
(global-set-key [(meta down)] 'end-of-buffer)
(global-set-key [(meta p)] 'beginning-of-buffer)
(global-set-key [(meta n)] 'end-of-buffer)
(global-set-key [(meta y)] 'yank-pop)
(global-set-key (kbd "M-e") 'cua-set-rectangle-mark)
(global-set-key (kbd "M-,") 'textmate-goto-symbol)
(global-set-key (kbd "M-l") 'textmate-goto-file)
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "M-b") 'backward-word)

;; C-C p -- Perforce bindings
(global-set-key (kbd "C-C p e") 'p4-edit) ; pkg:perforce
(global-set-key (kbd "C-C p r") 'p4-revert) ; pkg:perforce
(global-set-key (kbd "C-C p s") 'p4-sync-code-buffers) ; pkg:perforce
(global-set-key (kbd "C-C p v") 'p4-env) ; pkg:perforce

;;; C-C t -- Testing Commands
(global-set-key (kbd "C-C t F")    'jw-run-last-test-or-spec-file) ; pkg:testing
(global-set-key (kbd "C-C t M")    'jw-run-last-test-or-spec-method) ; pkg:testing
(global-set-key (kbd "C-C t c")    'jw-run-test-cruise) ; pkg:testing
(global-set-key (kbd "C-C t f")    'jw-run-test-or-spec-file) ; pkg:testing
(global-set-key (kbd "C-C t i")    'jw-run-test-integration) ; pkg:testing
(global-set-key (kbd "C-C t l")    'jw-run-test-functionals) ; pkg:testing
(global-set-key (kbd "C-C t m")    'jw-run-test-or-spec-method) ; pkg:testing
(global-set-key (kbd "C-C t r")    'jw-run-test-rake) ; pkg:testing
(global-set-key (kbd "C-C t s")    'toggle-style) ; pkg:testing
(global-set-key (kbd "C-C t t")    'jw-mark-for-testing) ; pkg:testing
(global-set-key (kbd "C-C t u")    'jw-run-test-units) ; pkg:testing
(global-set-key (kbd "C-C t w")    'jw-test-toggle-warnings) ; pkg:testing

(global-set-key (kbd "C-C t C-f")  'jw-run-last-test-or-spec-file) ; pkg:testing
(global-set-key (kbd "C-C t C-m")  'jw-run-last-test-or-spec-method) ; pkg:testing
(global-set-key (kbd "C-C t C-t") 'jw-toggle-clear-buffer-styles) ; pkg:testing
(global-set-key (kbd "C-C t C-s") 'toggle-debug) ; pkg:testing

(global-set-key (kbd "C-C t 1") (lambda () (interactive) (setq jw-test-single-window t))) ; pkg:testing
(global-set-key (kbd "C-C t 2") (lambda () (interactive) (setq jw-test-single-window nil))) ; pkg:testing

;;you can use  C-uM-. input symbol (default thing-at-point 'symbol)
(define-key global-map (kbd "M-;") 'anything-for-files)
(global-set-key "\M-." 'anything-c-etags-select)

(provide 'jp-keyboard)