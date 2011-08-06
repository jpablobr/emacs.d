
(setq theaming-dir (concat vendor-dir "/theaming"))
(load-file (concat theaming-dir "/color-theme-tangotango/color-theme-tangotango.el"))
(color-theme-tangotango)

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;;; ----------------------------------------------------------------------------
;;; - Transparency helper functions
;;;
(defun transparency ()
  "Sets transparency"
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(85 85))
  (add-to-list 'default-frame-alist '(alpha 85 85)))

(defun reset-transparency ()
  "Resets transparency"
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(100 100))
  (add-to-list 'default-frame-alist '(alpha 100 100)))

(cond
 ((eq window-system nil) nil)
 ((font-existsp "PragmataPro")
  (set-face-attribute 'default nil :font "PragmataPro"))
 ((font-existsp "Menlo")
  (set-face-attribute 'default nil :font "Menlo"))
 ((font-existsp "Consolas")
  (set-face-attribute 'default nil :font "Consolas"))
 ((font-existsp "Inconsolata")
  (set-face-attribute 'default nil :font "Inconsolata")))
