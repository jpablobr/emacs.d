# Submodules Initialization
`git submodule update --init`
`cd vendor && git clone git@github.com:jpablobr/yasnippets-jpablobr.git yasnippets-jpablobr && git add yasnippets-jpablobr/ && cd yasnippets-jpablobr && git pull`
puts `ls -la vendor`
# Remiders
puts "Don't forget to M-x byte-compile-file js2 and to add html-mode sass-mode and haml-mode to the auto-complete.el (line # 163)"
