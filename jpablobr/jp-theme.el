
(setq theaming-dir (concat vendor-dir "/theaming"))
(load-file (concat theaming-dir "/color-theme-tangotango/color-theme-tangotango.el"))
(color-theme-tangotango)

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

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
