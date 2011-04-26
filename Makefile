### Makefile --- jpablobr emacs.d Makefile

## Author: xjpablobrx@gmail.com
## Version: $Id: Makefile,v 0.0 2011/04/26 15:26:45 jpablobr Exp $

user_home  = ~
emacs_dir  = $(user_home)/.emacs.d
vendor_dir = $(emacs_dir)/vendor
js-dir     = $(vendor_dir)/js

update: u-js

u-js:
		cd $(js-dir) && \
		curl -O https://github.com/mooz/js2-mode/raw/master/js2-mode.el && \
		curl -O https://github.com/defunkt/coffee-mode/raw/master/coffee-mode.el
		touch u-js

clean:
		rm u-js