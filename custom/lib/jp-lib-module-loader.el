(defun jp-main-module-loader ()
  (interactive)
  (add-to-list 'load-path (concat misc-dir "/cheat-fu-mode"))
  (load-file (concat jpablobr-dir "/jp-misc.el"))
  (require 'jp-misc)
  (jp-load-misc)
  (jp-load-markdown-mode)
  ;; (load-file (concat jpablobr-dir "/jp-yasnippet.el"))
  ;; (require 'jp-yasnippet)
  ;; (jp-load-yasnippets-hooks)
  (require 'jp-lib-anything)
  (load-file (concat jpablobr-dir "/jp-autocomplete.el"))
  (require 'jp-autocomplete)
  (load-file (concat jpablobr-dir "/jp-ruby.el"))
  (require 'jp-ruby)
  (load-file (concat jpablobr-dir "/jp-eshell.el"))
  (require 'jp-eshell)
  (load-file (concat jpablobr-dir "/jp-compile.el"))
  (require 'jp-compile)
  (load-file "~/.private/.jp-private.el")
  (require 'jp-private)
  (require 'jp-lib-misc)
  (require 'jp-lib-templates)
  (require 'jp-lib-programming)
  (require 'jp-lib-anything)
  (require 'jp-lib-grep)
  (require 'jp-lib-hooks)
  (load-file (concat jpablobr-dir "/jp-keyboard.el"))
  (require 'jp-keyboard)
  (jp-load-js)
  (jp-load-ruby-frontend)
  (jp-shell)
  (ibuffer)
  (turn-on-xclip)
  (cheat-fu-deft)
  (jp-load-git)
  (deft)
  (cd "~/"))

(defun ecb-init-stuff ()
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

(defun jp-load-misc ()
  (require 'highlight-parentheses)
  (require 'highlight-symbol)
  (require 'cheat-fu)
  (require 'xclip)
  (require 're-builder)
  (require 'autopair)
  (require 'deft)
  (require 'cheat-fu-deft)
  (require 'uniquify)
  (require 'face-list)
  (require 'epa-file)
  (require 'insert-time)
  ;; (add-to-list 'load-path (concat misc-dir "/enotify"))
  ;; (require 'enotify)
  ;; (enotify-minor-mode t)
  (require 'edit-server)
  (edit-server-start)
  (autoload 'asciidoc-mode "asciidoc-mode" nil t)
  (autoload 'xub-mode "xub-mode" "Load xub-mode for browsing Unicode." t)
  (autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
  (autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
  (autoload 'reftex-citation "reftex-cite" "Make citation" nil)
  (autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
  (add-to-list 'auto-mode-alist '("\\.asciidoc$" . asciidoc-mode))
  (autoload 'change-case "change-case" t)
  (autoload 'xrdb-mode "xrdb-mode" "Mode for editing X resource files" t))

(defun jp-load-markdown-mode ()
  (autoload 'markdown-mode "markdown-mode.el"
    "Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.ronn\\'" . markdown-mode)))

(defun load-yasnippets ()
  (interactive)
  (load-file (concat jpablobr-dir "/jp-yasnippet.el"))
  (require 'jp-yasnippet)
  (jp-load-yasnippets-hooks)
  (load-file (concat
              anything-dir
              "/anything-yasnippet-2/anything-yasnippet-2.el"))
  (require 'anything-yasnippet-2)
  (yas/minor-mode))

(defun load-skype-mode ()
  (interactive)
  (setq skype-dir (concat misc-dir "/emacs-skype"))
  (add-to-list 'load-path skype-dir)
  (load-file (concat skype-dir "/skype.el"))
  (require 'skype)
  (setq skype--my-user-handle "jose_pablo_barrantes")
  (skype--init))

(defun load-clojure-mode ()
  (interactive)
  (require 'clojure-mode))

(defun load-rainbow-mode  ()
  (interactive)
  (load-file (concat misc-dir "/rainbow-mode.el"))
  (require'rainbow-mode "rainbow-mode" t)
  (rainbow-mode))

(defun jp-load-php ()
  (interactive)
  (load-file (concat jpablobr-dir "/jp-php.el"))
  (require 'jp-php))

(defun jp-load-ruby-frontend ()
  (interactive)
  (require 'scss-mode)
  (require 'sass-mode)
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
  (add-to-list 'load-path (concat ruby-dir "/ruby-complexity"))
  (require 'ruby-complexity)
  (interactive)
  (linum-mode)
  (ruby-complexity-mode))

(defun jp-load-rhtml ()
  (interactive)
  (add-to-list 'load-path (concat ruby-dir "/rhtml"))
  (require 'rhtml-mode)
  (setq
   nxhtml-global-minor-mode t
   nxhtml-skip-welcome t
   indent-region-mode t
   rng-nxml-auto-validate-flag nil
   nxml-degraded t))

(defun jp-load-js ()
  (interactive)
  (load-file (concat jpablobr-dir "/jp-js.el")))

(defun jp-load-git ()
  (interactive)
  (load-file (concat misc-dir "/git-show/git-show.el"))
  (add-to-list 'load-path  (concat misc-dir "/git-emacs"))
  (require 'git-show)
  (require 'gist)
  (require 'git-emacs))

(defun jp-load-lua ()
  (interactive)
  (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
  (require 'flymake-lua))

(defun jp-load-ascii-doc ()
  (interactive)
  (autoload 'doc-mode "doc-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
  (add-to-list 'auto-mode-alist '("\\.asc$" . doc-mode))
  (autoload 'asciidoc-mode "asciidoc-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.asciidoc$" . asciidoc-mode)))

(provide 'jp-lib-module-loader)
