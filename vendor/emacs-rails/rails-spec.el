;;; rails-rake.el --- emacs-rails integraions with rake tasks.

;; Copyright (C) 2006 Dmitry Galinsky <dima dot exe at gmail dot com>

;; Authors: Dmitry Galinsky <dima dot exe at gmail dot com>,
;;          Peter Rezikov <crazypit13 at gmail dot com>
;; Keywords: ruby rails languages oop
;; $URL: svn+ssh://rubyforge/var/svn/emacs-rails/trunk/rails-spec.el $
;; $Id: rails-spec.el 117 2007-03-25 23:37:37Z dimaexe $

;;; License

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

(defvar rails-spec:all-files "./spec"
  "All spec files/directories in project")

(defvar rails-spec:runner "./script/spec"
  "Command, that run specs.")

(defvar rails-spec:runner-options ""
  "Options to spec command.")

(defvar rails-spec:last-run nil
  "Spec and arguments of last run.")

(defun rails-spec:run (files &optional options)
  "Rerun previous spec run."
  (setf rails-spec:last-run (cons files options))
  (let ((default-process-coding-system '(utf-8 . utf-8)))
    (rails-project:compile-in-root
     (concat rails-spec:runner " "
             rails-spec:runner-options " "
             options " "
             files))))

(defun rails-spec:run-current ()
  "Run spec for the current controller/model/mailer."
  (interactive)
  (let* ((type (rails-core:buffer-type))
         (spec (cond
                 ((find type '(:model :mailer :rspec-fixture))
                  (rails-core:rspec-model-file (rails-core:current-model)))
                 ((find type '(:controller :helper :view))
                  (rails-core:rspec-controller-file (rails-core:current-controller)))
                 ((find type '(:rspec-model :rspec-controller :rspec-lib))
                  (buffer-file-name))
                 ((eql type :lib)
                  (rails-core:rspec-lib-file (rails-core:current-lib))))))
    (if spec
      (rails-spec:run spec)
      (message "No spec found for %s" (buffer-file-name)))))

(defun rails-spec:run-all ()
  "Run spec for all files in project (rails-spec:all-files variable)"
  (interactive)
  (rails-spec:run rails-spec:all-files))

(defun rails-spec:run-last ()
  "Rerun previous spec run."
  (interactive)
  (when rails-spec:last-run
    (rails-spec:run (car rails-spec:last-run) (cdr rails-spec:last-run))))

(defun rails-spec:run-this-spec ()
  "Run spec where the point is"
  (interactive)
  (rails-spec:run (buffer-file-name) (concat "--line " (substring (what-line) 5))))

(provide 'rails-spec)
