(load-file "~/.emacs.d/jpablobr/jp-meta.el")
(require 'jp-meta)

(defun delete-current-file ()
  "Delete the file associated with the current buffer.
Delete the current buffer too."
  (interactive)
  (let (currentFile)
    (setq currentFile (buffer-file-name))
    (when (yes-or-no-p (concat "Delete file: " currentFile))
      (kill-buffer (current-buffer))
      (delete-file currentFile)
      (message (concat "Deleted file: " currentFile)) ) ) )

(defun google-s ()
  "Google search on the current region.\n"
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))

    (setq myword (replace-regexp-in-string " " "%20" myword))
    (setq myurl (concat "http://www.google.com/search?q=" myword))
    (browse-url myurl)))

;; Keyboard
(global-set-key [(meta D)] 'backward-kill-word)
;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)
;; Use regex searches by default.
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)
;; Jump to a definition in the current file. (This is awesome.)
;; (global-set-key "\C-x\C-i" 'ido-imenu)
;; Help should search more than just commands
(global-set-key (kbd "C-h a") 'apropos)
;; General
(global-set-key "%" 'match-paren)
(global-set-key (kbd "M-c") 'find-grep)
(global-unset-key "\C-l")
(global-set-key (kbd "C-l bu") 'browse-url)
(global-set-key (kbd "C-l eb") 'eval-buffer)
(global-set-key [(meta I)] 'ispell-region)
(global-set-key [(meta F)] 'fill-region)
(global-set-key [(meta up)] 'beginning-of-buffer)
(global-set-key [(meta down)] 'end-of-buffer)
(global-set-key [(meta p)] 'beginning-of-buffer)
(global-set-key [(meta n)] 'end-of-buffer)
(global-set-key [(meta G)] 'google-s)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "C-x u") 'view-url)
(global-set-key (kbd "C-x h") 'mark-whole-buffer)

(dolist (r `((?i (file . ,"~/.emacs.d/init.el"))
             (?t (file . ,"~/.emacs.d/jpablobr/nw-init.el"))
             (?k (file . ,"~/.emacs.d/jpablobr/jp-keyboard.el"))
             (?m (file . ,"~/.emacs.d/jpablobr/jp-misc.el"))
             (?d (file . ,"~/.emacs.d/jpablobr/jp-defuns.el"))
             (?e (file . ,"~/tmp/email.org"))
             (?j (file . ,"~/org/jpablobr.org"))
             (?a (file . ,"~/.my-precious/bash/aliases"))
             (?c (file . ,"~/.my-precious/bash/config"))
             (?l (file . ,"~/org/yacs/linux.org"))
             (?z (file . ,"current-stuff"))))
  (set-register (car r) (cadr r)))
