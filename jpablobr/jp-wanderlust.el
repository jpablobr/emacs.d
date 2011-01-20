;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - Wanderlust
;;;

;;; ----------------------------------------------------------------------------
;;; - Wanderlust configuration
;;; - % sudo aptitude install wl gnutls-bin
;;; - http://www.emacswiki.org/emacs/WanderLust
;;;
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;;; ----------------------------------------------------------------------------
;;; - Emacs w3m
;;;
(require 'mime-w3m)
(defun emacs-w3m-custom ()
  "emacs-w3m-mode-hook"
  (define-key w3m-mode-map [(a)] 'wl-summary-reply)
  (define-key w3m-mode-map [(meta right)] 'w3m-tab-next-buffer))
(add-hook 'w3m-mode-hook '(lambda () (emacs-w3m-custom)))

(setq
  wl-forward-subject-prefix "Fwd: " )

(setq
  elmo-maildir-folder-path "~/Dropbox/Maildir"

  wl-stay-folder-window t                       ;; show the folder pane (left)
  wl-folder-window-width 25                     ;; toggle on/off with 'i'

;;; ----------------------------------------------------------------------------
;;; - IMAP
;;;
  elmo-imap4-default-server "imap.gmail.com"
  elmo-imap4-default-user "xjpablobrx@gmail.com"
  elmo-imap4-default-authenticate-type 'clear
  elmo-imap4-default-port '993
  elmo-imap4-default-stream-type 'ssl
  elmo-imap4-use-modified-utf7 t

;;; ----------------------------------------------------------------------------
;;; - SMTP
;;;
  wl-smtp-connection-type 'starttls
  wl-smtp-posting-port 587
  wl-smtp-authenticate-type "plain"
  wl-smtp-posting-user "xjpablobrx"
  wl-smtp-posting-server "smtp.gmail.com"
  wl-local-domain "gmail.com"
  wl-message-id-domain "jpablobr.com"
  wl-from "Jose Pablo Barrantes <xjpablobrx@gmail.com>"

;;; ----------------------------------------------------------------------------
;;; - Maildirs
;;; - note: all below are dirs (Maildirs) under elmo-maildir-folder-path
;;; - the '.'-prefix is for marking them as maildirs
;;;
  wl-fcc ".sent"                       ;; sent msgs go to the "sent"-folder
  wl-fcc-force-as-read t               ;; mark sent messages as read
  wl-default-folder ".inbox"           ;; my main inbox
  wl-draft-folder ".drafts"            ;; store drafts in 'postponed'
  wl-trash-folder ".trash"             ;; put trash in 'trash'
  wl-spam-folder ".trash"              ;; ...spam as well
  wl-queue-folder ".queue"             ;; we don't use this
  wl-folder-check-async t

;;; ----------------------------------------------------------------------------
;;; - check this folder periodically, and update modeline
;;;
  wl-biff-check-folder-list '(".inbox") ;; check every 180 seconds
  wl-biff-check-folder-list '(".todo") ;; check every 180 seconds
                                       ;; (default: wl-biff-check-interval)

;;; ----------------------------------------------------------------------------
;;; - hide many fields from message buffers
;;;
  wl-message-ignored-field-list '("^.*:")
  wl-message-visible-field-list
  '("^\\(To\\|Cc\\):"
    "^Subject:"
    "^\\(From\\|Reply-To\\):"
    "^Organization:"
    "^Message-Id:"
    "^\\(Posted\\|Date\\):"
    )
  wl-message-sort-field-list
  '("^From"
    "^Organization:"
    "^X-Attribution:"
     "^Subject"
     "^Date"
     "^To"
     "^Cc"))

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

;; from a WL-mailinglist post by David Bremner
;; Invert behaviour of with and without argument replies.
;; just the author
(setq wl-draft-reply-without-argument-list
  '(("Reply-To" ("Reply-To") nil nil)
     ("Mail-Reply-To" ("Mail-Reply-To") nil nil)
     ("From" ("From") nil nil)))

;; bombard the world
(setq wl-draft-reply-with-argument-list
  '(("Followup-To" nil nil ("Followup-To"))
     ("Mail-Followup-To" ("Mail-Followup-To") nil ("Newsgroups"))
     ("Reply-To" ("Reply-To") ("To" "Cc" "From") ("Newsgroups"))
     ("From" ("From") ("To" "Cc") ("Newsgroups"))))

;; Automatically select the correct template based on which folder I'm visiting
(setq wl-draft-config-matchone t)
(setq wl-draft-config-alist
      '(((and
          (string-match ".*work" wl-draft-parent-folder)
          (string-match "laptop" system-name))
         (template . "Work-From-Home"))
        ((and (string-match ".*work" wl-draft-parent-folder)
              (string-match "work-computer" system-name))
         (template . "Work"))
        ((not (string-match ".*work" wl-draft-parent-folder))
         (template . "gmail"))))

;; Apply wl-draft-config-alist as soon as you enter in a draft buffer. Without
;; this wanderlust would apply it only when actually sending the e-mail.
(add-hook 'wl-mail-setup-hook 'wl-draft-config-exec)

;(setq wl-draft-use-frame t)
(add-hook 'wl-mail-setup-hook 'auto-fill-mode)

;; Set the key "f" to browse-url when I'm reading an E-mail. If instead of an url I have an HTML code I can simple select the code and hit "F"
(add-hook 'mime-view-mode-hook
          (lambda ()
            (local-set-key "f" 'browse-url)
            (local-set-key "F" 'browse-url-of-region)))

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

(provide 'jp-wanderlust)
