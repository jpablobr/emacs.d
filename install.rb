# Author:: Jose Pablo Barrantes (xjpablobrx@gmail.com)
# 
# - Submodules Initialization
# 

system %Q{ git submodule update --init }

# Fake submoduling yasnippets-jpablobr
system %Q{ cd vendor && git clone git@github.com:jpablobr/yasnippets-jpablobr.git yasnippets-jpablobr }
system %Q{ cd vendor && git add yasnippets-jpablobr/ && cd yasnippets-jpablobr && git pull }

# Display vendor dir tree structure after submodule initialization
puts `ls -la vendor`
