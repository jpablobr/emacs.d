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

(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

;;; Auto loads -------------------------------------------------------

(add-hook 'ruby-mode-hook 'font-lock-fontify-buffer)
(add-hook 'ruby-mode-hook '(lambda ()
                             (add-hook
                              (cond ((boundp 'before-save-hook)
                                     (make-local-variable 'before-save-hook)
                                     'before-save-hook)
                                    ((boundp 'write-contents-functions) 'write-contents-functions)
                                    ((boundp 'write-contents-hooks) 'write-contents-hooks))
                              'delete-trailing-whitespace)))

(defun r-tmp-test ()
  "Open a tmp test.rb file."
  (interactive)
  (when (file-exists-p "~/tmp")
    (find-file "~/tmp/test/tmp_test.rb")))

(defun r-koans ()
  "Run the current buffer in a ruby subprocess."
  (interactive)
  (compilation-start
   (concat "/usr/bin/env ruby " "~/code/ruby/ruby_koans/koans/path_to_enlightenment.rb")
   nil
   (lambda (x) "*Ruby Koans Path*")))

(add-hook 'ruby-mode-common-hook
          '(lambda ()
             (add-to-list 'ac-omni-completion-sources
                          (cons "\\." '(ac-source-semantic)))
             (add-to-list 'ac-omni-completion-sources
                          (cons "->" '(ac-source-semantic)))
             (setq ac-sources '(ac-source-semantic
                                ac-source-yasnippet
                                ac-source-filename
                                ac-source-functions
                                ac-source-variables
                                ac-source-symbols
                                ac-source-features
                                ac-source-semantic
                                ac-source-semantic-raw))))

(provide 'jp-lib-ruby)
