(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))


(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

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
;; (setq anything-ruby-mthds-object-cmd
;;       "~/Dropbox/code/ruby/gems/mthdspool/bin/mthdspool -r %s -l %s -o %s -f %s ")
;; (setq anything-ruby-inspect-cmd
;;       "~/Dropbox/code/ruby/gems/mthdspool/bin/mthdspool -i %s -r %s -l %s -g %s ")
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq require-final-newline t)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(set-default 'truncate-lines t)
(setq truncate-partial-width-windows t)
(setq uniquify-buffer-name-style 'forward)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq save-place-file (concat dotfiles-dir "places"))
(setq visible-bell t)
(setq inhibit-startup-message t)
(customize-variable (quote tab-stop-list))
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

(when window-system
  (mouse-wheel-mode t)
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1))

(defface extra-whitespace-face
  '((t (:background "red")))
  "Used for tabs and such.")
(defvar jp-show-tabs
  '(("\t" . 'extra-whitespace-face)))
(font-lock-add-keywords nil jp-show-tabs)
(standard-display-ascii ?\t "⌥")

;; (setq debug-on-error t)

(provide 'jp-misc)
