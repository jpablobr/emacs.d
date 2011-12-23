;;;;; Simple Ruby Completion Source for Auto-Complete
;;;;; =================================================
;;;;;
;;;;; This file provides a completion source for Auto-Complete:
;;;;; http://www.emacswiki.org/emacs/AutoComplete
;;;;;
;;;;; Installation
;;;;; ------------
;;;;; 
;;;;; Setup Auto-Complete in the usual fashion, and make sure it gets loaded for
;;;;; ruby buffers. Then, place this file in your load-path, and add
;;;;; 
;;;;;     (require 'ac-ruby)
;;;;; 
;;;;; to your .emacs file (after loading Auto-Complete).
;;;;; 
;;;;; Usage
;;;;; -----
;;;;; 
;;;;; To teach Emacs about symbols in imported modules, Emacs needs to execute
;;;;; the Ruby source. This can be accomplished with `ruby-send-buffer` for
;;;;; example, often bound to `C-c C-c`. If a ruby process is already running,
;;;;; this is essentially instantaneous.
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun ac-get-ruby-symbol-at-point ()
  "Return ruby symbol at point.

Assumes symbol can be alphanumeric, `.' or `_'."
  (let ((end (point))
        (start (ac-ruby-start-of-expression)))
    (buffer-substring-no-properties start end)))

(defun ac-ruby-completion-at-point ()
  "Returns a possibly empty list of completions for the symbol at
point."
  (ruby-symbol-completions (ac-get-ruby-symbol-at-point)))

(defun ac-ruby-start-of-expression ()
  "Return point of the start of ruby expression at point.

Assumes symbol can be alphanumeric, `.' or `_'."
  (save-excursion
    (and (re-search-backward
          (rx (or buffer-start (regexp "[^[:alnum:]._]"))
              (group (1+ (regexp "[[:alnum:]._]"))) point)
          nil t)
         (match-beginning 1))))

(defvar ac-source-ruby
  '((candidates . ac-ruby-completion-at-point)
    (prefix . ac-ruby-start-of-expression)
    (symbol . "f")
    (requires . 2))
  "Source for ruby completion.")

(add-hook 'ruby-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-ruby)))

(provide 'ac-ruby)
