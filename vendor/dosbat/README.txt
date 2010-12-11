dosbat README.txt file
Submit bugs to: glen@organicdesign.org


DOWNLOAD:
=========

Download the latest version of dosbat from:

http://sourceforge.net/projects/dosbat/


INSTALLATION:
=============


XEmacs/Windows (XP)

  - go to your Emacs lisp directory
    cd C:\Program Files\XEmacs\xemacs-packages\lisp

  - make a sub directory: dosbat
    mkdir dosbat

  - unzip dosbat-#-#-#.tar.gz into your new dosbat directory using
    WinZip (or tar/gzip through cygwin)

  - restart emacs

XEmacs/Linux (RedHat 9)

  Note: How do you install this without running as root?  I think you
  can put these files somewhere in your home directory.  The
  instructions below will work, it's just probably not the best way of
  doing things.

  - Change to root
    su root
    (enter root password)

  - go to your XEmacs lisp directory
    cd /usr/share/xemacs/xemacs-packages/lisp

  - make a sub directory: dosbat
    mkdir dosbat

  - add execute and read permissions
    chmod +755 dosbat

  - go to your dosbat directory
    cd dosbat

  - unzip and untar the files
    gunzip /home/yourid/downloads/dosbat-#-#-#.tar.gz
    tar -xf /home/yourid/downloads/dosbat-#-#-#.tar
   
  - add execute and read permissions
    chmod +755 *

  - restart emacs

GNU Emacs/Linux (RedHat 9)
  Note: How do you install this without running as root?  I think you
  can put these files somewhere in your home directory.  The
  instructions below will work, it's just probably not the best way of
  doing things.

  - Change to root
    su root
    (enter root password)

  - go to your XEmacs lisp directory
    cd /usr/share/emacs/21.2/lisp

  - unzip and untar the files
    gunzip /home/yourid/downloads/dosbat-#-#-#.tar.gz
    tar -xf /home/yourid/downloads/dosbat-#-#-#.tar
   
  - add execute and read permissions
    chmod +755 *

  - restart emacs

USAGE:
======

XEmacs:
  - Open a batch file and see the pretty colors.
    C-x C-f fileName

GNU Emacs:
  - Open a batch file
    C-x C-f fileName

  - Load the library
    M-x load-library
    dosbat

  - Turn on bat mode and see the pretty colors.
    M-x bat-mode

TROUBLESHOOTING:
================

No colors:

- Make sure the library is loaded:
  M-x load-library
  dosbat

- Set the editing mode
  M-x dosbat-mode

- Turn on font-lock (if it's off)
  M-x font-lock-mode

- Fontify the buffer
  M-x font-lock-fontify-buffer