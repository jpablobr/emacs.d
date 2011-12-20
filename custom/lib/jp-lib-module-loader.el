(defun jp-main-module-loader ()
  "Loads all the defaults."
  (interactive)
	(load-file (concat jpablobr-dir "/jp-misc.el"))
	(require 'jp-misc)
	(load-file (concat jpablobr-dir "/jp-yaml.el"))
	(require 'jp-yaml)
	(load-file (concat jpablobr-dir "/jp-markdown.el"))
	(require 'jp-markdown)
	(load-file (concat jpablobr-dir "/jp-flymake.el"))
	(require 'jp-flymake)
	(load-file (concat jpablobr-dir "/jp-ruby.el"))
	(require 'jp-ruby)
	(load-file (concat jpablobr-dir "/jp-autocomplete.el"))
	(require 'jp-autocomplete)
	(load-file (concat jpablobr-dir "/jp-w3m.el"))
	(require 'jp-w3m)
	(load-file (concat jpablobr-dir "/jp-eshell.el"))
	(require 'jp-eshell)
	(load-file (concat jpablobr-dir "/jp-anything.el"))
	(require 'jp-anything)
	(load-file (concat jpablobr-dir "/jp-compile.el"))
	(require 'jp-compile)
	(load-file (concat jpablobr-dir "/jp-keyboard.el"))
	(require 'jp-keyboard)
	(load-file "~/.private/.jp-private.el")
	(require 'jp-private)
	(require 'jp-lib-misc)
	(require 'jp-lib-templates)
	(load-file (concat jpablobr-dir "/jp-yasnippet.el"))
	(require 'jp-yasnippet)
	(load-file (concat jpablobr-dir "/jp-hippie.el"))
	(require 'jp-hippie)
	(shell)
	(jp-load-lua)
	(jp-load-yasnippets)
	(setq deft-extension "md")
	(setq deft-directory "~/.private/notes")
	(setq deft-text-mode 'markdown-mode)
	(cheat-fu-deft)
	(deft)
	;; (jp-load-git)
	(setq initial-scratch-message nil)
	(cd "~/")
	(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function))

(defun ecb-init-stuff ()
  "Load ECB stuff..."
  (interactive)
  (add-to-list 'load-path (concat misc-dir "/cedet-1.0pre7/common/cedet.el"))
  (add-to-list 'load-path (concat misc-dir "/ecb-2.40"))
  (require 'semantic/analyze)
  (provide 'semantic-analyze)
  (provide 'semantic-ctxt)
  (provide 'semanticdb)
  (provide 'semanticdb-find)
  (provide 'semanticdb-mode)
  (provide 'semantic-load)
  (require 'ecb)
  (custom-set-variables
  '(ecb-options-version "2.40")
   '(ecb-layout-window-sizes
     (quote
      (("left8"
        (0.19801980198019803 . 0.29310344827586204)
        (0.19801980198019803 . 0.2413793103448276)
        (0.19801980198019803 . 0.27586206896551724)
        (0.19801980198019803 . 0.1724137931034483))))))
  (global-ede-mode 1)
  (setq ecb-tip-of-the-day nil)
  (setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
  (ecb-activate))

(defun load-rainbow-mode  ()
  "Loads rainsbow-mode"
  (interactive)
  (load-file (concat vendor-dir "/theaming/rainbow-mode.el"))
  (require'rainbow-mode "rainbow-mode" t)
  (rainbow-mode))

(defun jp-load-php ()
  "Loads PHP stuff."
  (interactive)
	(load-file (concat jpablobr-dir "/jp-php.el"))
	(require 'jp-php))

(defun jp-load-haml-scss ()
  "thisandthat."
  (interactive)
	(require 'scss-mode)
	(require 'flymake-haml)
	(require 'haml-mode)
	(setq haml-dir (concat vendor-dir "/haml"))
	(add-to-list 'load-path haml-dir)
	(add-to-list 'auto-mode-alist '("\\.haml?$" . haml-mode))
	(add-to-list 'auto-mode-alist '("\\.html.haml?$" . haml-mode))
	(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
	(setq scss-compile-at-save nil)
	(add-hook 'haml-mode-hook 'flymake-haml-load))

(defun jp-load-ruby-complexity ()
  "Starts ruby complexity"
  (add-to-list 'load-path (concat ruby-dir "/ruby-complexity"))
  (require 'ruby-complexity)
  (interactive)
  (linum-mode)
  (ruby-complexity-mode))

(defun jp-load-rdebug ()
  "Load rdebug."
  (interactive)
	(add-to-list 'load-path (concat ruby-dir "/rdebug"))
	(require 'rdebug))

(defun jp-load-rhtml ()
  "Load rhtml mode"
  (interactive)
  (add-to-list 'load-path (concat ruby-dir "/rhtml"))
  (require 'rhtml-mode)

	(custom-set-faces
	 '(erb-delim-face ((t (:background "black" :foreground "blue" :weigth thin))))
	 '(erb-exec-face ((t (:background "black" :foreground "white" :weight thin))))
	 '(erb-exec-delim-face ((t (:background "black" :foreground "red" :weight thin))))
	 '(erb-out-face ((t (:background "black" :foreground "white" :weight thin ))))
	 '(erb-out-delim-face ((t (:background "black") :foreground "red" :weight thin)))
	 '(erb-comment-face ((t (:background "black" :foreground "red" :weight thin))))
	 '(erb-comment-delim-face ((t (:background "black" :foreground "red" :weight thin)))))

	(setq
	 nxhtml-global-minor-mode t
	 mumamo-chunk-coloring 'submode-colored
	 nxhtml-skip-welcome t
	 indent-region-mode t
	 rng-nxml-auto-validate-flag nil
	 nxml-degraded t)
	(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))

	;(require 'mumamo-fun)
	;(setq mumamo-chunk-coloring 'submode-colored)
  ;(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . eruby-html-mumamo))
	;(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-html-mumamo)))

	(eval-after-load "mmm-vars"
		'(progn
			 (mmm-add-classes
				'((eruby :submode ruby-mode :front "<%[#=]?" :back "-?%>"
								 :match-face (("<%#" . mmm-comment-submode-face)
															("<%=" . mmm-output-submode-face)
															("<%"  . mmm-code-submode-face))
								 :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
													(?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
													(?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @)))))
			 (dolist (mode (list 'html-mode 'nxml-mode))
				 (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?$" 'eruby))
			 (mmm-add-mode-ext-class 'yaml-mode "\\.yaml$" 'eruby)
			 (dolist (mode (list 'js-mode 'js2-mode))
				 (mmm-add-mode-ext-class mode "\\.js\\.erb$" 'eruby)))))

(defun jp-load-js ()
	"Load js mode."
	(interactive)
	(load-file (concat jpablobr-dir "/jp-js.el"))
	(require 'jp-jp))

(defun jp-load-git ()
  "Load Git(1)."
  (interactive)
	(setq git-dir (concat vendor-dir "/git"))
	(add-to-list 'load-path git-dir)
	(add-to-list 'load-path (concat git-dir "/magit"))
	(load-file (concat git-dir "/magit/magit.el"))
	(add-to-list 'load-path (concat git-dir "/git-emacs"))
	(load-file (concat git-dir "/git-emacs/git-emacs.el"))
	(load-file (concat git-dir "/git-show/git-show.el"))
	(require 'magit)
	(require 'gist)
	(require 'git-show)
	(require 'git-emacs))

(defun jp-load-lua ()
  "Load Lua."
  (interactive)
	(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
	(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
	(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
	(require 'flymake-lua)
	(add-hook 'lua-mode-hook 'flymake-lua-load)
	(require 'lua-block)
	(lua-block-mode t))

(defun jp-load-ascii-doc ()
  "Load Ascii-doc."
  (interactive)
	(autoload 'doc-mode "doc-mode" nil t)
	(add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
	(add-to-list 'auto-mode-alist '("\\.asc$" . doc-mode))
	(add-hook 'doc-mode-hook
						'(lambda ()
							 (require 'asciidoc)))
	(autoload 'asciidoc-mode "asciidoc-mode" nil t)
	(add-to-list 'auto-mode-alist '("\\.asciidoc$" . asciidoc-mode)))

(provide 'jp-lib-module-loader)