;; cedet
;; See cedet/common/cedet.info for configuration details.
(load-file "~/.emacs.d/vendor/cedet/common/cedet.el")

;; ecb
(add-to-list 'load-path "~/.emacs.d/vendor/ecb")
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(ecb-activate)
 (provide 'cedet)