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

(provide 'jp-lib-ruby)
