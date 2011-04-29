### Makefile --- jpablobr emacs.d Makefile

## Author: xjpablobrx@gmail.com
## Version: $Id: Makefile,v 0.0 2011/04/26 15:26:45 jpablobr Exp $

user_home  = ~
emacs_dir  = $(user_home)/.emacs.d
vendor_dir = $(emacs_dir)/vendor
js_dir     = $(vendor_dir)/js
ruby_dir   = $(vendor_dir)/ruby
git_dir    = $(vendor_dir)/git
misc_dir    = $(vendor_dir)/misc

update: u_js u_ruby u_git u_misc

sudo_update: u_sudo

u_js:
	@cd $(js_dir) && \
	curl -O https://github.com/mooz/js2-mode/raw/master/js2-mode.el && rm js2-mode.elc && \
	curl -O https://github.com/defunkt/coffee-mode/raw/master/coffee-mode.el && rm coffee-mode.elc
	@touch u_js

u_ruby:
	@cd $(ruby_dir) && \
	curl -O https://github.com/hron/yari.el/raw/master/yari.el && rm yari.elc && \
	curl -O http://www.emacswiki.org/emacs/download/unit-test.el && rm unit-test.elc && \
	curl -O http://www.emacswiki.org/emacs/download/toggle.el && rm toggle.elc && \
	curl -O http://www.emacswiki.org/emacs/download/autotest.el && rm autotest.elc && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/inf-ruby.el && rm inf-ruby.elc && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/rdoc-mode.el && rm rdoc-mode.elc && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/ruby-electric.el && rm ruby-electric.elc && \
	curl -O https://github.com/ruby/ruby/raw/d9e6b7d6a5e81afb588d79ef923b70890cdec4ba/misc/ruby-mode.el && rm ruby-mode.elc && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/ruby-style.el && rm ruby-style.elc && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/rubydb2x.el && rm rubydbx2.elc && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/rubydb3x.el && rm rubydbx3.elc && \
	curl -O https://github.com/purcell/emacs.d/raw/master/site-lisp/flymake-ruby/flymake-ruby.el && flymake-ruby.elc rm \
	curl -O https://github.com/pezra/rspec-mode/raw/7be69ffe32ade89061ccbca8a59c940a88a66f2b/rspec-mode-expectations.el && rm rspec-mode-expectations.elc && \
	curl -O https://github.com/pezra/rspec-mode/raw/master/rspec-mode.el && rm rspec-mode.elc && \
	curl -O http://www.emacswiki.org/emacs/download/ruby-block.el && rm ruby-block.elc && \
	curl -O http://www.emacswiki.org/emacs/download/ruby-compilation.el rm ruby-complilation.elc
	@touch u_ruby

u_git:
	@cd $(git_dir) && \
	curl -O https://github.com/defunkt/gist.el/raw/master/gist.el
	@touch u_git

u_misc:
	@cd $(ruby_dir) && \
	curl -O https://github.com/senny/rvm.el/raw/master/rvm.el && rm rvm.elc
	@touch u_misc

u_sudo:
	@rm -fr auctex magit $(misc_dir)/org
	@cd $(misc_dir) && \
	git clone https://github.com/emacsmirror/org-mode.git org && \
	cd org && make
	@git clone https://github.com/philjackson/magit.git
	@cd magit && make && sudo make install
	@git clone http://github.com/eschulte/auctex.git
	@cd auctex && ./configure && make && sudo make install
	@rm -fr auctex magit
	@touch u_sudo

clean:
	@rm u_js u_ruby u_git u_misc
