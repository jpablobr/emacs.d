;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - ORG mode
;;;
;(custom-set-faces '(default ((t (:height 100 )))))

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org-mode")

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org-mode/inbox.org")

;; Set the agenda files
(setq org-agenda-files (list "~/Dropbox/org-mode/work.org"
                             "~/Dropbox/org-mode/school.org" 
                             "~/Dropbox/org-mode/jpablobr.org"))

;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")

(provide 'jp-org-config)
