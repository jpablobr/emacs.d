(defvar  jp-grep-cmd
  "find %s -type f \\( ! -regex '.*\\.git.*' \\) -a \\( ! -regex '.*\\.elc$' \\) -exec egrep -nH -e %s {} +")

(defvar anything-grep-alist
  '(("buffers" ("egrep -Hn %s $buffers" "/"))
    ("memo" ("egrep -nH -e %s" "~/memo"))
    ("kanbeki" ("egrep -nH -e %s" "~/code/ruby/rails/kanbeki-apps/kanbeki"))
    ("bin" ("egrep -nH -e %s" "~/bin"))
    ("ruby" ("ack -afG 'rb$' | xargs egrep -Hn %s" "~/code/ruby"))
    ("~/bin and ~/code/ruby"
     ("ack -afG 'rb$' | xargs egrep -Hn %s" "~/code/ruby")
     ("ack -af | xargs egrep -Hin %s" "~/bin"))))

(defun agrep-by-name-read-info (&rest kinds)
  (let* ((default (or (thing-at-point 'symbol) ""))
         (result (mapcar (lambda (kind)
                           (case kind
                             ('query (read-string
                                      (format "Grep query (default:%s): " default)
                                      nil nil default))
                             ('name (completing-read
                                     "Grep by name: "
                                     anything-grep-alist
                                     nil t nil nil agbn-last-name))))
                         kinds)))
    (if (cdr result)                    ; length >= 1
        result
      (car result))))

(defun jp-grep-emacs-config ()
  (interactive
   (let (what)
     (setq what
           (read-from-minibuffer "Grep for: "
                                 (if (and transient-mark-mode mark-active)
                                     (buffer-substring-no-properties (region-beginning) (region-end))
                                   (thing-at-point 'symbol))))
     (compilation-start (format jp-grep-cmd dotfiles-dir what)
                        'grep-mode))))

(defun jp-git-grep ()
  (interactive
   (let (what)
     (setq what
           (read-from-minibuffer "Grep for: "
                                 (if (and transient-mark-mode mark-active)
                                     (buffer-substring-no-properties (region-beginning) (region-end))
                                   (thing-at-point 'symbol))))
     (compilation-start (format jp-grep-cmd
                                (jp-find-git-repo default-directory)
                                what)
                        'grep-mode))))

(defun jp-grep-by-name ()
  (interactive (agrep-by-name-read-info 'query 'name))
  (setq query (or query (agrep-by-name-read-info 'query)))
  (setq name (or name (agrep-by-name-read-info 'name)))
  (setq agbn-last-name name)
  (anything-aif (assoc-default name anything-grep-alist)
      (progn
        (grep-compute-defaults)
        (anything-grep-base
         (mapcar (lambda (args)
                   (destructuring-bind (cmd dir) args
                     (agrep-source (format (agrep-preprocess-command cmd)
                                           (shell-quote-argument query)) dir)))
                 it)
         (format "*anything grep:%s [%s]" query name)))
    (error "no such name %s" name)))

(provide 'jp-lib-grep)
