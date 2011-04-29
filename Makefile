### Makefile --- jpablobr emacs.d Makefile

## Author: xjpablobrx@gmail.com
## Version: $Id: Makefile,v 0.0 2011/04/26 15:26:45 jpablobr Exp $

user_home  = ~
emacs_dir  = $(user_home)/.emacs.d
vendor_dir = $(emacs_dir)/vendor
js_dir     = $(vendor_dir)/js
ruby_dir   = $(vendor_dir)/ruby
git_dir    = $(vendor_dir)/git

update: u_js u_ruby u_git u_misc

sudo_update: u_sudo

u_js:
	@cd $(js_dir) && \
	curl -O https://github.com/mooz/js2-mode/raw/master/js2-mode.el && \
	curl -O https://github.com/defunkt/coffee-mode/raw/master/coffee-mode.el
	@touch u_js

u_ruby:
	@cd $(ruby_dir) && \
	curl -O https://github.com/hron/yari.el/raw/master/yari.el && \
	curl -O http://www.emacswiki.org/emacs/download/unit-test.el && \
	curl -O http://www.emacswiki.org/emacs/download/toggle.el && \
	curl -O http://www.emacswiki.org/emacs/download/autotest.el && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/inf-ruby.el && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/rdoc-mode.el && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/ruby-electric.el && \
	curl -O https://github.com/ruby/ruby/raw/d9e6b7d6a5e81afb588d79ef923b70890cdec4ba/misc/ruby-mode.el && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/ruby-style.el && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/rubydb2x.el && \
	curl -O https://github.com/ruby/ruby/raw/trunk/misc/rubydb3x.el && \
	curl -O https://github.com/purcell/emacs.d/blob/master/site-lisp/flymake-ruby/flymake-ruby.el && \
	curl -O https://github.com/pezra/rspec-mode/raw/7be69ffe32ade89061ccbca8a59c940a88a66f2b/rspec-mode-expectations.el && \
	curl -O https://github.com/pezra/rspec-mode/raw/master/rspec-mode.el && \
	curl -O http://www.emacswiki.org/emacs/download/ruby-block.el && \
	curl -O http://www.emacswiki.org/emacs/download/ruby-compilation.el
	@touch u_ruby

u_git:
	@cd $(git_dir) && \
	curl -O https://github.com/defunkt/gist.el/raw/master/gist.el
	@touch u_git

u_misc:
	@rm -fr $(vendor_dir)/nxhtml
	@cd $(vendor_dir) && \
	git clone https://github.com/emacsmirror/nxhtml.git
	@rm -fr $(vendor_dir)/nxhtml/.git
	@touch u_misc

u_sudo:
	@rm -fr auctex magit org-mode
	@git clone http://orgmode.org/org-mode.git
	@cd org-mode && make
	@git clone https://github.com/philjackson/magit.git
	@cd magit && make && sudo make install
	@git clone http://github.com/eschulte/auctex.git
	@cd auctex && ./configure && make && sudo make install
	@rm -fr auctex org-mode magit
	@touch u_sudo

clean:
	@rm u_js u_ruby u_git u_misc
