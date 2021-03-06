(defvar  jp-grep-cmd
  "find %s -type f \
  \\( ! -regex '.*\\.git.*' \\) -a \
  \\( ! -regex '.*\\.elc$' \\) \
  -exec egrep -nH -e %s {} +")

(defun jp-grep-emacs-config ()
  (interactive
   (let (what)
     (setq what
           (read-from-minibuffer
            "Grep for: "
            (if (and transient-mark-mode mark-active)
                (buffer-substring-no-properties (region-beginning) (region-end))
              (thing-at-point 'symbol))))
     (compilation-start (format jp-grep-cmd dotfiles-dir what)
                        'grep-mode))))

(defun jp-git-grep ()
  (interactive
   (let (what)
     (setq what
           (read-from-minibuffer
            "Grep for: "
            (if (and transient-mark-mode mark-active)
                (buffer-substring-no-properties (region-beginning) (region-end))
              (thing-at-point 'symbol))))
     (compilation-start (format jp-grep-cmd
                                (find-git-repo default-directory)
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
