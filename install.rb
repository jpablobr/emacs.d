# Author:: Jose Pablo Barrantes (xjpablobrx@gmail.com)
# Created:: 2010-08-29
#
# Submodules Initialization

system %Q{ git submodule update --init }
system %Q{ cd vendor && git clone git@github.com:jpablobr/yasnippets-jpablobr.git yasnippets-jpablobr }
system %Q{ git add yasnippets-jpablobr/ && cd yasnippets-jpablobr && git pull }
puts `ls -la vendor`
