;;; -*- coding: utf-8-unix; -*-
;;; ---------------------------------------------------------
;;; - CEDET
;;; - apt-get install cedet-common cedet-contrib cogre ede eieio semantic speedbar elib jde

(require 'semantic)
(require 'semantic-ia)
;;(require 'semantic-gcc)
(require 'semantic-wisent)

(add-to-list 'load-path "~/.emacs.d/vendor/cedet/semantic")
(require 'semanticdb)
(global-semanticdb-minor-mode 1)
(semantic-load-enable-excessive-code-helpers)

;; enable ctags for some languages:
;; Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
;; sudo apt-get install exuberant-ctags
;; http://blog.carduner.net/2007/07/02/exuberant-ctags-emacs/
;; (semantic-load-enable-primary-exuberent-ctags-support)

(custom-set-variables
 '(ecb-layout-window-sizes (quote (("left8"
                                    (0.19801980198019803 . 0.29310344827586204)
                                    (0.19801980198019803 . 0.2413793103448276)
                                    (0.19801980198019803 . 0.27586206896551724)
                                    (0.19801980198019803 . 0.1724137931034483)))))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("~/code/"))))

(global-ede-mode t)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-code-helpers)
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-decoration-mode
                                  global-semantic-highlight-func-mode
                                  global-semantic-stickyfunc-mode
                                  global-semantic-mru-bookmark-mode))

(setq semantic-load-turn-everything-on t)
(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)
;;(global-srecode-minor-mode 1)
;;(global-semantic-mru-bookmark-mode 1)

;; cedet is now managed by _el-get_ using latest source from cvs
(defun my-semantic-hook ()
  "feature setting hook for semantic"
  (require 'semantic-ia)
  (require 'semantic-gcc)

  (imenu-add-to-menubar "TAGS")
  (global-ede-mode t)
  (global-srecode-minor-mode 1)

  (semantic-load-enable-code-helpers)
  (global-semantic-highlight-func-mode 1)
  (global-semantic-show-unmatched-syntax-mode -1)
  (global-semantic-tag-folding-mode -1)
  (global-semantic-idle-scheduler-mode -1)
  )

(defun my-semantic-key-hook ()
  "key bindings for semantic modes"
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-c\C-r" 'semantic-symref)

  (local-set-key "\C-c/" 'semantic-ia-complete-symbol)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cd" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)

  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-cm" 'eassist-list-methods)
  )

(defun my-semanticdb-hook ()
  "semanticdb hook"
  (setq semanticdb-default-save-directory "~/semanticdb")
  (setq semanticdb-search-system-databases t)

  (setq-mode-local c-mode semanticdb-find-default-throttle
    '(project unloaded system recursive))
  (setq-mode-local c++-mode semanticdb-find-default-throttle
    '(project unloaded system recursive))

  (semantic-load-enable-primary-exuberent-ctags-support)
  )

(defun my-semantic-init()
  "all in one semantic init function"
  (progn
    (add-hook 'semantic-init-hooks 'my-semantic-hook)
    (add-hook 'semantic-init-hooks 'my-semanticdb-hook)
    (add-hook 'semantic-init-hooks 'my-semantic-key-hook)
    )
  )


;;(require 'semantic-decorate-include)
;;(require 'eassist)

(custom-set-variables
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function
   (lambda
     nil
     (semantic-ia-complete-symbol-menu
      (point)))))

;; ctags
;(require 'semanticdb-ectag)
;(semantic-load-enable-primary-exuberent-ctags-support)

(defun recur-list-files (dir re)
  "Returns list of files in directory matching to given regex"
  (when (file-accessible-directory-p dir)
    (let ((files (directory-files dir t))
          matched)
      (dolist (file files matched)
        (let ((fname (file-name-nondirectory file)))
          (cond
           ((or (string= fname ".")
                (string= fname "..")) nil)
           ((and (file-regular-p file)
                 (string-match re fname))
            (setq matched (cons file matched)))
           ((file-directory-p file)
            (let ((tfiles (recur-list-files file re)))
              (when tfiles (setq matched (append matched tfiles)))))))))))

(defun c++-setup-boost (boost-root)
  (when (file-accessible-directory-p boost-root)
    (let ((cfiles (recur-list-files boost-root "\\(config\\|user\\)\\.hpp")))
      (dolist (file cfiles)
        (add-to-list 'semantic-lex-c-preprocessor-symbol-file file)))))

;;; ede customization
(require 'semantic-lex-spp)
(global-ede-mode t)
;;(ede-enable-generic-projects)

;; my functions for EDE
(defun ede-get-local-var (fname var)
  "fetch given variable var from :local-variables of project of file fname"
  (let* ((current-dir (file-name-directory fname))
         (prj (ede-current-project current-dir)))
    (when prj
      (let* ((ov (oref prj local-variables))
            (lst (assoc var ov)))
        (when lst
          (cdr lst))))))

;; setup compile package
;; TODO: allow to specify function as compile-command
(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

(defun jpablobr-compile ()
  "Saves all unsaved buffers, and runs 'compile'."
  (interactive)
  (save-some-buffers t)
  (let* ((r (jpablobr/ede-get-local-var
             (or (buffer-file-name (current-buffer)) default-directory)
             'compile-command))
         (cmd (if (functionp r) (funcall r) r)))
;;    (message "AA: %s" cmd)
    (set (make-local-variable 'compile-command) (or cmd compile-command))
    (compile compile-command)))

(global-set-key [f9] 'jpablobr-cxompile)

;;
(defun gen-std-compile-string ()
  "Generates compile string for compiling CMake project in debug mode"
  (let* ((current-dir (file-name-directory
                       (or (buffer-file-name (current-buffer)) default-directory)))
         (prj (ede-current-project current-dir))
         (root-dir (ede-project-root-directory prj))
         )
    (concat "cd " root-dir "; make -j2")))

;;
(defun gen-cmake-debug-compile-string ()
  "Generates compile string for compiling CMake project in debug mode"
  (let* ((current-dir (file-name-directory
                       (or (buffer-file-name (current-buffer)) default-directory)))
         (prj (ede-current-project current-dir))
         (root-dir (ede-project-root-directory prj))
         (subdir "")
         )
    (when (string-match root-dir current-dir)
      (setf subdir (substring current-dir (match-end 0))))
    (concat "cd " root-dir "Debug/" "; make -j3")))

(provide 'jp-cedet)