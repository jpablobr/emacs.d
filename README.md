# jpablobr .emacs.d #

## INSTALL

Move the resulting directory to ~/.emacs.d
Install the Org-mode submodules with the following

        git clone https://jpablobr@github.com/jpablobr/emacs.d.git
        cd ~/.emacs.d/
        git submodule init
        git submodule update
        build Org-mode
        cd src/org/
        make

Build auctex – for instilllation help see the auctex instillation instructions, auctex requires a working TeX installation
      cd src/auctex
      ./configure && make

## IMPORTANT MODES TO COMPILE

   M-x nxhtmlmaint-start-byte-compilation

   M-x byte-compile js2-mode

   M-x jde-compile-jde

   M-x ecb-byte-compile

### LOOKS

![jpablobr Emacs.d by xjpablobrx, on Flickr](http://farm5.static.flickr.com/4116/4788235562_b6b3e27ff5.jpg)

[jpablobr Emacs.d by xjpablobrx, on Flickr](http://www.flickr.com/photos/30142618@N02/4788235562/)

[Emacs-w3c](http://imgur.com/EbVqd)

[Transparency](http://imgur.com/i1nT4)
