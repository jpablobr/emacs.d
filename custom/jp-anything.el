(require 'anything)
(load-file (concat misc-dir "/anything-match-plugin.el"))
(require 'anything-match-plugin)
(require 'anything-config)

(setq anything-sources
      (list anything-c-source-buffers+
            anything-c-source-info-bash
            anything-c-source-info-sed
            anything-c-source-info-grep
            anything-c-source-bookmarks
            anything-c-source-emacs-functions-with-abbrevs
            anything-c-source-imenu
            anything-c-source-ctags
            anything-c-source-semantic
            anything-c-source-customize-face
            anything-c-source-colors
            anything-c-source-kill-ring
            anything-c-source-fixme
            anything-c-source-org-keywords
            anything-c-source-google-suggest
            anything-c-source-browse-code
            anything-c-source-top
            anything-c-source-emacs-process
            anything-c-source-files-in-current-dir
            anything-c-source-file-name-history
            anything-c-source-info-pages
            anything-c-source-calculation-result
            anything-c-source-locate
            anything-c-source-emacs-commands))

(provide 'jp-anything)
