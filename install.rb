# Author:: Jose Pablo Barrantes (xjpablobrx@gmail.com)
# 
# - Fake submoduling initialization
# 

# yasnippets-jpablobr
system %Q{ cd vendor && git clone git@github.com:jpablobr/yasnippets-jpablobr.git yasnippets-jpablobr }
system %Q{ cd vendor && git add yasnippets-jpablobr/ && cd yasnippets-jpablobr && git pull }

# clojure-mode
system %Q{ cd vendor && git clone git://github.com/jochu/clojure-mode.git clojure-mode }
system %Q{ cd vendor && git add clojure-mode/ && cd clojure-mode && git pull }

# pylookup
system %Q{ cd vendor && git clone http://github.com/tsgates/pylookup.git pylookup }
system %Q{ cd vendor && git add pylookup/ && cd pylookup && git pull }

# erlware-mode
system %Q{ cd vendor && git clone http://github.com/massemanet/erlware-mode.git erlware-mode }
system %Q{ cd vendor && git add erlware-mode/ && cd erlware-mode && git pull }

# erlware-mode
system %Q{ cd vendor && git clone http://github.com/emacsmirror/haskell-mode.git haskell-mode }
system %Q{ cd vendor && git add haskell-mode/ && cd haskell-mode && git pull }

# twittering-mode
system %Q{ cd vendor && git clone  git://github.com/hayamiz/twittering-mode.git twittering-mode }
system %Q{ cd vendor && git add twittering-mode/ && cd twittering-mode && git pull }

# rspec-mode
system %Q{ cd vendor && git clone  http://github.com/pezra/rspec-mode.git rspec-mode }
system %Q{ cd vendor && git add rspec-mode/ && cd rspec-mode && git pull }

# rinari
system %Q{ cd vendor && git clone  git://github.com/technomancy/rinari.git rinari }
system %Q{ cd vendor && git add rinari/ && cd rinari && git pull }

# ri-emacs
system %Q{ cd vendor && git clone  git://github.com/pedz/ri-emacs.git ri-emacs }
system %Q{ cd vendor && git add ri-emacs/ && cd ri-emacs && git pull }

# icicles
system %Q{ cd vendor && git clone  git://github.com/emacsmirror/icicles.git icicles }
system %Q{ cd vendor && git add icicles/ && cd icicles && git pull }

# color-theme-tangotango
system %Q{ cd vendor && git clone  git://github.com/jpablobr/color-theme-tangotango.git color-theme-tangotango }
system %Q{ cd vendor && git add color-theme-tangotango/ && cd color-theme-tangotango && git pull }

# rhtml
system %Q{ cd vendor && git clone  git://github.com/eschulte/rhtml.git rhtml }
system %Q{ cd vendor && git add rhtml/ && cd rhtml && git pull }

# emacs-rails-reloaded
system %Q{ cd vendor && git clone  git://github.com/jpablobr/emacs-rails-reloaded.git jpablobr-ror }
system %Q{ cd vendor && git add jpablobr-ror/ && cd jpablobr-ror && git pull }

# showoff
system %Q{ cd vendor && git clone  https://github.com/developernotes/showoff-mode.git showoff-mode }
system %Q{ cd vendor && git add showoff-mode/ && cd showoff-mode && git pull }

# Display vendor dir tree structure after submodule initialization
puts `ls -la vendor`
