#name : change_column
#key : cc
#condition : (ruby/migration?)
# --
change_column :${1:`(or (ruby/cur-res-title) "table")`}, :${2:column}, :${3:type}
