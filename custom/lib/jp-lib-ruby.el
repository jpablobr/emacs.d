(require 'font-lock)
(load-library "rubydb3x")

;; Clear the compilation buffer between test runs.
(eval-after-load 'ruby-compilation
  '(progn
     (defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
       (let ((comp-buffer-name (format "*%s*" name)))
         (when (get-buffer comp-buffer-name)
           (with-current-buffer comp-buffer-name
             (delete-region (point-min) (point-max))))))
     (ad-activate 'ruby-do-run-w/compilation)))

(defun jp-ruby-tmp-test ()
  "Open a tmp test.rb file."
  (interactive)
  (when (file-exists-p "~/tmp")
    (find-file "~/tmp/test/tmp_test.rb")))

(defun jp-ruby-koans ()
  "Run the current buffer in a ruby subprocess."
  (interactive)
  (compilation-start
   (concat "/usr/bin/env ruby " "~/code/ruby/ruby_koans/koans/path_to_enlightenment.rb")
   nil
   (lambda (x) "*Ruby Koans Path*")))

(defun jp-passenger:start ()
  "Fire up an instance of a Passenger server"
  (interactive)
  (let ((buffer (shell "*Passenger Server at port 3000*")))
    (comint-send-string buffer (concat "passenger start -p 3000 -e development" "\n"))))

(defun jp-rails-server:start ()
  "Fire up an instance of a Rails server"
  (interactive)
  (let ((buffer (shell "*Rails Server at port 3000*")))
    (comint-send-string buffer (concat "./script/rails s -p 3000 -e development" "\n"))))

(defun jp-rdebug-rails:start ()
  (interactive)
  (rdebug "rdebug script/server")
  (insert "e Dir.chdir('..')") )

(defun jp-pry-console:start ()
  "Fire up a pry console."
  (interactive)
  (setq current-file (buffer-name))
  (let ((buffer (shell (concat"*Pry @ " default-directory "*"))))
    (comint-send-string buffer (concat "pry \n"))))

(defun jp-rails-console:start ()
  (interactive)
  (run-ruby (concat (jp-rails-root) "/script/console")))

(defun jp-rails-root (&optional dir)
  (or dir (setq dir default-directory))
  (if (file-exists-p (concat dir "config/environment.rb"))
      dir
    (if (equal dir  "/")
        nil
      (jp-rails-root (expand-file-name (concat dir "../"))))))

(defun jp-ri-bind-key ()
  (local-set-key [f1] 'yari-anything))

(defun jp-rctags-gemset ()
  (interactive)
  (compilation-start
   (concat
    "cd "
    (jp-find-git-repo default-directory)
    " && find $(echo $GEM_PATH | cut -d: -f1) -type f -name '*.rb' | ctags -e --verbose=yes -L -")))

(defun jp-rctags-project ()
  (interactive)
  (compilation-start
   (concat
    "cd "
    (jp-find-git-repo default-directory)
    " && find . -type f -name '*.rb' | ctags -e --verbose=yes -L -")))

(provide 'jp-lib-ruby)
