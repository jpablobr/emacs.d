;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - ORG mode
;;;
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; Override
(add-hook 'org-mode-hook
          (lambda()
            (local-set-key [(control meta return)] 'org-insert-heading)
            (local-set-key [(control shift left)] 'previous-buffer)
            (local-set-key [(control shift right)] 'next-buffer)
            (local-set-key [(meta shift right)] 'ido-switch-buffer)
            (local-set-key [(meta shift left)] 'magit-status)
            ))

(provide 'org)
