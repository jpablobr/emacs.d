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
  (interactive)
  (let ((buffer (shell (concat "*Rails Server @ " (jp-home-path) "at port 3000*"))))
    (comint-send-string buffer (concat (jp-rails-root) "/script/rails s -p 3000 -e development" "\n"))))

(defun jp-rdebug-rails:start ()
  (interactive)
  (rdebug "rdebug script/server")
  (insert "e Dir.chdir('..')") )

(defun jp-pry-current-file ()
  (interactive)
  (let ((buffer (shell (concat"*Pry @ " current-file "*"))))
    (font-lock-mode)
    (comint-send-string buffer (concat
                                "echo;pry -Ilib -r ./"
                                current-file "\n"))))

(defun jp-pry ()
  (interactive)
  (let ((buffer (shell (concat"*Pry @ " (jp-home-path) "*"))))
    (font-lock-mode)
    (comint-send-string buffer "echo;pry -Ilib \n")))

(defun jp-rails-console:start ()
  (interactive)
  (let ((buffer (shell (concat "*Rails Console @ " (jp-home-path) "*"))))
    (font-lock-mode)
    (comint-send-string buffer "pry -r ./config/environment\n")))

(defun jp-rails-root (&optional dir)
  (or dir (setq dir default-directory))
  (if (file-exists-p (concat dir "config/environment.rb"))
      dir
    (if (equal dir  "/")
        nil
      (jp-rails-root (expand-file-name (concat dir "../"))))))

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
    " && find $(pwd) -type f -name '*.rb' | ctags -e --verbose=yes -L -")))

(defun jp-ruby-xmp-region (reg-start reg-end)
  (interactive "r")
  (shell-command-on-region reg-start reg-end
                           "ruby -r xmp -n -e 'xmp($_, \"%l\t\t# %r\n\")'"
                           t))

(setq compilation-error-regexp-alist
      (cons
       '("^\\(Failure\\|Error\\) occurred in .*\\[\\([^:]+\\):\\([0-9]+\\)\\]" 2 3)
       compilation-error-regexp-alist))

(defun erb-to-haml ()
  (interactive)
  (jp-load-haml-scss)
  (setq new-file-name (replace-regexp-in-string ".erb" ".haml" buffer-file-name))
  ;; (async-shell-command (concat "html2haml -e" buffer-file-name new-file-name))
  (call-process "html2haml" nil "-e" nil buffer-file-name new-file-name)
  (if (file-exists-p new-file-name)
      (find-file new-file-name)
    (message (concat new-file-name " not created!"))))

(defun rails-puma-server:start ()
  (interactive)
  (let ((buffer (shell (concat "*Rails server Puma @ " (jp-home-path) "*"))))
    (font-lock-mode)
    (comint-send-string buffer "rails s puma")))

(defun bundle-update ()
  (interactive)
  (async-shell-command (concat
                        "/home/jpablobr/.private/bin/bundle-update.sh "
                        (find-git-repo default-directory))))

(provide 'jp-lib-ruby)
