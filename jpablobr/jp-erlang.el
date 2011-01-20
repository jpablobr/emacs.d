;;; ----------------------------------------------------------------------------
;;; - Erlang
;;;
(add-to-list 'load-path (concat dotfiles-dir "/vendor/erlware-mode"))
(require 'erlang-start)

(eval-after-load 'erlang-mode
  '(progn
     (flymake-mode)))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

(add-to-list 'load-path "~/.emacs.d/vendor/distel/elisp")
(require 'distel)
(distel-setup)

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "~/bin/emacs/eflymake" (list local-file))))

(defun alexott/erlang-mode-hook ()
  ;; when starting an Erlang shell in Emacs, default in the node name
  (setq inferior-erlang-machine-options '("-sname" "emacs"))
  ;; add Erlang functions to an imenu menu
  (imenu-add-to-menubar "imenu")
  (when (and buffer-file-name
             (string-match "flymake" buffer-file-name))
    (flymake-mode -1))
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'erlang-mode-hook 'alexott/erlang-mode-hook)
;; (add-hook 'erlang-mode-hook 'alexott/common-hook)
;; (add-hook 'erlang-mode-hook 'alexott/show-prog-keywords)

;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;; add some Distel bindings to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(add-to-list 'load-path "~/.emacs.d/vendor/esense")
(require 'esense-start)
(setq esense-indexer-program "~/.emacs.d/vendor/esense/esense.sh")

(provide 'jp-erlang)