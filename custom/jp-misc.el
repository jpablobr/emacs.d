(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

(prefer-coding-system 'utf-8)
(if (not (assoc "UTF-8" language-info-alist))
    (set-language-environment "utf-8")
  (set-language-environment "utf-8")
  (set-keyboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (prefer-coding-system 'utf-8))

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
(require 'anything)
(require 'anything-config)
(require 'pandoc-mode)
(require 'epa-file)
(require 'insert-time)
(autoload 'xub-mode "xub-mode" "Load xub-mode for browsing Unicode." t)
(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

(setq scroll-step           1
      scroll-conservatively 10000)

(defalias 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)
(column-number-mode t)
(set-scroll-bar-mode -1)
(global-hl-line-mode t)
(transient-mark-mode t)
(recentf-mode t)
(auto-compression-mode t)
(setq require-final-newline t)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq truncate-partial-width-windows 0)
(setq uniquify-buffer-name-style 'forward)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq save-place-file (concat dotfiles-dir "places"))
(setq visible-bell t)
(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq blink-cursor t)
(setq c-basic-indent 2)
(setq delete-selection-mode t)
(setq delete-by-moving-to-trash t)
(setq shift-select-mode nil)
(setq recentf-auto-cleanup 'never)
(setq reb-re-syntax 'string)
(setq warning-suppress-types nil)
(setq deft-extension "md")
(setq deft-directory "~/.private/notes")
(setq deft-text-mode 'markdown-mode)
(setq cheat-fu-root "/home/jpablobr/.cheat_fu_sheets/")
(setq time-stamp-active t
      time-stamp-line-limit 10
      time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)")
(setq auto-mode-alist
      (append '(("\\.Xdefaults$"    . xrdb-mode)
                ("\\.Xenvironment$" . xrdb-mode)
                ("\\.xrdb$"         . xrdb-mode)
                ("\\.Xresources$"   . xrdb-mode)
                ("*.\\.ad$"         . xrdb-mode)
                )
              auto-mode-alist))

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.ronn\\'" . markdown-mode))

(when window-system
  (mouse-wheel-mode t)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1))

(autoload 'change-case "change-case" t)
(autoload 'xrdb-mode "xrdb-mode" "Mode for editing X resource files" t)

(defface extra-whitespace-face
  '((t (:background "red")))
  "Used for tabs and such.")
(defvar jp-show-tabs
  '(("\t" . 'extra-whitespace-face)))
(font-lock-add-keywords nil jp-show-tabs)
(standard-display-ascii ?\t "⌥")

(add-hook 'emacs-lisp-mode-hook
          (lambda () (font-lock-add-keywords nil jp-show-tabs)))
(add-hook 'ruby-mode-hook
          (lambda () (font-lock-add-keywords nil jp-show-tabs)))
(add-hook 'markdown-mode-hook
          (lambda () (font-lock-add-keywords nil jp-show-tabs)))
(add-hook 'sh-mode-hook
          (lambda () (font-lock-add-keywords nil jp-show-tabs)))

;; (setq debug-on-error t)

(provide 'jp-misc)
