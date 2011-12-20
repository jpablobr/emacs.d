(require 'thingatpt)
(require 'imenu)

(add-to-list 'load-path (concat misc-dir "/cheat-fu-mode"))
(add-to-list 'load-path (concat misc-dir "/emacs-w3m"))

;;; Stuff to run only on window systems.
(when window-system
  (add-to-list 'load-path (concat misc-dir "/mmm-mode"))
  (load-file (concat misc-dir "/mmm-mode/mmm-mode.el"))
  ;;----------------------------------------------------------------------
  ;; - Multiple major modes
  (require 'mmm-auto)
  (setq mmm-global-mode 'buffers-with-submode-classes)
  (setq mmm-submode-decoration-level 2)

  (mouse-wheel-mode t)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1));;; - when window-system

;; ---------------------------------------------------------------------
;; - Git
(setq git-dir (concat vendor-dir "/git"))
(add-to-list 'load-path git-dir)
(add-to-list 'load-path (concat git-dir "/magit"))
(load-file (concat git-dir "/magit/magit.el"))

(require 'magit)
(require 'gist)

;; ---------------------------------------------------------------------
;; - Highlighting
(require 'highlight-parentheses)
(require 'highlight-symbol)

(setq visible-bell t
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      delete-by-moving-to-trash t
      shift-select-mode nil
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat dotfiles-dir "places"))

;; - Transparently open compressed files
(auto-compression-mode t)

;; - Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; - X11 Copy & Paste to/from Emacs
(setq x-select-enable-clipboard t) ; as above
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; - Save a list of recent files visited.
(recentf-mode 1)

;; - Hippie expand: at times perhaps too hip
(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)

;; --------------------------------------------------------------------
;; - Cosmetics
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

(eval-after-load 'shell-mode
  '(progn
     (set-background-color "black")))

;; ---------------------------------------------------------------------
;; - Cheat-fu
(require 'cheat-fu)
(setq cheat-fu-root "/home/jpablobr/.cheat_fu_sheets/")

;; --------------------------------------------------------------------
;; - Textmate
(require 'textmate)
(textmate-mode)

;; --------------------------------------------------------------------
;; - Find-recursive
;; (require 'find-recursive)

;; - mode-compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

;; ---------------------------------------------------------------------
;; - CUA enhanced functionality for the standard emacs bindings
(cua-mode 'emacs)
(setq CUA-mode-normal-cursor-color "red")
(setq CUA-mode-overwrite-cursor-color "yellow")
(setq CUA-mode-read-only-cursor-color "green")

;; ---------------------------------------------------------------------
;; - xclip - for kill/yank from terminal, awesomeness! ;)
(require 'xclip)
(turn-on-xclip)

;; ---------------------------------------------------------------------
;; - White-space builder
;; (global-whitespace-mode 1)
;; (setq whitespace-style '(trailing))
;; (set-default 'indent-tabs-mode nil)
;; (set-default 'indicate-empty-lines t)

;; ---------------------------------------------------------------------
;; - Regex builder
(require 're-builder)
(setq reb-re-syntax 'string)

;; ---------------------------------------------------------------------
;; - ERC
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#beginrescueend" "#emacs" "#bash")))

;; ---------------------------------------------------------------------
;; Lua
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(require 'flymake-lua)
(add-hook 'lua-mode-hook 'flymake-lua-load)
(require 'lua-block)
(lua-block-mode t)

;; ---------------------------------------------------------------------
;; emacs hacks/workarounds
(setq warning-suppress-types nil)
(setq org-directory nil)

;; ---------------------------------------------------------------------
;; General
(require 'color-theme-reg)
(require 'isearch+)
(add-hook 'isearch-mode-hook
          '(lambda ()
             (define-key isearch-mode-map "\M-i" 'isearch-repeat-forward)))

(require 'deft)
(require 'cheat-fu-deft)
(autoload 'change-case "change-case" t)

(autoload 'doc-mode "doc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
(add-to-list 'auto-mode-alist '("\\.asc$" . doc-mode))
(add-hook 'doc-mode-hook
'(lambda ()
    (require 'asciidoc)))
(autoload 'asciidoc-mode "asciidoc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.asciidoc$" . asciidoc-mode))

(setq uniquify-buffer-name-style 'forward)
(require 'uniquify)

(setq recentf-auto-cleanup 'never)

(autoload 'xrdb-mode "xrdb-mode" "Mode for editing X resource files" t)

(setq auto-mode-alist
      (append '(("\\.Xdefaults$"    . xrdb-mode)
                ("\\.Xenvironment$" . xrdb-mode)
                ("\\.xrdb$"         . xrdb-mode)
                ("\\.Xresources$"   . xrdb-mode)
                ("*.\\.ad$"         . xrdb-mode)
                )
              auto-mode-alist))

(custom-set-faces
 '(hl-line ((t (:background "#4f4f4f"))))
 '(isearch ((((class color) (min-colors 8)) (:background "green" :foreground "black"))))
 '(erb-delim-face ((t (:background "black" :foreground "blue" :weigth thin))))
 '(erb-exec-face ((t (:background "black" :foreground "white" :weight thin))))
 '(erb-exec-delim-face ((t (:background "black" :foreground "red" :weight thin))))
 '(erb-out-face ((t (:background "black" :foreground "white" :weight thin ))))
 '(erb-out-delim-face ((t (:background "black") :foreground "red" :weight thin)))
 '(erb-comment-face ((t (:background "black" :foreground "red" :weight thin))))
 '(erb-comment-delim-face ((t (:background "black" :foreground "red" :weight thin)))))

;; (setq debug-on-error t)

(provide 'jp-misc)