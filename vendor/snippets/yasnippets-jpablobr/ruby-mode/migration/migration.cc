# -*- mode: snippet -*-
#key: migration.cc
#name : change_column
# --
change_column :${1:`(or (ruby/cur-res-title) "table")`}, :${2:column}, :${3:type}
