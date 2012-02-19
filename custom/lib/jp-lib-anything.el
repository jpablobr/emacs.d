(setq anything-dir (concat vendor-dir "/anything"))
(add-to-list 'load-path anything-dir)
(require 'anything)
(require 'anything-config)

(load-file (concat
            anything-dir
            "/anything-shell-commands/anything-shell-commands.el"))
(load-file (concat
            anything-dir
            "/anything-git-grep/anything-git-grep.el"))
(load-file (concat
            anything-dir
            "/anything-yasnippet-2/anything-yasnippet-2.el"))
(load-file (concat
            anything-dir
            "/anything-git-goto/anything-git-goto.el"))

(require 'anything-shell-commands)
(require 'anything-git-grep)
(require 'anything-yasnippet-2)
(require 'anything-git-goto)

(defun jp-anything-regexp ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-regexp)
   " *Anything Regexp*"))

(defun jp-anything-for-files ()
  (interactive)
  (setq buffer-name "*Find files*")
  (anything-other-buffer
   '(anything-c-source-ffap-line
     anything-c-source-ffap-guesser
     anything-c-source-buffers+
     anything-c-source-recentf
     anything-c-source-files-in-current-dir+
     anything-c-source-git-goto
     anything-c-source-bookmarks
     anything-c-source-file-cache
     anything-c-source-locate)
   buffer-name)
  (kill-buffer buffer-name))

(defun jp-anything-code ()
  (interactive)
  (setq buffer-name "*Anything Code*")
  (anything-other-buffer
   '(anything-c-source-imenu
     anything-c-source-browse-code
     anything-c-source-mark-ring
     anything-c-source-global-mark-ring
     anything-c-source-occur
     anything-c-source-etags-select
     anything-c-source-yasnippet-2
     anything-c-source-semantic
     anything-c-source-rd-headline
     anything-c-source-oddmuse-headline
     anything-c-source-fixme
     anything-c-source-kill-ring
     anything-c-source-git-grep)
   buffer-name)
  (kill-buffer buffer-name))

(defun jp-anything-info ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-info-sed
     anything-c-source-info-bash
     anything-c-source-info-wget
     anything-c-source-info-make
     anything-c-source-info-gawk
     anything-c-source-info-grep
     anything-c-source-info-emacs
     anything-c-source-info-find
     anything-c-source-info-autoconf
     anything-c-source-info-automake
     anything-c-source-info-coreutils
     ;; anything-c-source-info-info
     ;; anything-c-source-info-as
     ;; anything-c-source-info-gzip
     ;; anything-c-source-info-libc
     ;; anything-c-source-info-libtool
     ;; anything-c-source-info-binutils
     ;; anything-c-source-info-ld
     ;; anything-c-source-info-m4
     ;; anything-c-source-info-cl
     ;; anything-c-source-info-bfd
     ;; Not working:
     ;; anything-c-source-info-stabs
     ;; anything-c-source-info-gdb
     ;; anything-c-source-info-diff
     ;; anything-c-source-info-global
     ;; anything-c-source-info-sh-utils
     ;; anything-c-source-info-emacs-lisp-intro
     )
   " *Anything info*"))

(provide 'jp-lib-anything)
