(require 'etags)
(require 'anything-exuberant-ctags)

;; (defun jp-ft-be-prefix-transform (tagname)
;;   "Transform the tagname if it matches the 'be_xxxx' pattern."
;;   (and tagname
;;        (> (length tagname) 3)
;;        (string= (substring tagname 0 3) "be_")
;;        (substring tagname 3) ))

;; (defun jp-ft-transform (tagname)
;;   "Transform the extended tagname to its actual name, or nil if there is no transform."
;;   (jp-ft-be-prefix-transform tagname))

;; (defun jp-ft-extended-find (tagname next-p regexp-p)
;;   "Call find-tag with a tranformed tagname."
;;   (let ((transformed-tagname (jp-ft-transform tagname)))
;;     (if transformed-tagname
;;         (find-tag transformed-tagname next-p regexp-p)
;;       (error (concat "No extended tags containing " tagname)) )))

;; (defun jp-extended-find-tag (tagname &optional next-p regexp-p)
;;   "Extended find-tag function to handle tags that don't literally match."
;;   (interactive (find-tag-interactive "Find extended tag: "))
;;   (condition-case nil
;;       (find-tag tagname next-p regexp-p)
;;     (error (jp-ft-extended-find tagname next-p regexp-p)) ))

;; ;;; Remap the standard find-tag key to use the extended version.
;; (global-set-key "\M-." 'jp-extended-find-tag)

(provide 'jp-tags)