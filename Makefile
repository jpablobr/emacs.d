### Makefile --- jpablobr emacs.d Makefile

## Author: xjpablobrx@gmail.com
## Version: $Id: Makefile,v 0.0 2011/04/26 15:26:45 jpablobr Exp $

user_home  = ~
emacs_dir  = $(user_home)/.emacs.d
vendor_dir = $(emacs_dir)/vendor
js_dir     = $(vendor_dir)/js

update: u_js

u_js:
		cd $(js_dir) && \
		curl -O https://github.com/mooz/js2-mode/raw/master/js2-mode.el && \
		curl -O https://github.com/defunkt/coffee-mode/raw/master/coffee-mode.el
		touch u_js

clean:
		rm u_js