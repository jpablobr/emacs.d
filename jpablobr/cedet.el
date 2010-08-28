;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - CEDET
(load-file "~/.emacs.d/vendor/cedet/common/cedet.el")

;;; ---------------------------------------------------------
;;; - ECB
;;;
(add-to-list 'load-path (concat vendor-dir "/ecb"))
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(ecb-activate)

(provide 'cedet)
