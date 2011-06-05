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

r_links = https://github.com/hron/yari.el/raw/master/yari.el																													\
					http://www.emacswiki.org/emacs/download/unit-test.el																												\
					http://www.emacswiki.org/emacs/download/toggle.el																														\
					http://www.emacswiki.org/emacs/download/autotest.el																													\
					https://github.com/ruby/ruby/raw/trunk/misc/inf-ruby.el																											\
					https://github.com/ruby/ruby/raw/trunk/misc/rdoc-mode.el																										\
					https://github.com/ruby/ruby/raw/d9e6b7d6a5e81afb588d79ef923b70890cdec4ba/misc/ruby-mode.el									\
					https://github.com/ruby/ruby/raw/trunk/misc/ruby-style.el																										\
					https://github.com/ruby/ruby/raw/trunk/misc/rubydb2x.el																											\
					https://github.com/ruby/ruby/raw/trunk/misc/rubydb3x.el																											\
					https://github.com/purcell/emacs.d/raw/master/site-lisp/flymake-ruby/flymake-ruby.el												\
					https://github.com/pezra/rspec-mode/raw/7be69ffe32ade89061ccbca8a59c940a88a66f2b/rspec-mode-expectations.el	\
					https://github.com/pezra/rspec-mode/raw/master/rspec-mode.el																								\
					http://www.emacswiki.org/emacs/download/ruby-block.el																												\
					http://www.emacswiki.org/emacs/download/ruby-compilation.el

m_links = https://github.com/senny/rvm.el/raw/master/rvm.el																				                    \
          https://github.com/purcell/emacs.d/raw/master/site-lisp/flymake-shell/flymake-shell.el

g_links = curl -O https://github.com/defunkt/gist.el/raw/master/gist.el

j_links = https://github.com/mooz/js2-mode/raw/master/js2-mode.el														                          \
					https://github.com/defunkt/coffee-mode/raw/master/coffee-mode.el									                          \
				  https://github.com/purcell/emacs.d/raw/master/site-lisp/flymake-js/flymake-js.el

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
	@$(test) -d $(m_dir)/org && $(mv) $(m_dir)/org $(m_dir)/org.bak
	@$(test) -d $(m_dir)/mmm-mode && $(mv) $(m_dir)/mmm-mode $(m_dir)/mmm-mode.bak
	@cd $(m_dir) && \
	$(git_c) https://github.com/purcell/mmm-mode.git
	@cd $(m_dir) && \
	$(git_c) https://github.com/emacsmirror/org-mode.git org
	@$(git_c) https://github.com/philjackson/magit.git
	@cd magit && make && sudo make install
	@$(rm) $(m_dir)/org.bak $(m_dir)/mmm-mode.bak
	@$(rm) magit $(m_dir)/mmm-mode/.git $(m_dir)/org/.git
	@$(touch) u_sudo

clean:
	@rm u_js u_ruby u_git u_misc

help:
	@ echo "Usage   :  make <target>"
	@ echo "Targets :"
	@ echo "   all ........... Builds the project."
	@ echo "   help .......... Prints this help message."
