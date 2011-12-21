(setq erlang-dir (concat vendor-dir "/erlang"))
(add-to-list 'load-path (concat erlang-dir "/erlware-mode"))
(add-to-list 'load-path (concat erlang-dir "/distel/elisp"))
(add-to-list 'load-path (concat erlang-dir "/esense"))

(defun init-erlang()
  "load the mode"
  (interactive)

(require 'erlang-start)

(eval-after-load 'erlang-mode
  '(progn
     (flymake-mode)))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

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

;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")

(require 'esense-start)
(setq esense-indexer-program (concat erlang-dir "/esense/esense.sh")))

(provide 'jp-erlang)
