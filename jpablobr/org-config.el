;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - ORG mode
;;;

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/work.org"
                             "~/org/school.org" 
                             "~/org/jpablobr.org"))

(provide 'org-config)
