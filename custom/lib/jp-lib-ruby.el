(load-library "rubydb3x")
(require 'inf-ruby)
(require 'align)

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

(defun jp-rails-unicorn-server:start ()
  (interactive)
  (let ((buffer (shell (concat "*Unicorn Rails Server @ " (jp-home-path) ))))
    (comint-send-string buffer "unicorn_rails\n")))

(defun jp-rails-server:start ()
  (interactive)
  (let ((buffer (shell (concat "*Rails Server @ " (jp-home-path) "at port 3000*"))))
    (comint-send-string buffer "./script/rails server\n")))

(defun jp-rdebug-rails:start ()
  (interactive)
  (rdebug "rdebug script/server")
  (insert "e Dir.chdir('..')") )

(defun jp-rails-console:start ()
  (interactive)
  (let ((buffer (shell (concat "*Rails Console @ " (jp-home-path) "*"))))
    (font-lock-mode)
    (comint-send-string buffer "./script/rails console \n")))

(defun jp-rails-spork:start ()
  (interactive)
  (let ((buffer (shell (concat "*Spork Shell @ " (jp-home-path) "*"))))
    (font-lock-mode)
    (comint-send-string buffer "bundle exec spork \n")))

(defun jp-rails-test-shell:start ()
  (interactive)
  (let ((buffer (shell (concat "*Test Shell @* " (jp-home-path) "*"))))
    (font-lock-mode)
    (comint-send-string buffer "git status \n")))

(defun jp-rails-start ()
  (interactive)
  (jp-rails-test-shell:start)
  (jp-rails-spork:start)
  (jp-rails-server:start)
  (jp-rails-console:start)
  (jp-shell))

(defun jp-pry-current-file ()
  (interactive)
  (setq full-file-name (file-truename buffer-file-name))
  (let ((buffer (shell (concat "*Pry @ " full-file-name "*"))))
    (font-lock-mode)
    (comint-send-string buffer (concat
                                "echo;pry -Ilib -r "
                                full-file-name " \n"))))

(defun jp-pry ()
  (interactive)
  (let ((buffer (shell (concat"*Pry @ " (jp-home-path) "*"))))
    (font-lock-mode)
    (comint-send-string buffer "echo;pry -Ilib \n")))

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
    (find-git-repo default-directory)
    " && find $(echo $GEM_PATH | cut -d: -f1) -type f -name '*.rb' | ctags -e --verbose=yes -L -")))

(defun jp-rctags-project ()
  (interactive)
  (compilation-start
   (concat
    "cd "
    (find-git-repo default-directory)
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
  (call-process "bundle exec html2haml" nil "-e" nil buffer-file-name new-file-name)
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

(defconst align-ruby-modes '(ruby-mode)
  "align-perl-modes is a variable defined in `align.el'.")

(defconst ruby-align-rules-list
  '((ruby-comma-delimiter
     (regexp . ",\\(\\s-*\\)[^/ \t\n]")
     (modes  . align-ruby-modes)
     (repeat . t))
    (ruby-string-after-func
     (regexp . "^\\s-*[a-zA-Z0-9.:?_]+\\(\\s-+\\)['\"]\\w+['\"]")
     (modes  . align-ruby-modes)
     (repeat . t))
    (ruby-symbol-after-func
     (regexp . "^\\s-*[a-zA-Z0-9.:?_]+\\(\\s-+\\):\\w+")
     (modes  . align-ruby-modes)))
  "Alignment rules specific to the ruby mode.
See the variable `align-rules-list' for more details.")

(add-to-list 'align-perl-modes 'ruby-mode)
(add-to-list 'align-dq-string-modes 'ruby-mode)
(add-to-list 'align-sq-string-modes 'ruby-mode)
(add-to-list 'align-open-comment-modes 'ruby-mode)
(dolist (it ruby-align-rules-list)
  (add-to-list 'align-rules-list it))

(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (overlay-put ov 'face 'font-lock-comment-face)
    (overlay-put ov 'display
                 (format " ... %d lines"
                         (count-lines (overlay-start ov)
                                      (overlay-end ov))))))

(eval-after-load "hideshow"
  (unless 'hs-set-up-overlay
    (setq hs-set-up-overlay 'display-code-line-counts)))

(add-hook 'hs-minor-mode-hook
          (lambda ()
            (unless hs-set-up-overlay
              (setq hs-set-up-overlay 'display-code-line-counts))))

(defun ruby-hs-minor-mode (&optional arg)
  (interactive)
  (require 'hideshow)
  (unless (assoc 'ruby-mode hs-special-modes-alist)
    (setq
     hs-special-modes-alist
     (cons (list 'ruby-mode
                 "\\(def\\|do\\)"
                 "end"
                 "#"
                 (lambda (&rest args) (ruby-end-of-block))
                                        ;(lambda (&rest args) (ruby-beginning-of-defun))
                 )
           hs-special-modes-alist)))
  (hs-minor-mode arg))

(defun ruby-newline-and-indent ()
  (interactive)
  (newline)
  (ruby-indent-line))

(defun ruby-toggle-string<>simbol ()
  "Easy to switch between strings and symbols."
  (interactive)
  (let ((initial-pos (point)))
    (save-excursion
      (when (looking-at "[\"']") ;; skip beggining quote
        (goto-char (+ (point) 1))
        (unless (looking-at "\\w")
          (goto-char (- (point) 1))))
      (let* ((point (point))
             (start (skip-syntax-backward "w"))
             (end (skip-syntax-forward "w"))
             (end (+ point start end))
             (start (+ point start))
             (start-quote (- start 1))
             (end-quote (+ end 1))
             (quoted-str (buffer-substring-no-properties start-quote end-quote))
             (symbol-str (buffer-substring-no-properties start end)))
        (cond
         ((or (string-match "^\"\\w+\"$" quoted-str)
              (string-match "^\'\\w+\'$" quoted-str))
          (setq quoted-str (substring quoted-str 1 (- (length quoted-str) 1)))
          (kill-region start-quote end-quote)
          (goto-char start-quote)
          (insert (concat ":" quoted-str)))
         ((string-match "^\:\\w+$" symbol-str)
          (setq symbol-str (substring symbol-str 1))
          (kill-region start end)
          (goto-char start)
          (insert (format "'%s'" symbol-str))))))
    (goto-char initial-pos)))

(defun complete-ruby-method (prefix &optional maxnum)
  (if (capital-word-p prefix)
      (let* ((cmd "x = []; ObjectSpace.each_object(Class){|i| x << i.to_s}; x.map{|i| i.match(/^%s/) ? i.gsub(/^%s/, '') : nil }.compact.sort{|x,y| x.size <=> y.size}")
             (cmd (if maxnum (concat cmd (format "[0...%s]" maxnum)) cmd)))
        (el4r-ruby-eval (format cmd prefix prefix)))
    (save-excursion
      (goto-char (- (point) (+ 1 (length prefix))))
      (when (and (looking-at "\\.")
                 (capital-word-p (word-at-point))
                 (el4r-ruby-eval
                  (format "::%s rescue nil" (word-at-point))))
        (let* ((cmd "%s.public_methods.map{|i| i.match(/^%s/) ? i.gsub(/^%s/, '') : nil }.compact.sort{|x,y| x.size <=> y.size}")
               (cmd (if maxnum (concat cmd (format "[0...%s]" maxnum)) cmd)))
          (el4r-ruby-eval (format cmd (word-at-point) prefix prefix)))))))

(defun ruby-snip ()
  (interactive)
  (setq centered-pos (+ 1 (line-number-at-pos)))
  (insert-string "#--><--snip--><---")
  (cmt-insert-bar-light)
  (insert-string "\n")
  (ruby-newline-and-indent)
  (insert-string "#--><--snip--><---")
  (cmt-insert-bar-light)
  (goto-line centered-pos)
  (ruby-indent-line))

(provide 'jp-lib-ruby)
