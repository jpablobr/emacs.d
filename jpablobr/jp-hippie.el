;;; -*- coding: utf-8-unix; -*-
;;jp-hippie.el ---------------------------------------------------------
;;; - Hippie
;;; - Remove scrollbars and make hippie expand
;;; - work nicely with yasnippet
;;;
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(require 'hippie-exp)
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
               try-expand-dabbrev-from-kill
                try-complete-file-name
                try-complete-file-name-partially
                try-complete-lisp-symbol
                try-complete-lisp-symbol-partially
                try-expand-line
                try-expand-line-all-buffers
                try-expand-list
                try-expand-list-all-buffers
               try-expand-whole-kill
        ))

(defun indent-or-complete ()
  (interactive)
  (if (and (looking-at "$") (not (looking-back "^\\s-*")))
      (hippie-expand nil)
    (indent-for-tab-command)))
(add-hook 'find-file-hooks (function (lambda ()
                                       (local-set-key (kbd "TAB") 'indent-or-complete))))

(provide 'jp-hippie)