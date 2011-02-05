;;; aucify.el --- make Ultra-TeX compatible with AUC-TeX
;; Copyright (c) 1996, 1997, 1998, 1999 Mark Hovey, John Palmieri

;; Authors:   Mark Hovey <hovey@member.ams.org>, 
;;            John Palmieri <palmieri@math.washington.edu>
;; Keywords: AUC-TeX vs. Ultra-TeX
;; Version:  0.63 of Tue Jun 29 14:39:57 PDT 1999

;; This file is not part of GNU Emacs.

;; This package is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This package is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Description: 
;;   
;; This file defines variables and keys in ultra-tex-mode-map which
;; let Ultra-TeX mode use the AUC-TeX functions (from the file
;; tex-buf.el) that run (La)TeX on your buffer, start up a viewer,
;; print the file, etc.  See the AUC-TeX documentation for how to use
;; this (basically, you just hit C-c C-c).

(require 'tex-buf)
(require 'ultex)
(require 'tex)

(if (null ultra-tex-mode-map)
    (progn
      (ultex-define-ultra-tex-mode-map)
      (ultex-reset-greek-keys)))

(define-key ultra-tex-mode-map "\C-c\C-w" 'TeX-toggle-debug-boxes)
(define-key ultra-tex-mode-map "\C-c`" 'TeX-next-error)
(define-key ultra-tex-mode-map "\C-c\C-l" 'TeX-recenter-output-buffer) 
(define-key ultra-tex-mode-map "\C-c\C-k" 'TeX-kill-job)
(define-key ultra-tex-mode-map "\C-c\C-c" 'TeX-command-master)
(define-key ultra-tex-mode-map "\C-c\C-t" 'TeX-command-region)

(easy-menu-define
 aucify-mode-menu
 ultra-tex-mode-map
 "TeX commands menu used in Ultra-TeX mode."
 (append '("TeX-commands")
	 '(("Command on"
	    [ "Master File" TeX-command-select-master
	      :keys "C-c C-c" :style radio
	      :selected (eq TeX-command-current 'TeX-command-master) ]
	    [ "Buffer" TeX-command-select-buffer
	      :keys "C-c C-b" :style radio
	      :selected (eq TeX-command-current 'TeX-command-buffer) ]
	    [ "Region" TeX-command-select-region
	      :keys "C-c C-r" :style radio
	      :selected (eq TeX-command-current 'TeX-command-region) ]))
	 (let ((file 'TeX-command-on-current))
	   (mapcar 'TeX-command-menu-entry TeX-command-list))))

(provide 'aucify)