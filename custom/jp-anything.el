(require 'anything)
(require 'anything-config)

(defun jp-anything-code ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-imenu
     anything-c-source-etags-select
     anything-c-source-occur
     anything-c-source-semantic
     anything-c-source-browse-code
     anything-c-source-rd-headline
     anything-c-source-oddmuse-headline
     anything-c-source-mark-ring
     anything-c-source-fixme)
   " *Anything Code*"))

(defun jp-anything-kill-ring ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-kill-ring)
   " *Anything Kill Ring*"))

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
     ;; do not work:
     ;; anything-c-source-info-stabs
     ;; anything-c-source-info-gdb
     ;; anything-c-source-info-diff
     ;; anything-c-source-info-global
     ;; anything-c-source-info-sh-utils
     ;; anything-c-source-info-emacs-lisp-intro
     )
   " *Anything Regexp*"))

(defun jp-anything-regexp ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-regexp)
   " *Anything Regexp*"))

(provide 'jp-anything)
