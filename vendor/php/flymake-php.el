;;;flymake-php.el --- Flymake extension for PHP.

;; Copyright (C) 2008   <aleksei.gusev@warecorp.com>

;; Author:  <aleksei.gusev@warecorp.com>
;; Created: 23 Feb 2008
;; Version: $Id$
;; Keywords: 

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; 

;;; Code:

;; Flymake PHP Extension

;; See http://www.openweblog.com/users/hexmode/496282.html

;; Now, whether you're using the emacs you started with or the latest
;; emacs-snapshot, you need to tell emacs to use flymake on PHP files.
;; Add: (add-hook 'php-mode-hook (lambda () (flymake-mode t)))

(require 'flymake)
(unless (fboundp 'flymake-php-init)
  (defun flymake-php-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "php" (list "-f" local-file "-l")))))

(let ((php-ext-re "\\.php[345]?\\'")
      (php-error-re
       "\\(?:Parse\\|Fatal\\) error: \\(.*\\) in \\(.*\\) on line \\([0-9]+\\)"))
  (unless (assoc php-ext-re flymake-allowed-file-name-masks)
    (add-to-list 'flymake-allowed-file-name-masks
                 (list php-ext-re
                   'flymake-php-init
                   'flymake-simple-cleanup
                   'flymake-get-real-file-name))
    (add-to-list 'compilation-error-regexp-alist-alist
                 (list 'compilation-php
                   php-error-re  2 3 nil nil))
    (add-to-list 'compilation-error-regexp-alist 'compilation-php)
    (add-to-list 'flymake-err-line-patterns
                 (list php-error-re 2 3 nil 1))))

(provide 'flymake-php)

;;; flymake-php.el ends here

