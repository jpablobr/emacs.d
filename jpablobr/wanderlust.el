;; wanderlust
(add-to-list 'load-path "~/.emacs.d/vendor/wanderlust")


;;; ----------------------------------------------------------------------------
;;; - Wanderlust configuration
;;; - % sudo apt-get install gnutls-bin
;;; 
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

(setq 
  elmo-maildir-folder-path "~/Maildir"          ;; where i store my mail

  wl-stay-folder-window t                       ;; show the folder pane (left)
  wl-folder-window-width 25                     ;; toggle on/off with 'i'

  ;; IMAP
  elmo-imap4-default-server "imap.gmail.com"
  elmo-imap4-default-user "xjpablobrx@gmail.com"
  elmo-imap4-default-authenticate-type 'clear
  elmo-imap4-default-port '993
  elmo-imap4-default-stream-type 'ssl
  elmo-imap4-use-modified-utf7 t

  ;; SMTP
  wl-smtp-connection-type 'starttls
  wl-smtp-posting-port 587
  wl-smtp-authenticate-type "plain"
  wl-smtp-posting-user "xjpablobrx"
  wl-smtp-posting-server "smtp.gmail.com"
  wl-local-domain "gmail.com"
  wl-message-id-domain "myhost.example.com"
  wl-from "Jose Pablo Barrantes <xjpablobrx@gmail.com>"

  ;; note: all below are dirs (Maildirs) under elmo-maildir-folder-path 
  ;; the '.'-prefix is for marking them as maildirs
  wl-fcc ".sent"                       ;; sent msgs go to the "sent"-folder
  wl-fcc-force-as-read t               ;; mark sent messages as read 
  wl-default-folder ".inbox"           ;; my main inbox 
  wl-draft-folder ".drafts"            ;; store drafts in 'postponed'
  wl-trash-folder ".trash"             ;; put trash in 'trash'
  wl-spam-folder ".trash"              ;; ...spam as well
  wl-queue-folder ".queue"             ;; we don't use this
  wl-folder-check-async t
  
  ;; check this folder periodically, and update modeline
  wl-biff-check-folder-list '(".todo") ;; check every 180 seconds
                                       ;; (default: wl-biff-check-interval)

  ;; hide many fields from message buffers
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

(provide 'wanderlust)