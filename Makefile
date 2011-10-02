### Makefile --- jpablobr emacs.d Makefile

## Author: xjpablobrx@gmail.com
## Version: $Id: Makefile,v 0.0 2011/04/26 15:26:45 jpablobr Exp $

## Paths:
user_home  = ~
emacs_dir  = $(user_home)/.emacs.d
vendor_dir = $(emacs_dir)/vendor
j_dir      = $(vendor_dir)/js
r_dir      = $(vendor_dir)/ruby
g_dir      = $(vendor_dir)/git
m_dir      = $(vendor_dir)/misc

## Commands:
curl           = $(shell which curl)
touch          = $(shell which touch)
emacs          = $(shell which emacs)
git_c          = $(shell which git) clone
rm             = $(shell which rm) -fr
mv             = $(shell which mv)
test           = $(shell which test)
complile_files = $(emacs) -batch -f batch-byte-compile *.el

r_links = https://raw.github.com/hron/yari.el/master/yari.el																													\
					http://www.emacswiki.org/emacs/download/toggle.el																														\
					https://raw.github.com/ruby/ruby/trunk/misc/inf-ruby.el																											\
					https://raw.github.com/ruby/ruby/trunk/misc/rdoc-mode.el																										\
					https://raw.github.com/ruby/ruby/trunk/misc/ruby-mode.el									                                  \
					https://raw.github.com/ruby/ruby/trunk/misc/ruby-style.el																										\
					https://raw.github.com/ruby/ruby/trunk/misc/rubydb2x.el																											\
					https://raw.github.com/ruby/ruby/trunk/misc/rubydb3x.el																											\
					https://raw.github.com/pezra/rspec-mode/master/rspec-mode-expectations.el	                                  \
					https://raw.github.com/pezra/rspec-mode/master/rspec-mode.el																								\
					http://www.emacswiki.org/emacs/download/ruby-compilation.el

m_links = https://raw.github.com/senny/rvm.el/master/rvm.el																				                    \
          https://raw.github.com/purcell/emacs.d/master/site-lisp/flymake-shell/flymake-shell.el

g_links = curl -O https://raw.github.com/defunkt/gist.el/master/gist.el

j_links = https://raw.github.com/mooz/js2-mode/master/js2-mode.el														                          \
					https://raw.github.com/defunkt/coffee-mode/master/coffee-mode.el									                          \
				  https://raw.github.com/purcell/emacs.d/master/site-lisp/flymake-js/flymake-js.el

update: u_js u_ruby u_git u_misc

## @sudo apt-get install cedet-common cedet-contrib cogre ede eieio semantic speedbar elib jde
sudo_update: u_sudo

u_js:
	@cd $(j_dir) && \
	for f in $(j_links); do $(curl) -O $$f; done && \
	$(complile_files)
	@$(touch) u_js

u_ruby:
	@cd $(r_dir) && \
	for f in $(r_links); do $(curl) -O $$f; done && \
	$(complile_files)
	@$(touch) u_ruby

u_git:
	@cd $(g_dir) && \
	for f in $(g_links); do $(curl) -O $$f; done && \
	$(complile_files)
	@$(touch) u_git

u_misc:
	@cd $(m_dir) && \
	for f in $(m_links); do $(curl) -O $$f; done && \
	$(complile_files)
	@$(touch) u_misc

u_sudo:
	@$(test) -d $(m_dir)/mmm-mode && $(mv) $(m_dir)/mmm-mode $(m_dir)/mmm-mode.bak
	@cd $(m_dir) && \
	$(git_c) https://github.com/purcell/mmm-mode.git
	@cd $(m_dir) && \
	@$(git_c) https://github.com/philjackson/magit.git
	@cd magit && make && make install
	@$(rm) $(m_dir)/mmm-mode.bak
	@$(rm) magit $(m_dir)/mmm-mode
	@$(touch) u_sudo

clean:
	@rm u_js u_ruby u_git u_misc

help:
	@ echo "Usage   :  make <target>"
	@ echo "Targets :"
	@ echo "   all ........... Builds the project."
	@ echo "   help .......... Prints this help message."
