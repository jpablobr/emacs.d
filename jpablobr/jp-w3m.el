(require 'w3m-load)
(require 'mime-w3m)

;; Thanks to marienz (#emacs) on .emacs for the idea
(defun fc-w3m-rename-buffer (url)
  (rename-buffer url t))
(add-hook 'w3m-display-hook 'fc-w3m-rename-buffer)


(defun fc-w3m-setup ()
  "Setup a w3m buffer."
  (set (make-local-variable 'auto-hscroll-mode) nil)
  (mapc
   (lambda (mapping)
     (apply #'define-key w3m-mode-map mapping))
   `((,(kbd "C-c C-@") lui-track-next-buffer)
     (,(kbd "C-c c") fc-copy-url)
     (,(kbd "<down>") next-line)
     (,(kbd "<up>") previous-line)
     (,(kbd "<right>") forward-char)
     (,(kbd "<left>") backward-char)
     (,(kbd "C-x b") ido-switch-buffer))))

(defun fc-remove-cr ()
  "Remove all occurrences of ^M in the current buffer."
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "\r" nil t)
      (replace-match ""))))

(defun fc-copy-url (n)
  "Copy the current URL to the kill ring, or the current anchor URL if
a prefix argument is given."
  (interactive "p")
  (let ((url (if (= n 1)
                 w3m-current-url
               (w3m-anchor))))
    (if url
        (kill-new url)
      (error "No url."))))

(autoload 'w3m-browse-url "w3m" "Ask emacs-w3m to browse URL." t)

(add-hook 'w3m-mode-hook 'fc-w3m-setup)
(add-hook 'w3m-form-input-textarea-mode-hook 'fc-remove-cr)

(setq w3m-use-cookies t
      w3m-cookie-accept-bad-cookies t
      w3m-use-tab nil
      w3m-use-tab-menubar nil
      w3m-auto-show nil)
;; This might help in saving cookies
(eval-after-load "w3m"
  '(progn
     (add-hook 'kill-emacs-hook
               (lambda ()
                 (w3m-quit t)))))

;;; webjump
(setq webjump-sites
      '(("csw" . "http://community.schemewiki.org/")
        ("EmacsWiki" . "http://www.emacswiki.org/cgi-bin/wiki/RecentChanges")
        ("OeWiki" . "http://www.informatik.uni-hamburg.de/cgi-bin/oe/wiki.pl?action=rc;all=1;showedit=1")
        ("FsWiki" . "http://www.informatik.uni-hamburg.de/cgi-bin/fsr-wiki.pl")
        ("fb18" . "http://3773.rapidforum.com/")
        ("DB" . "http://bahn.hafas.de/bin/query.exe/dl")
        ("Haspa" . "https://ssl2.haspa.de/OnlineBanking/login_banking.jsp")
        ("geofox" . "http://www.geofox.de/")
        ("srfi" . "http://srfi.schemers.org/")
        ("google" . "http://www.google.de/")
        ("css" . "http://www.w3.org/TR/CSS21/")
        ("riablog" . "http://www.mumble.net/~campbell/blog.txt")
        ("emacs-devel" . "http://dir.gmane.org/gmane.emacs.devel")
        ))

(provide 'jp-w3m)