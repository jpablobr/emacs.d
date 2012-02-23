(defun ascii-build ()
  "Build asciidoc pdf"
  (interactive)
  (async-shell-command "~/wil/report/build.sh"))

(provide 'jp-lib-commands)
