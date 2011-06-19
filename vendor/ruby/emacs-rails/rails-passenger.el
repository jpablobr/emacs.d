;;; rails-passenger.el --- functions for manage application server

;; Copyright (C) 2006 Dmitry Galinsky <dima dot exe at gmail dot com>

;; Authors: Dmitry Galinsky <dima dot exe at gmail dot com>,
;;          Rezikov Peter <crazypit13 (at) gmail.com>

;; Keywords: ruby rails languages oop
;; $URL$
;; $Id$

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

;;; Code:

(defcustom rails-passenger:port "3000"
  "Passenger web server port"
  :group 'rails
  :type 'string
  :tag "Passenger Server Port")

(defcustom rails-passenger:server-name "http://localhost"
  "Protocol and the hostname for web server or other rails server"
  :group 'rails
  :type 'string
  :tag "Rails Server Default")

(defcustom rails-passenger:default-server-type "passenger"
  "Web server to run Rails application."
  :group 'rails
  :type 'string
  :tag "Rails Passenger Server")

(defvar rails-passenger:buffer-name "*RWebServer*")
(defvar rails-passenger:process-environment nil)

(defun rails-passenger:default-server-type-p (type)
  (string= type rails-passenger:default-server-type))

(defun rails-passenger:running-p ()
  "Return t if a WebServer process is running."
  (if (get-buffer-process rails-passenger:buffer-name) t nil))

(defun rails-passenger:sentinel-proc (proc msg)
  (let ((env rails-passenger:process-environment))
    (when (memq (process-status proc) '(exit signal))
      (setq rails-passenger:process-environment nil)
      (setq msg (format "stopped (%s)" msg)))
  (message
   (replace-regexp-in-string "\n" ""
                             (format "%s - %s"
                                     (capitalize rails-passenger:default-server-type)
                                     msg)))))

(defun rails-passenger:start(&optional env)
  "Start a server process with ENV environment if ENV is not set
using `rails-default-environment'."
  (interactive (list (rails-read-enviroment-name)))
  (rails-project:with-root
   (root)
   (let ((proc (get-buffer-process rails-passenger:buffer-name)))
     (if proc
         (message "Only one instance rails-passenger allowed")
       (let* ((default-directory root)
              (env (if env env rails-default-environment))
              (command (rails-passenger:compute-server-conmmand rails-passenger:port env))
              (proc
               (rails-cmd-proxy:start-process rails-ruby-command
                                              rails-passenger:buffer-name
                                              (car command)
                                              (cadr command))))
           (set-process-sentinel proc 'rails-passenger:sentinel-proc)
           (setq rails-passenger:process-environment env)
           (message (format "%s (%s) starting with port %s"
                            (capitalize rails-passenger:default-server-type)
                            env
                            rails-passenger:port)))))))

(defun rails-passenger:compute-server-conmmand (port env)
  (list rails-ruby-command
        (format "passenger start -p %s -e %s"
                port
                env)))

(defun rails-passenger:stop ()
  "Stop the WebServer process."
  (interactive)
  (let ((proc (get-buffer-process rails-passenger:buffer-name)))
    (when proc (kill-process proc t))))

(defun rails-passenger:start-default ()
  "Start WebServer using the default environment defined in
`rails-default-environment'."
  (interactive)
  (rails-passenger:start rails-default-environment))

(defun rails-passenger:start-development ()
  (interactive)
  (rails-passenger:start "development"))

(defun rails-passenger:start-production ()
  (interactive)
  (rails-passenger:start "production"))

(defun rails-passenger:start-test ()
  (interactive)
  (rails-passenger:start "test"))

(defun rails-passenger:toggle-start-stop ()
  "Toggle Rails WebServer start/stop with default environment."
  (interactive)
  (if (rails-passenger:running-p)
      (rails-passenger:stop)
    (rails-passenger:start-default)))

(defun rails-passenger:print-status ()
  (interactive)
  (message
   (concat rails-passenger:default-server-type
           " (" (if rails-passenger:process-environment
                    rails-passenger:process-environment
                  rails-default-environment) ")"
           " is "
           (if (rails-passenger:running-p)
               (concat "running on port " rails-passenger:port)
             "stopped"))))

;;;;;;;;;; Open browser ;;;;;;;;;;

(defun rails-passenger:open-browser (&optional address)
  "Open a browser on the main page of the current Rails project
server."
  (interactive)
  (let ((url (concat (concat rails-passenger:server-name
                             ":"
                             rails-passenger:port
                             "/"
                             address ))))
    (message "Opening browser: %s" url)
    (browse-url url)))

(defun rails-passenger:open-browser-on-controller (&optional controller action params)
  "Open browser on the controller/action/id for the current
file."
  (interactive
   (list
    (completing-read "Controller name: "
                     (list->alist (rails-core:controllers t)))
    (read-from-minibuffer "Action name: ")
    (read-from-minibuffer "Params: ")))
  (when (string-not-empty controller)
    (rails-passenger:open-browser
     (concat (rails-core:file-by-class controller t) "/"
             (if (string-not-empty action) (concat action "/")) params))))

(defun rails-passenger:auto-open-browser (ask-parameters?)
  "Autodetect the current action and open browser on it with.
Prefix the command to ask parameters for action."
  (interactive "P")
  (rails-project:with-root
   (root)
   (if (find (rails-core:buffer-type) '(:view :controller))
       (when-bind (controller (rails-core:current-controller))
                  (rails-passenger:open-browser-on-controller
                   controller (rails-core:current-action)
                   (when ask-parameters?
                     (read-from-minibuffer "Parameters: "))))
     (message "You can auto-open browser only in view or controller"))))

(provide 'rails-passenger)