(defvar  jp-grep-cmd
  "find %s -type f \\( ! -regex '.*\\.git.*' \\) -a \\( ! -regex '.*\\.elc$' \\) -exec egrep -nH -e %s {} +")

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
(provide 'jp-lib-grep)
