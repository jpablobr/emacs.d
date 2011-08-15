<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: anything.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=anything.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: anything.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=anything.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for anything.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=anything.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<br /><span class="specialdays">Republic of Korea, National Day, Liechtenstein, National Day, India, National Day, The Republic of the Congo, Independence Day</span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22anything.el%22">anything.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/anything.el">Download</a></p><pre class="code"><span class="linecomment">;;;; anything.el --- open anything / QuickSilver-like candidate-selection framework</span>

<span class="linecomment">;; Copyright (C) 2007              Tamas Patrovics</span>
<span class="linecomment">;;               2008, 2009, 2010  rubikitch &lt;rubikitch@ruby-lang.org&gt;</span>

<span class="linecomment">;; Author: Tamas Patrovics</span>
<span class="linecomment">;; Maintainer: rubikitch &lt;rubikitch@ruby-lang.org&gt;</span>
<span class="linecomment">;; Keywords: files, frames, help, matching, outlines, processes, tools, convenience, anything</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/download/anything.el</span>
<span class="linecomment">;; Site: http://www.emacswiki.org/cgi-bin/emacs/Anything</span>
(defvar anything-version nil)
(setq anything-version "<span class="quote">1.287</span>")

<span class="linecomment">;; This file is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This file is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>

<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with GNU Emacs; see the file COPYING.  If not, write to the</span>
<span class="linecomment">;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,</span>
<span class="linecomment">;; Boston, MA 02110-1301, USA.</span>

<span class="linecomment">;;; Commentary:</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; Start with M-x anything, narrow the list by typing some pattern,</span>
<span class="linecomment">;; select with up/down/pgup/pgdown/C-p/C-n/C-v/M-v, choose with enter,</span>
<span class="linecomment">;; left/right moves between sources. With TAB actions can be selected</span>
<span class="linecomment">;; if the selected candidate has more than one possible action.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Note that anything.el provides only the framework and some example</span>
<span class="linecomment">;; configurations for demonstration purposes. See anything-config.el</span>
<span class="linecomment">;; for practical, polished, easy to use configurations which can be</span>
<span class="linecomment">;; used to assemble a custom personalized configuration. And many</span>
<span class="linecomment">;; other configurations are in the EmacsWiki.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/wiki/download/anything-config.el</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/emacs/AnythingSources</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Maintainer's configuration is in the EmacsWiki. It would tell you</span>
<span class="linecomment">;; many tips to write smart sources!</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/emacs/RubikitchAnythingConfiguration</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Here is Japanese translation of `anything-sources' attributes. Thanks.</span>
<span class="linecomment">;; http://d.hatena.ne.jp/sirocco634/20091012/1255336649</span>

<span class="linecomment">;;; Bug Report:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; If you have problems, send a bug report via C-c C-x C-b in anything session (best)</span>
<span class="linecomment">;; or M-x anything-send-bug-report outside anything session.</span>
<span class="linecomment">;; I implemented bug report feature because I want to know your current state.</span>
<span class="linecomment">;; It helps me to solve problems easily.</span>
<span class="linecomment">;; The step is:</span>
<span class="linecomment">;;  0) Setup mail in Emacs, the easiest way is:</span>
<span class="linecomment">;;       (setq user-mail-address "your@mail.address")</span>
<span class="linecomment">;;       (setq user-full-name "Your Full Name")</span>
<span class="linecomment">;;       (setq smtpmail-smtp-server "your.smtp.server.jp")</span>
<span class="linecomment">;;       (setq mail-user-agent 'message-user-agent)</span>
<span class="linecomment">;;       (setq message-send-mail-function 'message-smtpmail-send-it)</span>
<span class="linecomment">;;  1) Be sure to use the LATEST version of anything.el.</span>
<span class="linecomment">;;  2) Enable debugger. M-x toggle-debug-on-error or (setq debug-on-error t)</span>
<span class="linecomment">;;  3) Use Lisp version instead of compiled one: (load "anything.el")</span>
<span class="linecomment">;;  4) Do it!</span>
<span class="linecomment">;;  5) If you got an error, please do not close *Backtrace* buffer.</span>
<span class="linecomment">;;  6) Type C-c C-x C-b (anything session, best!) </span>
<span class="linecomment">;;     or M-x anything-send-bug-report (outside)</span>
<span class="linecomment">;;     then M-x insert-buffer *Backtrace* (if you got error)</span>
<span class="linecomment">;;  7) Describe the bug using a precise recipe.</span>
<span class="linecomment">;;  8) Type C-c C-c to send.</span>
<span class="linecomment">;;  # If you are a Japanese, please write in Japanese:-)</span>


<span class="linecomment">;;; Commands:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Below are complete command list:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `anything-open-last-log'</span>
<span class="linecomment">;;    Open anything log file of last anything session.</span>
<span class="linecomment">;;  `anything'</span>
<span class="linecomment">;;    Select anything. In Lisp program, some optional arguments can be used.</span>
<span class="linecomment">;;  `anything-resume'</span>
<span class="linecomment">;;    Resurrect previously invoked `anything'.</span>
<span class="linecomment">;;  `anything-at-point'</span>
<span class="linecomment">;;    Same as `anything' except when C-u is pressed, the initial input is the symbol at point.</span>
<span class="linecomment">;;  `anything-force-update'</span>
<span class="linecomment">;;    Recalculate and update candidates.</span>
<span class="linecomment">;;  `anything-select-action'</span>
<span class="linecomment">;;    Select an action for the currently selected candidate.</span>
<span class="linecomment">;;  `anything-previous-line'</span>
<span class="linecomment">;;    Move selection to the previous line.</span>
<span class="linecomment">;;  `anything-next-line'</span>
<span class="linecomment">;;    Move selection to the next line.</span>
<span class="linecomment">;;  `anything-previous-page'</span>
<span class="linecomment">;;    Move selection back with a pageful.</span>
<span class="linecomment">;;  `anything-next-page'</span>
<span class="linecomment">;;    Move selection forward with a pageful.</span>
<span class="linecomment">;;  `anything-beginning-of-buffer'</span>
<span class="linecomment">;;    Move selection at the top.</span>
<span class="linecomment">;;  `anything-end-of-buffer'</span>
<span class="linecomment">;;    Move selection at the bottom.</span>
<span class="linecomment">;;  `anything-previous-source'</span>
<span class="linecomment">;;    Move selection to the previous source.</span>
<span class="linecomment">;;  `anything-next-source'</span>
<span class="linecomment">;;    Move selection to the next source.</span>
<span class="linecomment">;;  `anything-select-with-prefix-shortcut'</span>
<span class="linecomment">;;    Invoke default action with prefix shortcut.</span>
<span class="linecomment">;;  `anything-select-with-digit-shortcut'</span>
<span class="linecomment">;;    Invoke default action with digit/alphabet shortcut.</span>
<span class="linecomment">;;  `anything-exit-minibuffer'</span>
<span class="linecomment">;;    Select the current candidate by exiting the minibuffer.</span>
<span class="linecomment">;;  `anything-keyboard-quit'</span>
<span class="linecomment">;;    Quit minibuffer in anything.</span>
<span class="linecomment">;;  `anything-help'</span>
<span class="linecomment">;;    Help of `anything'.</span>
<span class="linecomment">;;  `anything-debug-output'</span>
<span class="linecomment">;;    Show all anything-related variables at this time.</span>
<span class="linecomment">;;  `anything-delete-current-selection'</span>
<span class="linecomment">;;    Delete the currently selected item.</span>
<span class="linecomment">;;  `anything-delete-minibuffer-contents'</span>
<span class="linecomment">;;    Same as `delete-minibuffer-contents' but this is a command.</span>
<span class="linecomment">;;  `anything-toggle-resplit-window'</span>
<span class="linecomment">;;    Toggle resplit anything window, vertically or horizontally.</span>
<span class="linecomment">;;  `anything-select-2nd-action'</span>
<span class="linecomment">;;    Select the 2nd action for the currently selected candidate.</span>
<span class="linecomment">;;  `anything-select-3rd-action'</span>
<span class="linecomment">;;    Select the 3rd action for the currently selected candidate.</span>
<span class="linecomment">;;  `anything-select-4th-action'</span>
<span class="linecomment">;;    Select the 4th action for the currently selected candidate.</span>
<span class="linecomment">;;  `anything-select-2nd-action-or-end-of-line'</span>
<span class="linecomment">;;    Select the 2nd action for the currently selected candidate if the point is at the end of minibuffer.</span>
<span class="linecomment">;;  `anything-execute-persistent-action'</span>
<span class="linecomment">;;    If a candidate is selected then perform the associated action without quitting anything.</span>
<span class="linecomment">;;  `anything-scroll-other-window'</span>
<span class="linecomment">;;    Scroll other window (not *Anything* window) upward.</span>
<span class="linecomment">;;  `anything-scroll-other-window-down'</span>
<span class="linecomment">;;    Scroll other window (not *Anything* window) downward.</span>
<span class="linecomment">;;  `anything-toggle-visible-mark'</span>
<span class="linecomment">;;    Toggle anything visible mark at point.</span>
<span class="linecomment">;;  `anything-display-all-visible-marks'</span>
<span class="linecomment">;;    Show all `anything' visible marks strings.</span>
<span class="linecomment">;;  `anything-next-visible-mark'</span>
<span class="linecomment">;;    Move next anything visible mark.</span>
<span class="linecomment">;;  `anything-prev-visible-mark'</span>
<span class="linecomment">;;    Move previous anything visible mark.</span>
<span class="linecomment">;;  `anything-quit-and-find-file'</span>
<span class="linecomment">;;    Drop into `find-file' from `anything' like `iswitchb-find-file'.</span>
<span class="linecomment">;;  `anything-yank-selection'</span>
<span class="linecomment">;;    Set minibuffer contents to current selection.</span>
<span class="linecomment">;;  `anything-kill-selection-and-quit'</span>
<span class="linecomment">;;    Store current selection to kill ring.</span>
<span class="linecomment">;;  `anything-follow-mode'</span>
<span class="linecomment">;;    If this mode is on, persistent action is executed everytime the cursor is moved.</span>
<span class="linecomment">;;  `anything-migrate-sources'</span>
<span class="linecomment">;;    Help to migrate to new `anything' way.</span>
<span class="linecomment">;;  `anything-isearch'</span>
<span class="linecomment">;;    Start incremental search within results. (UNMAINTAINED)</span>
<span class="linecomment">;;  `anything-isearch-printing-char'</span>
<span class="linecomment">;;    Add printing char to the pattern.</span>
<span class="linecomment">;;  `anything-isearch-again'</span>
<span class="linecomment">;;    Search again for the current pattern</span>
<span class="linecomment">;;  `anything-isearch-delete'</span>
<span class="linecomment">;;    Undo last event.</span>
<span class="linecomment">;;  `anything-isearch-default-action'</span>
<span class="linecomment">;;    Execute the default action for the selected candidate.</span>
<span class="linecomment">;;  `anything-isearch-select-action'</span>
<span class="linecomment">;;    Choose an action for the selected candidate.</span>
<span class="linecomment">;;  `anything-isearch-cancel'</span>
<span class="linecomment">;;    Cancel Anything isearch.</span>
<span class="linecomment">;;  `anything-iswitchb-setup'</span>
<span class="linecomment">;;    Integrate anything completion into iswitchb (UNMAINTAINED).</span>
<span class="linecomment">;;  `anything-iswitchb-cancel-anything'</span>
<span class="linecomment">;;    Cancel anything completion and return to standard iswitchb.</span>
<span class="linecomment">;;  `anything-describe-anything-attribute'</span>
<span class="linecomment">;;    Display the full documentation of ANYTHING-ATTRIBUTE (a symbol).</span>
<span class="linecomment">;;  `anything-send-bug-report'</span>
<span class="linecomment">;;    Send a bug report of anything.el.</span>
<span class="linecomment">;;  `anything-send-bug-report-from-anything'</span>
<span class="linecomment">;;    Send a bug report of anything.el in anything session.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Customizable Options:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Below are customizable option list:</span>
<span class="linecomment">;;</span>

<span class="linecomment">;; You can extend `anything' by writing plug-ins. As soon as</span>
<span class="linecomment">;; `anything' is invoked, `anything-sources' is compiled into basic</span>
<span class="linecomment">;; attributes, then compiled one is used during invocation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; The oldest built-in plug-in is `type' attribute: appends</span>
<span class="linecomment">;; appropriate element of `anything-type-attributes'. Second built-in</span>
<span class="linecomment">;; plug-in is `candidates-in-buffer': selecting a line from candidates</span>
<span class="linecomment">;; buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; To write a plug-in:</span>
<span class="linecomment">;; 1. Define a compiler: anything-compile-source--*</span>
<span class="linecomment">;; 2. Add compier function to `anything-compile-source-functions'.</span>
<span class="linecomment">;; 3. (optional) Write helper functions.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Anything plug-ins are found in the EmacsWiki.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/emacs/AnythingPlugins</span>

<span class="linecomment">;; Tested on Emacs 22/23.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Vagn Johansen for ideas.</span>
<span class="linecomment">;; Thanks to Stefan Kamphausen for fixes and XEmacs support.</span>
<span class="linecomment">;; Thanks to Tassilo Horn for fixes.</span>
<span class="linecomment">;; Thanks to Drew Adams for various fixes (frame, isearch, customization, etc.)</span>
<span class="linecomment">;; Thanks to IMAKADO for candidates-in-buffer idea.</span>
<span class="linecomment">;; Thanks to Tomohiro MATSUYAMA for multiline patch.</span>
<span class="linecomment">;;</span>

<span class="linecomment">;;; (@* "Index")</span>

<span class="linecomment">;;  If you have library `linkd.el', load</span>
<span class="linecomment">;;  `linkd.el' and turn on `linkd-mode' now.  It lets you easily</span>
<span class="linecomment">;;  navigate around the sections  Linkd mode will</span>
<span class="linecomment">;;  highlight this Index.  You can get `linkd.el' here:</span>
<span class="linecomment">;;  http://www.emacswiki.org/cgi-bin/wiki/download/linkd.el</span>
<span class="linecomment">;;</span>


<span class="linecomment">;;; (@* "INCOMPATIBLE CHANGES")</span>

<span class="linecomment">;; v1.277</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;   Default setting of `anything-save-configuration-functions' is changed.</span>
<span class="linecomment">;;   Anything saves/restores window configuration instead of frame configuration now.</span>
<span class="linecomment">;;   The default is changed because flickering is occurred in some environment.</span>
<span class="linecomment">;;   </span>
<span class="linecomment">;;   If you want to save and restore frame configuration, set this variable to</span>
<span class="linecomment">;;    '(set-frame-configuration . current-frame-configuration)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; v1.276</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   Fitting frame is disabled by default, because some flickering occurred</span>
<span class="linecomment">;;   in some environment.  To enable fitting, set both</span>
<span class="linecomment">;;   `anything-inhibit-fit-frame-flag' and `fit-frame-inhibit-fitting' to</span>
<span class="linecomment">;;   nil.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; v1.114</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `anything-attr' returns nil when the source attribute is defined</span>
<span class="linecomment">;;   but the value of attribute is nil, eg. (volatile) cell. Use</span>
<span class="linecomment">;;   `anything-attr-defined' when testing whether the attribute is</span>
<span class="linecomment">;;   defined.</span>

<span class="linecomment">;;; (@* "Tips")</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything' accepts keyword arguments. See docstring.</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything)</span>

<span class="linecomment">;; </span>
<span class="linecomment">;; `anything-enable-shortcuts' enables us to select candidate easily.</span>
<span class="linecomment">;; If 'prefix then they can be selected using &lt;prefix-key&gt; &lt;alnum&gt;. </span>
<span class="linecomment">;; The prefix key is `anything-select-with-prefix-shortcut'.</span>
<span class="linecomment">;; If the &lt;prefix-key&gt; is a letter, pressing twice inputs the letter itself.</span>
<span class="linecomment">;; e.g.</span>
<span class="linecomment">;;  (setq anything-enable-shortcuts 'prefix)</span>
<span class="linecomment">;;  (define-key anything-map \"@\" 'anything-select-with-prefix-shortcut)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; You can edit current selection using `anything-edit-current-selection'.</span>
<span class="linecomment">;; It is useful after persistent-action.</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; For `anything' users, setting `anything-sources' directly and</span>
<span class="linecomment">;; invoke M-x anything is obsolete way for now. Try M-x</span>
<span class="linecomment">;; `anything-migrate-sources'!</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; If you want to create anything sources, yasnippet would help you.</span>
<span class="linecomment">;; http://yasnippet.googlecode.com/</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Then get the snippet from</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/wiki/download/anything-source.yasnippet</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Put it in ~/.emacs.d/plugins/yasnippet/snippets/text-mode/emacs-lisp-mode/</span>


<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-interpret-value' is useful function to interpret value</span>
<span class="linecomment">;; like `candidates' attribute.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; (anything-interpret-value "literal")            ; =&gt; "literal"</span>
<span class="linecomment">;; (anything-interpret-value (lambda () "lambda")) ; =&gt; "lambda"</span>
<span class="linecomment">;; (let ((source '((name . "lambda with source name"))))</span>
<span class="linecomment">;;   (anything-interpret-value</span>
<span class="linecomment">;;    (lambda () anything-source-name)</span>
<span class="linecomment">;;    source))                             ; =&gt; "lambda with source name"</span>
<span class="linecomment">;; (flet ((f () "function symbol"))</span>
<span class="linecomment">;;   (anything-interpret-value 'f))        ; =&gt; "function symbol"</span>
<span class="linecomment">;; (let ((v "variable symbol"))</span>
<span class="linecomment">;;   (anything-interpret-value 'v))        ; =&gt; "variable symbol"</span>
<span class="linecomment">;; (anything-interpret-value 'unbounded-1) ; error</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; Now symbols are acceptable as candidates. So you do not have to use</span>
<span class="linecomment">;; `symbol-name' function. The source is much simpler. For example,</span>
<span class="linecomment">;; `apropos-internal' returns a list of symbols.</span>
<span class="linecomment">;; </span>
<span class="linecomment">;;   (anything</span>
<span class="linecomment">;;    '(((name . "Commands")</span>
<span class="linecomment">;;       (candidates . (lambda () (apropos-internal anything-pattern 'commandp)))</span>
<span class="linecomment">;;       (volatile)</span>
<span class="linecomment">;;       (action . describe-function))))</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; To mark a candidate, press C-SPC as normal Emacs marking. To go to</span>
<span class="linecomment">;; marked candidate, press M-[ or M-].</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-map' is now Emacs-standard key bindings by default. If</span>
<span class="linecomment">;; you are using `iswitchb', execute `anything-iswitchb-setup'. Then</span>
<span class="linecomment">;; some key bindings are adjusted to `iswitchb'. Note that</span>
<span class="linecomment">;; anything-iswitchb is not maintained.</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; There are many `anything' applications, using `anything' for</span>
<span class="linecomment">;; selecting candidate. In this case, if there is one candidate or no</span>
<span class="linecomment">;; candidate, popping up *anything* buffer is irritating. If one</span>
<span class="linecomment">;; candidate, you want to select it at once. If no candidate, you want</span>
<span class="linecomment">;; to quit `anything'. Set `anything-execute-action-at-once-if-one'</span>
<span class="linecomment">;; and `anything-quit-if-no-candidate' to non-nil to remedy it. Note</span>
<span class="linecomment">;; that setting these variables GLOBALLY is bad idea because of</span>
<span class="linecomment">;; delayed sources. These are meant to be let-binded.</span>
<span class="linecomment">;; See anything-etags.el for example.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/anything-etags.el")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; ex.</span>
<span class="linecomment">;; (let ((anything-execute-action-at-once-if-one t)</span>
<span class="linecomment">;;       (anything-quit-if-no-candidate (lambda () (message "No candidate"))))</span>
<span class="linecomment">;;    (anything temporary-sources input))</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `set-frame-configuration' arises flickering. If you hate</span>
<span class="linecomment">;; flickering, eval:</span>
<span class="linecomment">;; (setq anything-save-configuration-functions</span>
<span class="linecomment">;;    '(set-window-configuration . current-window-configuration))</span>
<span class="linecomment">;; at the cost of restoring frame configuration (only window configuration).</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-delete-current-selection' deletes the current line.</span>
<span class="linecomment">;; It is useful when deleting a candidate in persistent action.</span>
<span class="linecomment">;; eg. `kill-buffer'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-delete-current-selection)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-attr' gets the attribute. `anything-attrset' sets the</span>
<span class="linecomment">;; attribute. `anything-attr-defined' tests whether the attribute is</span>
<span class="linecomment">;; defined. They handles source-local variables.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-attr)</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-attrset)</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-attr-defined)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-sources' accepts many attributes to make your life easier.</span>
<span class="linecomment">;; Now `anything-sources' accepts a list of symbols.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-variable 'anything-sources)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything' has optional arguments. Now you do not have to let-bind</span>
<span class="linecomment">;; `anything-sources'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-resume' resumes last `anything' session. Now you do not</span>
<span class="linecomment">;; have to retype pattern.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-resume)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-execute-persistent-action' executes action without</span>
<span class="linecomment">;; quitting `anything'. When popping up a buffer in other window by</span>
<span class="linecomment">;; persistent action, you can scroll with `anything-scroll-other-window' and</span>
<span class="linecomment">;; `anything-scroll-other-window-down'. See also `anything-sources' docstring.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-execute-persistent-action)</span>
<span class="linecomment">;; [EVAL IT] (describe-variable 'anything-sources)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-select-2nd-action', `anything-select-3rd-action' and</span>
<span class="linecomment">;; `anything-select-4th-action' select other than default action</span>
<span class="linecomment">;; without pressing Tab.</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; Using `anything-candidate-buffer' and the candidates-in-buffer</span>
<span class="linecomment">;; attribute is much faster than traditional "candidates and match"</span>
<span class="linecomment">;; way. And `anything-current-buffer-is-modified' avoids to</span>
<span class="linecomment">;; recalculate candidates for unmodified buffer. See docstring of</span>
<span class="linecomment">;; them.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-candidate-buffer)</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-candidates-in-buffer)</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-current-buffer-is-modified)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-current-buffer' and `anything-buffer-file-name' stores</span>
<span class="linecomment">;; `(current-buffer)' and `buffer-file-name' in the buffer `anything'</span>
<span class="linecomment">;; is invoked. Use them freely.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-variable 'anything-current-buffer)</span>
<span class="linecomment">;; [EVAL IT] (describe-variable 'anything-buffer-file-name)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-completing-read' and `anything-read-file-name' are</span>
<span class="linecomment">;; experimental implementation. If you are curious, type M-x</span>
<span class="linecomment">;; anything-read-string-mode. It is a minor mode and toggles on/off.</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; Use `anything-test-candidates' to test your handmade anything</span>
<span class="linecomment">;; sources. It simulates contents of *anything* buffer with pseudo</span>
<span class="linecomment">;; `anything-sources' and `anything-pattern', without side-effect. So</span>
<span class="linecomment">;; you can unit-test your anything sources! Let's TDD!</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-test-candidates)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; There are many unit-testing framework in Emacs Lisp. See the EmacsWiki.</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/emacs/UnitTesting</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; There is an unit-test by Emacs Lisp Expectations at the tail of this file.</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/wiki/download/el-expectations.el</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/wiki/download/el-mock.el</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; If you want to create anything sources, see anything-config.el.</span>
<span class="linecomment">;; It is huge collection of sources. You can learn from examples.</span>


<span class="linecomment">;; (@* "TODO")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - process status indication</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - async sources doesn't honor digit-shortcut-count</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - anything-candidate-number-limit can't be nil everywhere</span>

<span class="linecomment">;; (@* "HISTORY")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Change log of this file is found at</span>
<span class="linecomment">;;  http://repo.or.cz/w/anything-config.git/history/master:/anything.el</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Change log of this project is found at</span>
<span class="linecomment">;;  http://repo.or.cz/w/anything-config.git?a=shortlog</span>

(require 'cl)
<span class="linecomment">;; (require 'anything-match-plugin nil t)</span>

<span class="linecomment">;; (@* "User Configuration")</span>

<span class="linecomment">;; This is only an example. Customize it to your own taste!</span>
(defvar anything-sources
  `(((name . "<span class="quote">Buffers</span>")
     (candidates
      . (lambda ()
          (remove-if (lambda (name)
                       (or (equal name anything-buffer)
                           (eq ?\  (aref name 0))))
                     (mapcar 'buffer-name (buffer-list)))))
     (type . buffer))

    ((name . "<span class="quote">File Name History</span>")
     (candidates . file-name-history)
     (match (lambda (candidate)
              <span class="linecomment">;; list basename matches first</span>
              (string-match 
               anything-pattern 
               (file-name-nondirectory candidate)))

            (lambda (candidate)                                     
              <span class="linecomment">;; and then directory part matches</span>
              (let ((dir (file-name-directory candidate)))
                (if dir
                    (string-match anything-pattern dir)))))
     (type . file))

    ((name . "<span class="quote">Files from Current Directory</span>")
     (init . (lambda ()
               (setq anything-default-directory
                     default-directory)))
     (candidates . (lambda ()
                     (directory-files
                      anything-default-directory)))
     (type . file))

    ((name . "<span class="quote">Complex Command History</span>")
     (candidates . (lambda ()
                     (mapcar 'prin1-to-string
                             command-history)))
     (action . (("<span class="quote">Repeat Complex Command</span>" . 
                 (lambda (c)
                   (eval (read c))))))
     (delayed)))
  "<span class="quote">The source of candidates for anything.
It accepts symbols:
 (setq anything-sources (list anything-c-foo anything-c-bar))
can be written as
 (setq anything-sources '(anything-c-foo anything-c-bar))
The latter is recommended because if you change anything-c-* variable,
you do not have to update `anything-sources'.

You are STRONGLY recommended to define a command which calls
`anything' or `anything-other-buffer' with argument rather than
to set `anything-sources' externally.

If you want to change `anything-sources' during `anything' invocation,
use `anything-set-sources', never use `setq'.

Attributes:

</span>")


<span class="linecomment">;; This value is only provided as an example. Customize it to your own</span>
<span class="linecomment">;; taste!</span>
(defvar anything-type-attributes
  '((file (action . (("<span class="quote">Find File</span>" . find-file)
                     ("<span class="quote">Delete File</span>" .
                      (lambda (file)
                        (if (y-or-n-p (format "<span class="quote">Really delete file %s? </span>" file))
                            (delete-file file)))))))
    (buffer (action . (("<span class="quote">Switch to Buffer</span>" . switch-to-buffer)
                       ("<span class="quote">Pop to Buffer</span>"    . pop-to-buffer)
                       ("<span class="quote">Display Buffer</span>"   . display-buffer)
                       ("<span class="quote">Kill Buffer</span>"      . kill-buffer)))))
  "<span class="quote">It's a list of (TYPE ATTRIBUTES ...). ATTRIBUTES are the same
  as attributes for `anything-sources'. TYPE connects the value
  to the appropriate sources in `anything-sources'.

  This allows specifying common attributes for several
  sources. For example, sources which provide files can specify
  common attributes with a `file' type.</span>")


(defvaralias 'anything-enable-digit-shortcuts 'anything-enable-shortcuts
  "<span class="quote">Alphabet shortcuts are usable now. Then `anything-enable-digit-shortcuts' should be renamed.
`anything-enable-digit-shortcuts' is retained for compatibility.</span>")
(defvar anything-enable-shortcuts nil
  "<span class="quote">*Whether to use digit/alphabet shortcut to select the first nine matches.
If t then they can be selected using Ctrl+&lt;number&gt;.

If 'prefix then they can be selected using &lt;prefix-key&gt; &lt;alnum&gt;. 
The prefix key is `anything-select-with-prefix-shortcut'.
If the &lt;prefix-key&gt; is a letter, pressing twice inputs the letter itself.
e.g.
 (setq anything-enable-shortcuts 'prefix)
 (define-key anything-map \"@\" 'anything-select-with-prefix-shortcut)
 
If 'alphabet then they can be selected using Shift+&lt;alphabet&gt; (deprecated).
It is not recommended because you cannot input capital letters in pattern.

Keys (digit/alphabet) are listed in `anything-shortcut-keys-alist'.</span>")

(defvar anything-shortcut-keys-alist
  '((alphabet . "<span class="quote">asdfghjklzxcvbnmqwertyuiop</span>")
    (prefix   . "<span class="quote">asdfghjklzxcvbnmqwertyuiop1234567890</span>")
    (t        . "<span class="quote">123456789</span>")))

(defvar anything-display-source-at-screen-top t
  "<span class="quote">*If t, `anything-next-source' and `anything-previous-source'
  display candidates at the top of screen.</span>")

(defvar anything-candidate-number-limit 50
  "<span class="quote">*Do not show more candidates than this limit from individual
  sources. It is usually pointless to show hundreds of matches
  when the pattern is empty, because it is much simpler to type a
  few characters to narrow down the list of potential candidates.

  Set it to nil if you don't want this limit.</span>")


(defvar anything-idle-delay 0.5
  "<span class="quote">*The user has to be idle for this many seconds, before
  candidates from delayed sources are collected. This is useful
  for sources involving heavy operations (like launching external
  programs), so that candidates from the source are not retrieved
  unnecessarily if the user keeps typing.

  It also can be used to declutter the results anything displays,
  so that results from certain sources are not shown with every
  character typed, only if the user hesitates a bit.</span>")


(defvar anything-input-idle-delay 0.1
  "<span class="quote">The user has to be idle for this many seconds, before ALL candidates are collected.
Unlink `anything-input-idle', it is also effective for non-delayed sources.
If nil, candidates are collected immediately. </span>")


(defvar anything-samewindow nil
  "<span class="quote">If t then Anything doesn't pop up a new window, it uses the
current window to show the candidates.</span>")


(defvar anything-source-filter nil
  "<span class="quote">A list of source names to be displayed. Other sources won't
appear in the search results. If nil then there is no filtering.
See also `anything-set-source-filter'.</span>")


(defvar anything-map
  (let ((map (copy-keymap minibuffer-local-map)))
    (define-key map (kbd "<span class="quote">&lt;down&gt;</span>") 'anything-next-line)
    (define-key map (kbd "<span class="quote">&lt;up&gt;</span>") 'anything-previous-line)
    (define-key map (kbd "<span class="quote">C-n</span>")     'anything-next-line)
    (define-key map (kbd "<span class="quote">C-p</span>")     'anything-previous-line)
    (define-key map (kbd "<span class="quote">&lt;prior&gt;</span>") 'anything-previous-page)
    (define-key map (kbd "<span class="quote">&lt;next&gt;</span>") 'anything-next-page)
    (define-key map (kbd "<span class="quote">M-v</span>")     'anything-previous-page)
    (define-key map (kbd "<span class="quote">C-v</span>")     'anything-next-page)
    (define-key map (kbd "<span class="quote">M-&lt;</span>")     'anything-beginning-of-buffer)
    (define-key map (kbd "<span class="quote">M-&gt;</span>")     'anything-end-of-buffer)
    (define-key map (kbd "<span class="quote">C-g</span>")     'anything-keyboard-quit)
    (define-key map (kbd "<span class="quote">&lt;right&gt;</span>") 'anything-next-source)
    (define-key map (kbd "<span class="quote">&lt;left&gt;</span>") 'anything-previous-source)
    (define-key map (kbd "<span class="quote">&lt;RET&gt;</span>") 'anything-exit-minibuffer)
    (define-key map (kbd "<span class="quote">C-1</span>") 'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-2</span>") 'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-3</span>") 'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-4</span>") 'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-5</span>") 'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-6</span>") 'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-7</span>") 'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-8</span>") 'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-9</span>") 'anything-select-with-digit-shortcut)
    (loop for c from ?A to ?Z do
          (define-key map (make-string 1 c) 'anything-select-with-digit-shortcut))
    (define-key map (kbd "<span class="quote">C-i</span>") 'anything-select-action)
    (define-key map (kbd "<span class="quote">C-z</span>") 'anything-execute-persistent-action)
    (define-key map (kbd "<span class="quote">C-e</span>") 'anything-select-2nd-action-or-end-of-line)
    (define-key map (kbd "<span class="quote">C-j</span>") 'anything-select-3rd-action)
    (define-key map (kbd "<span class="quote">C-o</span>") 'anything-next-source)
    (define-key map (kbd "<span class="quote">C-M-v</span>") 'anything-scroll-other-window)
    (define-key map (kbd "<span class="quote">M-&lt;next&gt;</span>") 'anything-scroll-other-window)
    (define-key map (kbd "<span class="quote">C-M-y</span>") 'anything-scroll-other-window-down)
    (define-key map (kbd "<span class="quote">C-M-S-v</span>") 'anything-scroll-other-window-down)
    (define-key map (kbd "<span class="quote">M-&lt;prior&gt;</span>") 'anything-scroll-other-window-down)
    (define-key map (kbd "<span class="quote">C-SPC</span>") 'anything-toggle-visible-mark)
    (define-key map (kbd "<span class="quote">M-[</span>") 'anything-prev-visible-mark)
    (define-key map (kbd "<span class="quote">M-]</span>") 'anything-next-visible-mark)
    (define-key map (kbd "<span class="quote">C-k</span>") 'anything-delete-minibuffer-contents)

    (define-key map (kbd "<span class="quote">C-s</span>") 'anything-isearch)
    (define-key map (kbd "<span class="quote">C-r</span>") 'undefined)
    (define-key map (kbd "<span class="quote">C-t</span>") 'anything-toggle-resplit-window)
    (define-key map (kbd "<span class="quote">C-x C-f</span>") 'anything-quit-and-find-file)

    (define-key map (kbd "<span class="quote">C-c C-d</span>") 'anything-delete-current-selection)
    (define-key map (kbd "<span class="quote">C-c C-y</span>") 'anything-yank-selection)
    (define-key map (kbd "<span class="quote">C-c C-k</span>") 'anything-kill-selection-and-quit)
    (define-key map (kbd "<span class="quote">C-c C-f</span>") 'anything-follow-mode)
    (define-key map (kbd "<span class="quote">C-c C-u</span>") 'anything-force-update)

    <span class="linecomment">;; Debugging command</span>
    (define-key map "<span class="quote">\C-c\C-x\C-d</span>" 'anything-debug-output)
    (define-key map "<span class="quote">\C-c\C-x\C-m</span>" 'anything-display-all-visible-marks)
    (define-key map "<span class="quote">\C-c\C-x\C-b</span>" 'anything-send-bug-report-from-anything)
    <span class="linecomment">;; Use `describe-mode' key in `global-map'</span>
    (dolist (k (where-is-internal 'describe-mode global-map))
      (define-key map k 'anything-help))
    <span class="linecomment">;; the defalias is needed because commands are bound by name when</span>
    <span class="linecomment">;; using iswitchb, so only commands having the prefix anything-</span>
    <span class="linecomment">;; get rebound</span>
    (defalias 'anything-previous-history-element 'previous-history-element)
    (defalias 'anything-next-history-element 'next-history-element)
    (define-key map (kbd "<span class="quote">M-p</span>") 'anything-previous-history-element)
    (define-key map (kbd "<span class="quote">M-n</span>") 'anything-next-history-element)
    map)
  "<span class="quote">Keymap for anything.

If you execute `anything-iswitchb-setup', some keys are modified.
See `anything-iswitchb-setup-keys'.</span>")

(defvar anything-isearch-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map (current-global-map))
    (define-key map (kbd "<span class="quote">&lt;return&gt;</span>") 'anything-isearch-default-action)
    (define-key map (kbd "<span class="quote">&lt;RET&gt;</span>") 'anything-isearch-default-action)
    (define-key map (kbd "<span class="quote">C-i</span>") 'anything-isearch-select-action)
    (define-key map (kbd "<span class="quote">C-g</span>") 'anything-isearch-cancel)
    (define-key map (kbd "<span class="quote">M-s</span>") 'anything-isearch-again)
    (define-key map (kbd "<span class="quote">&lt;backspace&gt;</span>") 'anything-isearch-delete)
    <span class="linecomment">;; add printing chars</span>
    (loop for i from 32 below 256 do
          (define-key map (vector i) 'anything-isearch-printing-char))
    map)
  "<span class="quote">Keymap for anything incremental search.</span>")


(defgroup anything nil
  "<span class="quote">Open anything.</span>" :prefix "<span class="quote">anything-</span>" :group 'convenience)

(defface anything-header 
  '((t (:inherit header-line))) 
  "<span class="quote">Face for header lines in the anything buffer.</span>" :group 'anything)

(defvar anything-header-face 'anything-header
  "<span class="quote">Face for header lines in the anything buffer.</span>")

(defface anything-isearch-match '((t (:background "<span class="quote">Yellow</span>")))
  "<span class="quote">Face for isearch in the anything buffer.</span>" :group 'anything)

(defvar anything-isearch-match-face 'anything-isearch-match
  "<span class="quote">Face for matches during incremental search.</span>")

(defvar anything-selection-face 'highlight
  "<span class="quote">Face for currently selected item.</span>")

(defvar anything-iswitchb-idle-delay 1
  "<span class="quote">Show anything completions if the user is idle that many
  seconds after typing.</span>")

(defvar anything-iswitchb-dont-touch-iswithcb-keys nil
  "<span class="quote">If t then those commands are not bound from `anything-map'
  under iswitchb which would override standard iswithcb keys.

This allows an even more seamless integration with iswitchb for
those who prefer using iswitchb bindings even if the anything
completions buffer is popped up.

Note that you can bind alternative keys for the same command in
`anything-map', so that you can use different keys for anything
under iswitchb. For example, I bind the character \ to
`anything-exit-minibuffer' which key is just above Enter on my
keyboard. This way I can switch buffers with Enter and choose
anything completions with \.</span>")

<span class="linecomment">;;----------------------------------------------------------------------</span>

(defvar anything-buffer "<span class="quote">*anything*</span>"
  "<span class="quote">Buffer showing completions.</span>")

(defvar anything-action-buffer "<span class="quote">*anything action*</span>"
  "<span class="quote">Buffer showing actions.</span>")

(defvar anything-selection-overlay nil
  "<span class="quote">Overlay used to highlight the currently selected item.</span>")

(defvar anything-isearch-overlay nil
  "<span class="quote">Overlay used to highlight the current match during isearch.</span>")

(defvar anything-digit-overlays nil
  "<span class="quote">Overlays for digit shortcuts. See `anything-enable-shortcuts'.</span>")

(defvar anything-candidate-cache nil
  "<span class="quote">Holds the available candidate withing a single anything invocation.</span>")

(defvar anything-pattern
  "<span class="quote">The input pattern used to update the anything buffer.</span>")

(defvar anything-input
  "<span class="quote">The input typed in the candidates panel.</span>")

(defvar anything-async-processes nil
  "<span class="quote">List of information about asynchronous processes managed by anything.</span>")

(defvar anything-digit-shortcut-count 0
  "<span class="quote">Number of digit shortcuts shown in the anything buffer.</span>")

(defvar anything-before-initialize-hook nil
  "<span class="quote">Run before anything initialization.
This hook is run before init functions in `anything-sources'.</span>")

(defvar anything-after-initialize-hook nil
  "<span class="quote">Run after anything initialization.
Global variables are initialized and the anything buffer is created.
But the anything buffer has no contents. </span>")

(defvar anything-update-hook nil
  "<span class="quote">Run after the anything buffer was updated according the new input pattern.
This hook is run at the beginning of buffer.
The first candidate is selected after running this hook.
See also `anything-after-update-hook'.</span>")

(defvar anything-after-update-hook nil
  "<span class="quote">Run after the anything buffer was updated according the new input pattern.
This is very similar to `anything-update-hook' but selection is not moved.
It is useful to select a particular object instead of the first one. </span>")

(defvar anything-cleanup-hook nil
  "<span class="quote">Run after anything minibuffer is closed, IOW this hook is executed BEFORE performing action. </span>")

(defvar anything-after-action-hook nil
  "<span class="quote">Run after executing action.</span>")

(defvar anything-after-persistent-action-hook nil
  "<span class="quote">Run after executing persistent action.</span>")

(defvar anything-restored-variables
  '( anything-candidate-number-limit
     anything-source-filter
     anything-source-in-each-line-flag
     anything-map
     anything-sources
     deferred-action-list)
  "<span class="quote">Variables which are restored after `anything' invocation.</span>")
<span class="linecomment">;; `anything-saved-sources' is removed</span>

(defvar anything-saved-selection nil
  "<span class="quote">Saved value of the currently selected object when the action
  list is shown.</span>")

<span class="linecomment">;; `anything-original-source-filter' is removed</span>

(defvar anything-candidate-separator
  "<span class="quote">--------------------</span>"
  "<span class="quote">Candidates separator of `multiline' source.</span>")

(defvar anything-current-buffer nil
  "<span class="quote">Current buffer when `anything' is invoked.</span>")

(defvar anything-buffer-file-name nil
  "<span class="quote">`buffer-file-name' when `anything' is invoked.</span>")

(defvar anything-saved-action nil
  "<span class="quote">Saved value of the currently selected action by key.</span>")

(defvar anything-last-sources nil
  "<span class="quote">OBSOLETE!! Sources of previously invoked `anything'.</span>")

(defvar anything-saved-current-source nil
  "<span class="quote">Saved value of the original (anything-get-current-source) when the action
  list is shown.</span>")

(defvar anything-compiled-sources nil
  "<span class="quote">Compiled version of `anything-sources'. </span>")

(defvar anything-in-persistent-action nil
  "<span class="quote">Flag whether in persistent-action or not.</span>")

(defvar anything-quick-update nil
  "<span class="quote">If non-nil, suppress displaying sources which are out of screen at first.
They are treated as delayed sources at this input.
This flag makes `anything' a bit faster with many sources.</span>")

(defvar anything-last-sources-local nil
  "<span class="quote">Buffer local value of `anything-sources'.</span>")
(defvar anything-last-buffer nil
  "<span class="quote">`anything-buffer' of previously `anything' session.</span>")

(defvar anything-save-configuration-functions
  '(set-window-configuration . current-window-configuration)
  "<span class="quote">If you want to save and restore frame configuration, set this variable to
 '(set-frame-configuration . current-frame-configuration)

Older version saves/restores frame configuration, but the default is changed now,
because flickering is occurred in some environment.
</span>")

(defvar anything-persistent-action-use-special-display nil
  "<span class="quote">If non-nil, use `special-display-function' in persistent action.</span>")

(defvar anything-execute-action-at-once-if-one nil
  "<span class="quote">If non-nil and there is one candidate, execute the first action without selection.
It is useful for `anything' applications.</span>")

(defvar anything-quit-if-no-candidate nil
  "<span class="quote">if non-nil and there is no candidate, do not display *anything* buffer and quit.
This variable accepts a function, which is executed if no candidate.

It is useful for `anything' applications.</span>")

(defvar anything-scroll-amount nil
  "<span class="quote">Scroll amount used by `anything-scroll-other-window' and `anything-scroll-other-window-down'.
If you prefer scrolling line by line, set this value to 1.</span>")

(defvar anything-display-function 'anything-default-display-buffer
  "<span class="quote">Function to display *anything* buffer.
It is `anything-default-display-buffer' by default, which affects `anything-samewindow'.</span>")

(defvar anything-delayed-init-executed nil)

(defvar anything-mode-line-string "<span class="quote">\\&lt;anything-map&gt;\\[anything-help]:help \\[anything-select-action]:Acts \\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\\[anything-select-3rd-action]:NthAct \\[anything-send-bug-report-from-anything]:BugReport</span>"
  "<span class="quote">Help string displayed in mode-line in `anything'.
If nil, use default `mode-line-format'.</span>")

(defvar anything-help-message
  "<span class="quote">\\&lt;anything-map&gt;The keys that are defined for `anything' are:
       \\{anything-map}</span>"
  "<span class="quote">Detailed help message string for `anything'.
It also accepts function or variable symbol.</span>")

(put 'anything 'timid-completion 'disabled)

(defvar anything-inhibit-fit-frame-flag t
  "<span class="quote">If non-nil, inhibit fitting anything frame to its buffer.
It is nil by default because some flickering occurred in some environment.

To enable fitting, set both `anything-inhibit-fit-frame-flag' and
`fit-frame-inhibit-fitting' to nil.</span>")

(defvar anything-source-in-each-line-flag nil
  "<span class="quote">If non-nil, add anything-source text-property in each candidate.
experimental feature.</span>")

(defvaralias 'anything-debug-variables 'anything-debug-forms)
(defvar anything-debug-forms nil
  "<span class="quote">Forms to show in `anything-debug-output'.
Otherwise all variables started with `anything-' are shown.
It is useful for debug.</span>")

(defvar anything-debug nil
  "<span class="quote">If non-nil, write log message into *Anything Log* buffer.
If `debug-on-error' is non-nil, write log message regardless of this variable.
It is disabled by default because *Anything Log* grows quickly.</span>")

<span class="linecomment">;; (@* "Internal Variables")</span>
(defvar anything-test-candidate-list nil)
(defvar anything-test-mode nil)
(defvar anything-source-name nil)
(defvar anything-candidate-buffer-alist nil)
(defvar anything-check-minibuffer-input-timer nil)
(defvar anything-match-hash (make-hash-table :test 'equal))
(defvar anything-cib-hash (make-hash-table :test 'equal))
(defvar anything-tick-hash (make-hash-table :test 'equal))
(defvar anything-issued-errors nil)
(defvar anything-shortcut-keys nil)
(defvar anything-once-called-functions nil)
(defvar anything-follow-mode nil)
(defvar anything-let-variables nil)

<span class="linecomment">;; (@* "Utility: logging")</span>
(defun anything-log (format-string &rest args)
  "<span class="quote">Log message if `debug-on-error' or `anything-debug' is non-nil.
Messages are written to the *Anythingn Log* buffer.
Arguments are same as `format'.</span>"
  (when (or debug-on-error anything-debug)
    (with-current-buffer (get-buffer-create "<span class="quote">*Anything Log*</span>")
      (buffer-disable-undo)
      (set (make-local-variable 'inhibit-read-only) t)
      (goto-char (point-max))
      (insert (let ((tm (current-time)))
                (format "<span class="quote">%s.%06d (%s) %s\n</span>"
                        (format-time-string "<span class="quote">%H:%M:%S</span>" tm)
                        (nth 2 tm)
                        (anything-log-get-current-function)
                        (apply #'format (cons format-string args))))))))
(defmacro anything-log-eval (&rest exprs)
  "<span class="quote">Write each EXPR evaluation result to the *Anything Log* buffer.</span>"
  `(anything-log-eval-internal ',exprs))
(defun anything-log-run-hook (hook)
  (anything-log "<span class="quote">executing %s</span>" hook)
  (when (boundp hook)
    (anything-log-eval (symbol-value hook))
    (anything-log-eval (default-value hook)))
  (run-hooks hook)
  (anything-log "<span class="quote">executed %s</span>" hook))
(defun anything-log-eval-internal (exprs)
  (dolist (expr exprs)
    (condition-case err
        (anything-log "<span class="quote">%S = %S</span>" expr (eval expr))
      (error (anything-log "<span class="quote">%S = ERROR!</span>" expr)))))
(defun anything-log-get-current-function ()
  "<span class="quote">Get function name calling `anything-log'.
The original idea is from `tramp-debug-message'.</span>"
  (loop with exclude-func-re = "<span class="quote">^anything-\\(?:interpret\\|log\\|.*funcall\\)</span>"
        for btn from 1 to 40            <span class="linecomment">;avoid inf-loop</span>
        for btf = (second (backtrace-frame btn))
        for fn  = (if (symbolp btf) (symbol-name btf) "<span class="quote"></span>")
        if (and (string-match "<span class="quote">^anything</span>" fn)
                (not (string-match exclude-func-re fn)))
        return fn))

(defun anything-log-error (&rest args)
  "<span class="quote">Accumulate error messages into `anything-issued-errors'.</span>"
  (apply 'anything-log (concat "<span class="quote">ERROR: </span>" (car args)) (cdr args))
  (let ((msg (apply 'format args)))
    (unless (member msg anything-issued-errors)
      (add-to-list 'anything-issued-errors msg))))

(defvar anything-last-log-file nil)
(defun anything-log-save-maybe ()
  (when (stringp anything-debug)
    (let ((logdir (expand-file-name (format-time-string "<span class="quote">%Y%m%d</span>")
                                    anything-debug)))
      (make-directory logdir t)
      (with-current-buffer (get-buffer-create "<span class="quote">*Anything Log*</span>")
        (write-region (point-min) (point-max)
                      (setq anything-last-log-file
                            (expand-file-name (format-time-string "<span class="quote">%Y%m%d-%H%M%S</span>")
                                              logdir))
                      nil 'silent)
        (erase-buffer)))))

(defun anything-open-last-log ()
  "<span class="quote">Open anything log file of last anything session.</span>"
  (interactive)
  (if anything-last-log-file
      (view-file anything-last-log-file)
    (switch-to-buffer "<span class="quote">*Anything Log*</span>")))

(defun anything-print-error-messages ()
  "<span class="quote">Print error messages in `anything-issued-errors'.</span>"
  (message "<span class="quote">%s</span>" (mapconcat 'identity (reverse anything-issued-errors) "<span class="quote">\n</span>")))




<span class="linecomment">;; (anything-log "test")</span>
<span class="linecomment">;; (switch-to-buffer-other-window "*Anything Log*")</span>

<span class="linecomment">;; (@* "Programming Tools")</span>
(defmacro anything-aif (test-form then-form &rest else-forms)
  "<span class="quote">Anaphoric if. Temporary variable `it' is the result of test-form.</span>"
  `(let ((it ,test-form))
     (if it ,then-form ,@else-forms)))  
(put 'anything-aif 'lisp-indent-function 2)

(defun anything-mklist (obj)
  "<span class="quote">If OBJ is a list (but not lambda), return itself, otherwise make a list with one element.</span>"
  (if (and (listp obj) (not (functionp obj)))
      obj
    (list obj)))

<span class="linecomment">;; (@* "Anything API")</span>
(defmacro anything-let (varlist &rest body)
  "<span class="quote">[OBSOLETE] Like `let'. Bind anything buffer local variables according to VARLIST then eval BODY.</span>"
  `(anything-let-internal (anything-let-eval-varlist ',varlist)
                          (lambda () ,@body)))
(put 'anything-let 'lisp-indent-function 1)

(defmacro anything-let* (varlist &rest body)
  "<span class="quote">[OBSOLETE] Like `let*'. Bind anything buffer local variables according to VARLIST then eval BODY.</span>"
  `(anything-let-internal (anything-let*-eval-varlist ',varlist)
                          (lambda () ,@body)))
(put 'anything-let* 'lisp-indent-function 1)

(defun anything-buffer-get ()
  "<span class="quote">If *anything action* buffer is shown, return `anything-action-buffer', otherwise `anything-buffer'.</span>"
  (if (anything-action-window)
      anything-action-buffer
    anything-buffer))

(defun anything-window ()
  "<span class="quote">Window of `anything-buffer'.</span>"
  (get-buffer-window (anything-buffer-get) 'visible))

(defun anything-action-window ()
  "<span class="quote">Window of `anything-action-buffer'.</span>"
  (get-buffer-window anything-action-buffer 'visible))

(defmacro with-anything-window (&rest body)
  `(let ((--tmpfunc-- (lambda () ,@body)))
     (if anything-test-mode
         (with-current-buffer (anything-buffer-get)
           (funcall --tmpfunc--))
       (with-selected-window (anything-window)
         (funcall --tmpfunc--)))))
(put 'with-anything-window 'lisp-indent-function 0)

(defun anything-deferred-action-function ()
  (dolist (f deferred-action-list) (funcall f)))
(defmacro with-anything-restore-variables(&rest body)
  "<span class="quote">Restore variables specified by `anything-restored-variables' after executing BODY . </span>"
  `(let ((--orig-vars (mapcar (lambda (v) (cons v (symbol-value v)))
                              anything-restored-variables))
         (deferred-action-function 'anything-deferred-action-function))
     (anything-log "<span class="quote">save variables: %S</span>" --orig-vars)
     (unwind-protect (progn ,@body)
       (loop for (var . value) in --orig-vars
             do (set var value))
       (anything-log "<span class="quote">restore variables</span>"))))
(put 'with-anything-restore-variables 'lisp-indent-function 0)

(defun* anything-attr (attribute-name &optional (src (anything-get-current-source)))
  "<span class="quote">Get the value of ATTRIBUTE-NAME of SRC (source).
if SRC is omitted, use current source.
It is useful to write your sources.</span>"
  (anything-aif (assq attribute-name src)
      (cdr it)))

(defun* anything-attr* (attribute-name &optional (src (anything-get-current-source)))
  "<span class="quote">Get the value of ATTRIBUTE-NAME of SRC (source) and pass to `anything-interpret-value'.
if SRC is omitted, use current source.
It is useful to write your sources.</span>"
  (anything-interpret-value (anything-attr attribute-name src)))

(defun* anything-attr-defined (attribute-name &optional (src (anything-get-current-source)))
  "<span class="quote">Return non-nil if ATTRIBUTE-NAME of SRC (source)  is defined.
if SRC is omitted, use current source.
It is useful to write your sources.</span>"
  (and (assq attribute-name src) t))

(defun* anything-attrset (attribute-name value &optional (src (anything-get-current-source)))
  "<span class="quote">Set the value of ATTRIBUTE-NAME of SRC (source) to VALUE.
if SRC is omitted, use current source.
It is useful to write your sources.</span>"
  (anything-aif (assq attribute-name src)
      (setcdr it value)
    (setcdr src (cons (cons attribute-name value) (cdr src))))
  value)

<span class="linecomment">;; anything-set-source-filter</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   This function sets a filter for anything sources and it may be</span>
<span class="linecomment">;;   called while anything is running. It can be used to toggle</span>
<span class="linecomment">;;   displaying of sources dinamically. For example, additional keys</span>
<span class="linecomment">;;   can be bound into `anything-map' to display only the file-related</span>
<span class="linecomment">;;   results if there are too many matches from other sources and</span>
<span class="linecomment">;;   you're after files only:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   Shift+F shows only file results from some sources:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     (define-key anything-map "F" 'anything-my-show-files-only)</span>
<span class="linecomment">;;     </span>
<span class="linecomment">;;     (defun anything-my-show-files-only ()</span>
<span class="linecomment">;;       (interactive)</span>
<span class="linecomment">;;       (anything-set-source-filter '("File Name History"</span>
<span class="linecomment">;;                                     "Files from Current Directory")))</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   Shift+A shows all results:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     (define-key anything-map "A" 'anything-my-show-all)</span>
<span class="linecomment">;;     </span>
<span class="linecomment">;;     (defun anything-my-show-all ()</span>
<span class="linecomment">;;       (interactive)</span>
<span class="linecomment">;;       (anything-set-source-filter nil))</span>
<span class="linecomment">;;  </span>
<span class="linecomment">;;  </span>
<span class="linecomment">;;   Note that you have to prefix the functions with anything- prefix,</span>
<span class="linecomment">;;   otherwise they won't be bound when Anything is used under</span>
<span class="linecomment">;;   Iswitchb. The -my- part is added to avoid collisions with</span>
<span class="linecomment">;;   existing Anything function names.</span>
<span class="linecomment">;;  </span>
(defun anything-set-source-filter (sources)
  "<span class="quote">Sets the value of `anything-source-filter' and updates the list of results.</span>"
  (unless (and (listp sources)
               (loop for name in sources always (stringp name)))
    (error "<span class="quote">invalid data in `anything-set-source-filter': %S</span>" sources))
  (setq anything-source-filter sources)
  (anything-log-eval anything-source-filter)
  (anything-update))

(defun anything-set-sources (sources &optional no-init no-update)
  "<span class="quote">Set `anything-sources' during `anything' invocation.
If NO-INIT is non-nil, skip executing init functions of SOURCES.
If NO-UPDATE is non-nil, skip executing `anything-update'.</span>"
  (with-current-buffer anything-buffer
    (setq anything-compiled-sources nil
          anything-sources sources
          anything-last-sources-local sources)
    (anything-log-eval anything-compiled-sources anything-sources))
  (unless no-init (anything-funcall-foreach 'init))
  (unless no-update (anything-update)))

(defvar anything-compile-source-functions
  '(anything-compile-source--type
    anything-compile-source--dummy
    anything-compile-source--disable-shortcuts
    anything-compile-source--candidates-in-buffer)
  "<span class="quote">Functions to compile elements of `anything-sources' (plug-in).</span>")

(defun anything-get-sources ()
  "<span class="quote">Return compiled `anything-sources', which is memoized.

Attributes:

- type
  `anything-type-attributes' are merged in.
- candidates-buffer
  candidates, volatile and match attrubute are created.
</span>"
  (cond
   <span class="linecomment">;; action</span>
   ((anything-action-window)
    anything-sources)
   <span class="linecomment">;; memoized</span>
   (anything-compiled-sources)
   <span class="linecomment">;; first time</span>
   (t
    (prog1
        (setq anything-compiled-sources
              (anything-compile-sources
               anything-sources anything-compile-source-functions))
      (anything-log-eval anything-compiled-sources)))))

(defun* anything-get-selection (&optional (buffer nil buffer-s) (force-display-part))
  "<span class="quote">Return the currently selected item or nil.
if BUFFER is nil or unspecified, use anything-buffer as default value.
If FORCE-DISPLAY-PART is non-nil, return the display string.</span>"
  (setq buffer (if (and buffer buffer-s) buffer anything-buffer))
  (unless (anything-empty-buffer-p buffer)
    (with-current-buffer buffer
      (let ((selection
             (or (and (not force-display-part)
                      (get-text-property (overlay-start
                                          anything-selection-overlay)
                                         'anything-realvalue))
                 (let ((disp (buffer-substring-no-properties
                              (overlay-start anything-selection-overlay)
                              (1- (overlay-end anything-selection-overlay))))
                       (source (anything-get-current-source)))
                   (anything-aif (and (not force-display-part)
                                      (assoc-default 'display-to-real source))
                       (anything-funcall-with-source source it disp)
                     disp)))))
        (unless (equal selection "<span class="quote"></span>")
          (anything-log-eval selection)
          selection)))))

(defun anything-get-action ()
  "<span class="quote">Return the associated action for the selected candidate.
It is a function symbol (sole action) or list of (action-display . function).</span>"
  (unless (anything-empty-buffer-p (anything-buffer-get))
    (anything-aif (anything-attr 'action-transformer)
        (anything-composed-funcall-with-source
         (anything-get-current-source) it
         (anything-attr 'action) (anything-get-selection))
      (anything-attr 'action))))

(defun anything-get-current-source ()
  "<span class="quote">Return the source for the current selection / in init/candidates/action/candidate-transformer/filtered-candidate-transformer function.</span>"
  (declare (special source))
  <span class="linecomment">;; The name `anything-get-current-source' should be used in init function etc.</span>
  (if (and (boundp 'anything-source-name) (stringp anything-source-name))
      source
    (with-current-buffer (anything-buffer-get)
      (or (get-text-property (point) 'anything-source)
          (block exit
            <span class="linecomment">;; This goto-char shouldn't be necessary, but point is moved to</span>
            <span class="linecomment">;; point-min somewhere else which shouldn't happen.</span>
            (goto-char (overlay-start anything-selection-overlay))
            (let* ((header-pos (or (anything-get-previous-header-pos)
                                   (anything-get-next-header-pos)))
                   (source-name
                    (save-excursion
                      (unless header-pos
                        <span class="linecomment">;(message "No candidates")</span>
                        (return-from exit nil))
                      (goto-char header-pos)
                      (anything-current-line-contents))))
              (some (lambda (source)
                      (if (equal (assoc-default 'name source) source-name)
                          source))
                    (anything-get-sources))))))))

(defun anything-buffer-is-modified (buffer)
  "<span class="quote">Return non-nil when BUFFER is modified since `anything' was invoked.</span>"
  (let* ((b (get-buffer buffer))
         (key (concat (buffer-name b) "<span class="quote">/</span>" (anything-attr 'name)))
         (source-tick (or (gethash key anything-tick-hash) 0))
         (buffer-tick (buffer-chars-modified-tick b))
         (modifiedp (/= source-tick buffer-tick)))
    (puthash key buffer-tick anything-tick-hash)
    (anything-log-eval buffer modifiedp)
    modifiedp))
(defun anything-current-buffer-is-modified ()
  "<span class="quote">Return non-nil when `anything-current-buffer' is modified since `anything' was invoked.</span>"
  (anything-buffer-is-modified anything-current-buffer))

(defvar anything-quit nil)
(defun anything-run-after-quit (function &rest args)
  "<span class="quote">Perform an action after quitting `anything'.
The action is to call FUNCTION with arguments ARGS.</span>"
  (setq anything-quit t)
  (anything-log-eval function args)
  (apply 'run-with-idle-timer 0 nil function args)
  (anything-exit-minibuffer))


(defun define-anything-type-attribute (type definition &optional doc)
  "<span class="quote">Register type attribute of TYPE as DEFINITION with DOC.
DOC is displayed in `anything-type-attributes' docstring.

Use this function is better than setting `anything-type-attributes' directly.</span>"
  (loop for i in definition do
        <span class="linecomment">;; without `ignore-errors', error at emacs22</span>
        (ignore-errors (setf i (delete nil i))))
  (anything-add-type-attribute type definition)
  (and doc (anything-document-type-attribute type doc))
  nil)

(defvaralias 'anything-attributes 'anything-additional-attributes)
(defvar anything-additional-attributes nil
  "<span class="quote">List of all `anything' attributes.</span>")
(defun anything-document-attribute (attribute short-doc &optional long-doc)
  "<span class="quote">Register ATTRIBUTE documentation introduced by plug-in.
SHORT-DOC is displayed beside attribute name.
LONG-DOC is displayed below attribute name and short documentation.</span>"
  (if long-doc
      (setq short-doc (concat "<span class="quote">(</span>" short-doc "<span class="quote">)</span>"))
    (setq long-doc short-doc
          short-doc "<span class="quote"></span>"))
  (add-to-list 'anything-additional-attributes attribute t)
  (put attribute 'anything-attrdoc
       (concat "<span class="quote">- </span>" (symbol-name attribute) "<span class="quote"> </span>" short-doc "<span class="quote">\n\n</span>" long-doc "<span class="quote">\n</span>")))
(put 'anything-document-attribute 'lisp-indent-function 2)

(defun anything-require-at-least-version (version)
  "<span class="quote">Output error message unless anything.el is older than VERSION.
This is suitable for anything applications.</span>"
  (when (and (string= "<span class="quote">1.</span>" (substring version 0 2))
             (string-match "<span class="quote">1\.\\([0-9]+\\)</span>" anything-version)
             (&lt; (string-to-number (match-string 1 anything-version))
                (string-to-number (substring version 2))))
    (error "<span class="quote">Please update anything.el!!

M-x auto-install-batch anything

You must have auto-install.el too.
http://www.emacswiki.org/cgi-bin/wiki/download/auto-install.el
</span>")))

(defun anything-interpret-value (value &optional source)
  "<span class="quote">interpret VALUE as variable, function or literal.
If VALUE is a function, call it with no arguments and return the value.
If SOURCE is `anything' source, `anything-source-name' is source name.

If VALUE is a variable, return the value.

If VALUE is a symbol, but it is not a function or a variable, cause an error.

Otherwise, return VALUE itself.</span>"
  (cond ((and source (functionp value))
         (anything-funcall-with-source source value))
        ((functionp value)
         (funcall value))
        ((and (symbolp value) (boundp value))
         (symbol-value value))
        ((symbolp value)
         (error "<span class="quote">anything-interpret-value: Symbol must be a function or a variable</span>"))
        (t
         value)))

(defun anything-once (function &rest args)
  "<span class="quote">Ensure FUNCTION with ARGS to be called once in `anything' session.</span>"
  (let ((spec (cons function args)))
    (unless (member spec anything-once-called-functions)
      (apply function args)
      (push spec anything-once-called-functions))))

<span class="linecomment">;; (@* "Core: API helper")</span>
(defun anything-empty-buffer-p (&optional buffer)
  (zerop (buffer-size (and buffer (get-buffer buffer)))))

(defun anything-let-eval-varlist (varlist)
  (mapcar (lambda (pair)
            (if (listp pair)
                (cons (car pair) (eval (cadr pair)))
              (cons pair nil)))
          varlist))
(defun anything-let*-eval-varlist (varlist)
  (let ((vars (mapcar (lambda (pair) (or (car-safe pair) pair)) varlist)))
    (eval `(let ,vars
             ,@(mapcar (lambda (pair)
                         (if (listp pair)
                             `(setq ,(car pair) ,(cadr pair))
                           `(setq ,pair nil)))
                       varlist)
             (mapcar (lambda (v) (cons v (symbol-value v))) ',vars)))))
(defun anything-let-internal (binding bodyfunc)
  "<span class="quote">Evaluate BODYFUNC and Set BINDING to anything buffer-local variables.
BINDING is a list of (VARNAME . VALUE) pair.</span>"
  (setq anything-let-variables binding)
  (unwind-protect
      (funcall bodyfunc)
    (setq anything-let-variables nil)))


<span class="linecomment">;; (@* "Core: tools")</span>
(defun anything-current-line-contents ()
  "<span class="quote">Current line strig without properties.</span>"
  (buffer-substring-no-properties (point-at-bol) (point-at-eol)))

(defun anything-funcall-with-source (source func &rest args)
  "<span class="quote">Call FUNC with ARGS with variable `anything-source-name' and `source' is bound.
FUNC can be function list. Return the result of last function call.</span>"
  (let ((anything-source-name (assoc-default 'name source))
        result)
    (anything-log-eval anything-source-name func args)
    (dolist (func (if (functionp func) (list func) func) result)
      (setq result (apply func args)))))

(defun anything-funcall-foreach (sym)
  "<span class="quote">Call the sym function(s) for each source if any.</span>"
  (dolist (source (anything-get-sources))
    (anything-aif (assoc-default sym source)
        (anything-funcall-with-source source it))))

(defun anything-normalize-sources (sources)
  "<span class="quote">If SOURCES is only one source, make a list.</span>"
  (cond ((or (and sources               <span class="linecomment">; avoid nil</span>
                  (symbolp sources))
             (and (listp sources) (assq 'name sources)))
         (list sources))
        (sources)
        (t anything-sources)))  

(defun anything-approximate-candidate-number ()
  "<span class="quote">Approximate Number of candidates.
It is used to check if candidate number is 0, 1, or 2+.</span>"
  (with-current-buffer anything-buffer
    (let ((lines (1- (line-number-at-pos (1- (point-max))))))
      (if (zerop lines)
          0
        (save-excursion
          (goto-char (point-min))
          (forward-line 1)
          (if (anything-pos-multiline-p)
              (if (search-forward anything-candidate-separator nil t) 2 1)
            lines))))))

(defmacro with-anything-quittable (&rest body)
  `(let (inhibit-quit)
     (condition-case v
         (progn ,@body)
       (quit (setq anything-quit t)
             (exit-minibuffer)
             (keyboard-quit)))))
(put 'with-anything-quittable 'lisp-indent-function 0)

(defun anything-compose (arg-lst func-lst)
  "<span class="quote">Call each function in FUNC-LST with the arguments specified in ARG-LST.
The result of each function will be the new `car' of ARG-LST.

This function allows easy sequencing of transformer functions.</span>"
  (dolist (func func-lst)
    (setcar arg-lst (apply func arg-lst)))
  (car arg-lst))

(defun anything-composed-funcall-with-source (source funcs &rest args)
  (if (functionp funcs)
      (apply 'anything-funcall-with-source source funcs args)
    (apply 'anything-funcall-with-source
           source (lambda (&rest args) (anything-compose args funcs)) args)))

(defun anything-new-timer (variable timer)
  "<span class="quote">Set new TIMER to VARIABLE. Old timer is cancelled.</span>"
  (anything-aif (symbol-value variable)
      (cancel-timer it))
  (set variable timer))

<span class="linecomment">;; (@* "Core: entry point")</span>
(defconst anything-argument-keys
  '(:sources :input :prompt :resume :preselect :buffer :keymap))
<span class="linecomment">;;;###autoload</span>
(defun anything (&rest plist)
  "<span class="quote">Select anything. In Lisp program, some optional arguments can be used.

PLIST is a list like (:key1 val1 :key2 val2 ...) or
 (&optional sources input prompt resume preselect buffer keymap).

Basic keywords are the following:

- :sources

  Temporary value of `anything-sources'.  It also accepts a
  symbol, interpreted as a variable of an anything source.  It
  also accepts an alist representing an anything source, which is
  detected by (assq 'name ANY-SOURCES)

- :input

  Temporary value of `anything-pattern', ie. initial input of minibuffer.

- :prompt

  Prompt other than \"pattern: \".

- :resume

  If t, Resurrect previously instance of `anything'. Skip the initialization.
  If 'noresume, this instance of `anything' cannot be resumed.

- :preselect

  Initially selected candidate. Specified by exact candidate or a regexp.
  Note that it is not working with delayed sources.

- :buffer

  `anything-buffer' instead of *anything*.

- :keymap

  `anything-map' for current `anything' session.


Of course, conventional arguments are supported, the two are same.

 (anything :sources sources :input input :prompt prompt :resume resume
           :preselect preselect :buffer buffer :keymap keymap)
 (anything sources input prompt resume preselect buffer keymap)
           

Other keywords are interpreted as local variables of this anything session.
The `anything-' prefix can be omitted. For example,

 (anything :sources 'anything-c-source-buffers
           :buffer \"*buffers*\" :candidate-number-limit 10)

means starting anything session with `anything-c-source-buffers'
source in *buffers* buffer and set
`anything-candidate-number-limit' to 10 as session local variable. </span>"
  (interactive)
  (if (keywordp (car plist))
      (anything-let-internal
       (anything-parse-keys plist)
       (lambda ()
         (apply 'anything
                (mapcar (lambda (key) (plist-get plist key))
                        anything-argument-keys))))
    (apply 'anything-internal plist)))

(defun* anything-resume (&optional (any-buffer anything-last-buffer) buffer-pattern (any-resume t))
  "<span class="quote">Resurrect previously invoked `anything'.</span>"
  (interactive)
  (when (or current-prefix-arg buffer-pattern)
    (setq any-buffer (anything-resume-select-buffer buffer-pattern)))
  (setq anything-compiled-sources nil)
  (anything
   (or (buffer-local-value 'anything-last-sources-local (get-buffer any-buffer))
       anything-last-sources anything-sources)
   (buffer-local-value 'anything-input-local (get-buffer any-buffer))
   nil any-resume nil any-buffer))

<span class="linecomment">;;; rubikitch: experimental</span>
<span class="linecomment">;;; I use this and check it whether I am convenient.</span>
<span class="linecomment">;;; I may introduce an option to control the behavior.</span>
(defun* anything-resume-window-only (&optional (any-buffer anything-last-buffer) buffer-pattern)
  (interactive)
  (anything-resume any-buffer buffer-pattern 'window-only))

<span class="linecomment">;;;###autoload</span>
(defun anything-at-point (&optional any-sources any-input any-prompt any-resume any-preselect any-buffer)
  "<span class="quote">Same as `anything' except when C-u is pressed, the initial input is the symbol at point.</span>"
  (interactive)
  (anything any-sources
            (if current-prefix-arg
                (concat "<span class="quote">\\b</span>" (thing-at-point 'symbol) "<span class="quote">\\b</span>"
                        (if (featurep 'anything-match-plugin) "<span class="quote"> </span>" "<span class="quote"></span>"))
              any-input)
            any-prompt any-resume any-preselect any-buffer))

<span class="linecomment">;;;###autoload</span>
(defun anything-other-buffer (any-sources any-buffer)
  "<span class="quote">Simplified interface of `anything' with other `anything-buffer'</span>"
  (anything any-sources nil nil nil nil any-buffer))

<span class="linecomment">;;; (@* "Core: entry point helper")</span>
(defun anything-internal (&optional any-sources any-input any-prompt any-resume any-preselect any-buffer any-keymap)
  "<span class="quote">Older interface of `anything'. It is called by `anything'.</span>"
  (anything-log "<span class="quote">++++++++++++++++++++++++++++++++++++++++++++++++++++++++</span>")
  (anything-log-eval any-prompt any-preselect any-buffer any-keymap)
  (unwind-protect
      (condition-case v
          (let ( <span class="linecomment">;; It is needed because `anything-source-name' is non-nil</span>
                <span class="linecomment">;; when `anything' is invoked by action. Awful global scope.</span>
                anything-source-name
                anything-in-persistent-action
                anything-quit
                (case-fold-search t)
                (anything-buffer (or any-buffer anything-buffer))
                <span class="linecomment">;; cua-mode ; avoid error when region is selected</span>
                )
            (with-anything-restore-variables
              (anything-initialize-1 any-resume any-input any-sources)
              (anything-display-buffer anything-buffer)
              (anything-log "<span class="quote">show prompt</span>")
              (unwind-protect
                  (anything-read-pattern-maybe
                   any-prompt any-input any-preselect any-resume any-keymap)
                (anything-cleanup)))
            (prog1 (unless anything-quit (anything-execute-selection-action-1))
              (anything-log "<span class="quote">end session --------------------------------------------</span>")))
        (quit
         (anything-on-quit)
         (anything-log "<span class="quote">end session (quit) -------------------------------------</span>")
         nil))
    (anything-log-save-maybe)))



(defun anything-parse-keys (keys)
  (loop for (key value &rest _) on keys by #'cddr
        for symname = (substring (symbol-name key) 1)
        for sym = (intern (if (string-match "<span class="quote">^anything-</span>" symname)
                              symname
                            (concat "<span class="quote">anything-</span>" symname)))
        unless (memq key anything-argument-keys)
        collect (cons sym value)))

(defun anything-resume-p (any-resume)
  "<span class="quote">Whethre current anything session is resumed or not.</span>"
  (memq any-resume '(t window-only)))

(defvar anything-buffers nil
  "<span class="quote">All of `anything-buffer' in most recently used order.</span>")
(defun anything-initialize-1 (any-resume any-input any-sources)
  "<span class="quote">The real initialization of `anything'.

This function name should be `anything-initialize', but anything
extensions may advice `anything-initalize'. I cannot rename, sigh.</span>"
  (anything-log "<span class="quote">start initialization: any-resume=%S any-input=%S</span>" any-resume any-input)
  (anything-frame/window-configuration 'save)
  (setq anything-sources (anything-normalize-sources any-sources))
  (anything-log "<span class="quote">sources = %S</span>" anything-sources)
  (anything-hooks 'setup)
  (anything-current-position 'save)
  (if (anything-resume-p any-resume)
      (anything-initialize-overlays (anything-buffer-get))
    (anything-initialize))
  (unless (eq any-resume 'noresume)
    (anything-recent-push anything-buffer 'anything-buffers)
    (setq anything-last-buffer anything-buffer))
  (when any-input (setq anything-input any-input anything-pattern any-input))
  (and (anything-resume-p any-resume) (anything-funcall-foreach 'resume))
  (anything-log "<span class="quote">end initialization</span>"))

(defun anything-execute-selection-action-1 ()
  (unwind-protect
      (anything-execute-selection-action)
    (anything-aif (get-buffer anything-action-buffer)
        (kill-buffer it))
    (anything-log-run-hook 'anything-after-action-hook)))

(defun anything-on-quit ()
  (setq minibuffer-history (cons anything-input minibuffer-history))
  (anything-current-position 'restore))

(defun anything-resume-select-buffer (input)
  (anything '(((name . "<span class="quote">Resume anything buffer</span>")
               (candidates . anything-buffers)
               (action . identity)))
            input nil 'noresume nil "<span class="quote">*anything resume*</span>"))

(defun anything-recent-push (elt list-var)
  "<span class="quote">Add ELT to the value of LIST-VAR as most recently used value.</span>"
  (let ((m (member elt (symbol-value list-var))))
    (and m (set list-var (delq (car m) (symbol-value list-var))))
    (push elt (symbol-value list-var))))

<span class="linecomment">;;; (@* "Core: Accessors")</span>
<span class="linecomment">;;; rubikitch: I love to create functions to control variables.</span>
(defvar anything-current-position nil
  "<span class="quote">Cons of (point) and (window-start) when `anything' is invoked.
It is needed because restoring position when `anything' is keyboard-quitted.</span>")
(defun anything-current-position (save-or-restore)
  (case save-or-restore
    (save
     (setq anything-current-position (cons (point) (window-start))))
    (restore
     (goto-char (car anything-current-position))
     (set-window-start (selected-window) (cdr anything-current-position)))))

<span class="linecomment">;;; FIXME I want to remove them. But anything-iswitchb uses them.</span>
(defun anything-current-frame/window-configuration ()
  (funcall (cdr anything-save-configuration-functions)))
(defun anything-set-frame/window-configuration (conf)
  (funcall (car anything-save-configuration-functions) conf))

(lexical-let (conf)
  (defun anything-frame/window-configuration (save-or-restore)
    (anything-log-eval anything-save-configuration-functions)
    (case save-or-restore
      (save    (setq conf (funcall (cdr anything-save-configuration-functions))))
      (restore (funcall (car anything-save-configuration-functions) conf)))))

<span class="linecomment">;; (@* "Core: Display *anything* buffer")</span>
(defun anything-display-buffer (buf)
  "<span class="quote">Display *anything* buffer.</span>"
  (funcall (with-current-buffer buf anything-display-function) buf))

(defun anything-default-display-buffer (buf)
  (funcall (if anything-samewindow 'switch-to-buffer 'pop-to-buffer) buf))

<span class="linecomment">;; (@* "Core: initialize")</span>
(defun anything-initialize ()
  "<span class="quote">Initialize anything settings and set up the anything buffer.</span>"
  (anything-log-run-hook 'anything-before-initialize-hook)
  (setq anything-once-called-functions nil)
  (setq anything-delayed-init-executed nil)
  (setq anything-current-buffer (current-buffer))
  (setq anything-buffer-file-name buffer-file-name)
  (setq anything-issued-errors nil)
  (setq anything-compiled-sources nil)
  (setq anything-saved-current-source nil)
  <span class="linecomment">;; Call the init function for sources where appropriate</span>
  (anything-funcall-foreach 'init)

  (setq anything-pattern "<span class="quote"></span>")
  (setq anything-input "<span class="quote"></span>")
  (setq anything-candidate-cache nil)
  (setq anything-last-sources anything-sources)

  (anything-create-anything-buffer)
  (anything-log-run-hook 'anything-after-initialize-hook))

(defvar anything-reading-pattern nil
  "<span class="quote">Whether in `read-string' in anything or not.</span>")
(defun anything-read-pattern-maybe (any-prompt any-input any-preselect any-resume any-keymap)
  (if (anything-resume-p any-resume)
      (anything-mark-current-line)
    (anything-update))
  (select-frame-set-input-focus (window-frame (minibuffer-window)))
  (anything-preselect any-preselect)
  (with-current-buffer (anything-buffer-get)
    (and any-keymap (set (make-local-variable 'anything-map) any-keymap))
    (let ((minibuffer-local-map
           anything-map))
      (anything-log-eval (anything-approximate-candidate-number)
                         anything-execute-action-at-once-if-one
                         anything-quit-if-no-candidate)
      (cond ((and anything-execute-action-at-once-if-one
                  (= (anything-approximate-candidate-number) 1))
             (ignore))
            ((and anything-quit-if-no-candidate
                  (= (anything-approximate-candidate-number) 0))
             (setq anything-quit t)
             (and (functionp anything-quit-if-no-candidate)
                  (funcall anything-quit-if-no-candidate)))
            (t
             (let ((anything-reading-pattern t))
               (read-string (or any-prompt "<span class="quote">pattern: </span>") any-input)))))))

(defun anything-create-anything-buffer (&optional test-mode)
  "<span class="quote">Create newly created `anything-buffer'.
If TEST-MODE is non-nil, clear `anything-candidate-cache'.</span>"
  (when test-mode
    (setq anything-candidate-cache nil))
  (with-current-buffer (get-buffer-create anything-buffer)
    (anything-log "<span class="quote">kill local variables: %S</span>" (buffer-local-variables))
    (kill-all-local-variables)
    (set (make-local-variable 'inhibit-read-only) t)
    (buffer-disable-undo)
    (erase-buffer)
    (set (make-local-variable 'inhibit-read-only) t)
    (set (make-local-variable 'anything-last-sources-local) anything-sources)
    (set (make-local-variable 'anything-follow-mode) nil)
    (set (make-local-variable 'anything-display-function) anything-display-function)
    (anything-initialize-persistent-action)
    (anything-log-eval anything-display-function anything-let-variables)
    (loop for (var . val) in anything-let-variables
          do (set (make-local-variable var) val))
    
    (setq cursor-type nil)
    (setq mode-name "<span class="quote">Anything</span>"))
  (anything-initialize-overlays anything-buffer)
  (get-buffer anything-buffer))

(defun anything-initialize-overlays (buffer)
  (anything-log "<span class="quote">overlay setup</span>")
  (if anything-selection-overlay
      <span class="linecomment">;; make sure the overlay belongs to the anything buffer if</span>
      <span class="linecomment">;; it's newly created</span>
      (move-overlay anything-selection-overlay (point-min) (point-min)
                    (get-buffer buffer))

    (setq anything-selection-overlay 
          (make-overlay (point-min) (point-min) (get-buffer buffer)))
    (overlay-put anything-selection-overlay 'face anything-selection-face))

  (cond (anything-enable-shortcuts
         (setq anything-shortcut-keys
               (assoc-default anything-enable-shortcuts anything-shortcut-keys-alist))
         (unless anything-digit-overlays
           (setq anything-digit-overlays
                 (loop for key across anything-shortcut-keys
                       for overlay = (make-overlay (point-min) (point-min)
                                                   (get-buffer buffer))
                       do (overlay-put overlay 'before-string
                                       (format "<span class="quote">%s - </span>" (upcase (make-string 1 key))))
                       collect overlay))))
        (anything-digit-overlays
         (mapc 'delete-overlay anything-digit-overlays)
         (setq anything-digit-overlays nil))))

(defun anything-hooks (setup-or-cleanup)
  (let ((hooks '((deferred-action-list anything-check-minibuffer-input)
                 (minibuffer-setup-hook anything-print-error-messages))))
    (if (eq setup-or-cleanup 'setup)
        (dolist (args hooks) (apply 'add-hook args))
      (dolist (args (reverse hooks)) (apply 'remove-hook args)))))

<span class="linecomment">;; (@* "Core: clean up")</span>
<span class="linecomment">;;; TODO move</span>
(defun anything-cleanup ()
  "<span class="quote">Clean up the mess.</span>"
  (anything-log "<span class="quote">start cleanup</span>")
  (with-current-buffer anything-buffer
    (setq cursor-type t))
  (bury-buffer anything-buffer)
  (anything-funcall-foreach 'cleanup)
  (anything-new-timer 'anything-check-minibuffer-input-timer nil)
  (anything-kill-async-processes)
  (anything-log-run-hook 'anything-cleanup-hook)
  (anything-hooks 'cleanup)
  (anything-frame/window-configuration 'restore))

<span class="linecomment">;; (@* "Core: input handling")</span>
(defun anything-check-minibuffer-input ()
  "<span class="quote">Extract input string from the minibuffer and check if it needs
to be handled.</span>"
  (let ((delay (with-current-buffer anything-buffer anything-input-idle-delay)))
    (if (or (not delay) (anything-action-window))
       (anything-check-minibuffer-input-1)
     (anything-new-timer
      'anything-check-minibuffer-input-timer
      (run-with-idle-timer delay nil 'anything-check-minibuffer-input-1)))))

(defun anything-check-minibuffer-input-1 ()
  (with-anything-quittable
    (with-selected-window (minibuffer-window)
      (anything-check-new-input (minibuffer-contents)))))

(defun anything-check-new-input (input)
  "<span class="quote">Check input string and update the anything buffer if
necessary.</span>"
  (unless (equal input anything-pattern)
    (setq anything-pattern input)
    (unless (anything-action-window)
      (setq anything-input anything-pattern))
    (anything-log-eval anything-pattern anything-input)
    (anything-update)))

<span class="linecomment">;; (@* "Core: source compiler")</span>
(defvar anything-compile-source-functions-default anything-compile-source-functions
  "<span class="quote">Plug-ins this file provides.</span>")
(defun anything-compile-sources (sources funcs)
  "<span class="quote">Compile sources (`anything-sources') with funcs (`anything-compile-source-functions').
Anything plug-ins are realized by this function.</span>"
  (mapcar
   (lambda (source)
     (loop with source = (if (listp source) source (symbol-value source))
           for f in funcs
           do (setq source (funcall f source))
           finally (return source)))
   sources))  

<span class="linecomment">;; (@* "Core: plug-in attribute documentation hack")</span>

<span class="linecomment">;; `anything-document-attribute' is public API.</span>
(defadvice documentation-property (after anything-document-attribute activate)
  "<span class="quote">Hack to display plug-in attributes' documentation as `anything-sources' docstring.</span>"
  (when (eq (ad-get-arg 0) 'anything-sources)
    (setq ad-return-value
          (concat ad-return-value "<span class="quote">\n</span>"
                  (mapconcat (lambda (sym) (get sym 'anything-attrdoc))
                             anything-additional-attributes
                             "<span class="quote">\n</span>")))))
<span class="linecomment">;; (describe-variable 'anything-sources)</span>
<span class="linecomment">;; (documentation-property 'anything-sources 'variable-documentation)</span>
<span class="linecomment">;; (progn (ad-disable-advice 'documentation-property 'after 'anything-document-attribute) (ad-update 'documentation-property)) </span>

<span class="linecomment">;; (@* "Core: all candidates")</span>
(defun anything-process-delayed-init (source)
  (let ((name (assoc-default 'name source)))
    (unless (member name anything-delayed-init-executed)
      (anything-aif (assoc-default 'delayed-init source)
          (with-current-buffer anything-current-buffer
            (anything-funcall-with-source source it)
            (dolist (f (if (functionp it) (list it) it))
              (add-to-list 'anything-delayed-init-executed name)))))))

(defun anything-get-candidates (source)
  "<span class="quote">Retrieve and return the list of candidates from
SOURCE.</span>"
  (anything-process-delayed-init source)
  (let* ((candidate-source (assoc-default 'candidates source))
         (type-error (lambda ()
                       (error (concat "<span class="quote">Candidates must either be a function, </span>"
                                      "<span class="quote"> a variable or a list: %s</span>")
                              candidate-source)))
         (candidates (condition-case err
                         (anything-interpret-value candidate-source source)
                       (error (funcall type-error)))))
    (cond ((processp candidates) candidates)
          ((listp candidates) (anything-transform-candidates candidates source))
          (t (funcall type-error)))))
         

(defun anything-get-cached-candidates (source)
  "<span class="quote">Return the cached value of candidates for SOURCE.
Cache the candidates if there is not yet a cached value.</span>"
  (let* ((name (assoc-default 'name source))
         (candidate-cache (assoc name anything-candidate-cache)))
    (cond (candidate-cache
           (anything-log "<span class="quote">use cached candidates</span>")
           (cdr candidate-cache))
          (t
           (anything-log "<span class="quote">calculate candidates</span>")
           (let ((candidates (anything-get-candidates source)))
             (cond ((processp candidates)
                    (push (cons candidates
                                (append source 
                                        (list (cons 'item-count 0)
                                              (cons 'incomplete-line "<span class="quote"></span>"))))
                          anything-async-processes)
                    (set-process-filter candidates 'anything-output-filter)
                    (setq candidates nil))
                   ((not (assoc 'volatile source))
                    (setq candidate-cache (cons name candidates))
                    (push candidate-cache anything-candidate-cache)))
             candidates)))))

<span class="linecomment">;;; (@* "Core: candidate transformers")</span>
(defun anything-process-candidate-transformer (candidates source)
  (anything-aif (assoc-default 'candidate-transformer source)
      (anything-composed-funcall-with-source source it candidates)
    candidates))
(defun anything-process-filtered-candidate-transformer (candidates source)
  (anything-aif (assoc-default 'filtered-candidate-transformer source)
      (anything-composed-funcall-with-source source it candidates source)
    candidates))
(defun anything-process-filtered-candidate-transformer-maybe (candidates source process-p)
  (if process-p
      (anything-process-filtered-candidate-transformer candidates source)
    candidates))
(defun anything-process-real-to-display (candidates source)
  (anything-aif (assoc-default 'real-to-display source)
      (setq candidates (anything-funcall-with-source
                        source 'mapcar
                        (lambda (cand_)
                          (if (consp cand_)
                              <span class="linecomment">;; override DISPLAY from candidate-transformer</span>
                              (cons (funcall it (cdr cand_)) (cdr cand_))
                            (cons (funcall it cand_) cand_)))
                        candidates))
    candidates))
(defun anything-transform-candidates (candidates source &optional process-p)
  "<span class="quote">Transform CANDIDATES according to candidate transformers.</span>"
  (anything-process-real-to-display
   (anything-process-filtered-candidate-transformer-maybe
    (anything-process-candidate-transformer candidates source) source process-p)
   source))


<span class="linecomment">;; (@* "Core: narrowing candidates")</span>
(defun anything-candidate-number-limit (source)
  "<span class="quote">`anything-candidate-number-limit' variable may be overridden by SOURCE.
If (candidate-number-limit) is in SOURCE, show all candidates in SOURCE,
ie. cancel the effect of `anything-candidate-number-limit'.</span>"
  (anything-aif (assq 'candidate-number-limit source)
      (or (cdr it) 99999999)
    (or anything-candidate-number-limit 99999999)))

(defconst anything-default-match-functions
  (list (lambda (candidate)
          (string-match anything-pattern candidate))))

(defun anything-compute-matches (source)
  "<span class="quote">Compute matches from SOURCE according to its settings.</span>"
  (if debug-on-error
      (anything-compute-matches-internal source)
    (condition-case v
        (anything-compute-matches-internal source)
      (error (anything-log-error
              "<span class="quote">anything-compute-matches: error when processing source: %s</span>"
              (assoc-default 'name source))
             nil))))

(defun anything-candidate-get-display (candidate)
  "<span class="quote">Get display part (searched) from CANDIDATE.
CANDIDATE is a string, a symbol, or (DISPLAY . REAL) cons cell.</span>"
  (format "<span class="quote">%s</span>" (or (car-safe candidate) candidate)))

(defun anything-process-pattern-transformer (pattern source)
  (anything-aif (assoc-default 'pattern-transformer source)
      (anything-composed-funcall-with-source source it pattern)
    pattern))

(defun anything-match-functions (source)
  (or (assoc-default 'match source)
      anything-default-match-functions))

(defmacro anything-accumulate-candidates-internal (cand newmatches hash item-count limit)
  "<span class="quote">INTERNAL: add CAND (ITEM-COUNT th match) into NEWMATCHES.
Use HASH to uniq NEWMATCHES.
if ITEM-COUNT reaches LIMIT, exit from inner loop.</span>"
  `(unless (gethash ,cand ,hash)
     (puthash ,cand t ,hash)
     (push ,cand ,newmatches)
     (incf ,item-count)
     (when (= ,item-count ,limit)
       (setq exit t)
       (return))))

(defun anything-take-first-elements (seq n)
  (if (&gt; (length seq) n)
      (setq seq (subseq seq 0 n))
    seq))

(defun anything-match-from-candidates (cands matchfns limit)
  (let (matches)
    (condition-case nil
        (let ((item-count 0) exit)
          (clrhash anything-match-hash)
          (dolist (match matchfns)
            (let (newmatches)
              (dolist (candidate cands)
                (when (funcall match (anything-candidate-get-display candidate))
                  (anything-accumulate-candidates-internal
                   candidate newmatches anything-match-hash item-count limit)))
              (setq matches (append matches (reverse newmatches)))
              (if exit (return)))))
      (invalid-regexp (setq matches nil)))
    matches))

(defun anything-compute-matches-internal (source)
  (save-current-buffer
    (let ((matchfns (anything-match-functions source))
          (anything-source-name (assoc-default 'name source))
          (limit (anything-candidate-number-limit source))
          (anything-pattern (anything-process-pattern-transformer
                             anything-pattern source)))
      (anything-process-filtered-candidate-transformer
       (if (or (equal anything-pattern "<span class="quote"></span>") (equal matchfns '(identity)))
           (anything-take-first-elements
            (anything-get-cached-candidates source) limit)
         (anything-match-from-candidates
          (anything-get-cached-candidates source) matchfns limit))
       source))))

<span class="linecomment">;; (anything '(((name . "error")(candidates . (lambda () (hage))) (action . identity))))</span>

(defun anything-process-source (source)
  "<span class="quote">Display matches from SOURCE according to its settings.</span>"
  (anything-log-eval (assoc-default 'name source))
  (if (assq 'direct-insert-match source) <span class="linecomment">;experimental</span>
      (anything-process-source--direct-insert-match source)
    (let ((matches (anything-compute-matches source)))
      (when matches
        (when anything-test-mode
          (setq anything-test-candidate-list
                `(,@anything-test-candidate-list
                  (,(assoc-default 'name source)
                   ,matches))))
        (anything-insert-header-from-source source)
        (if (not (assq 'multiline source))
            (mapc 'anything-insert-match-with-digit-overlay matches)
          (let ((start (point)) separate)
            (dolist (match matches)
              (if separate
                  (anything-insert-candidate-separator)
                (setq separate t))
              (anything-insert-match-with-digit-overlay match))
            (put-text-property start (point) 'anything-multiline t)))))))

(defun anything-insert-match-with-digit-overlay (match)
  (declare (special source))
  (anything-put-digit-overlay-maybe)
  (anything-insert-match match 'insert source))

(defun anything-put-digit-overlay-maybe ()
  (when (and anything-enable-shortcuts
             (not (eq anything-digit-shortcut-count
                      (length anything-digit-overlays))))
    (move-overlay (nth anything-digit-shortcut-count
                       anything-digit-overlays)
                  (point-at-bol)
                  (point-at-bol))
    (incf anything-digit-shortcut-count)))

(defun anything-process-source--direct-insert-match (source)
  "<span class="quote">[EXPERIMENTAL] Insert candidates from `anything-candidate-buffer'</span>"
  (anything-log-eval (assoc-default 'name source))
  (let ((anything-source-name (assoc-default 'name source))
        content-buf)
    (funcall (assoc-default 'candidates source))
    (setq content-buf (anything-candidate-buffer))
    (unless (anything-empty-buffer-p content-buf)
      (anything-insert-header-from-source source)
      (insert-buffer-substring content-buf)
      <span class="linecomment">;; TODO call anything-put-digit-overlay-maybe with loop</span>
      )))

(defun anything-process-delayed-sources (delayed-sources)
  "<span class="quote">Process delayed sources if the user is idle for
`anything-idle-delay' seconds.</span>"
  (with-anything-quittable
    (anything-log-eval (mapcar (lambda (s) (assoc-default 'name s)) delayed-sources))
    (with-current-buffer anything-buffer        
      (save-excursion
        (goto-char (point-max))
        (mapc 'anything-process-source delayed-sources)
        (when (and (not (anything-empty-buffer-p))
                   <span class="linecomment">;; no selection yet</span>
                   (= (overlay-start anything-selection-overlay)
                      (overlay-end anything-selection-overlay)))
          (goto-char (point-min))
          (anything-next-line)))
      (save-excursion
        (goto-char (point-min))
        (anything-log-run-hook 'anything-update-hook))
      (anything-maybe-fit-frame))))

<span class="linecomment">;; (@* "Core: *anything* buffer contents")</span>
(defvar anything-input-local nil)
(defvar anything-process-delayed-sources-timer nil)
(defun anything-update ()
  "<span class="quote">Update the list of matches in the anything buffer according to
the current pattern.</span>"
  (anything-log "<span class="quote">start update</span>")
  (setq anything-digit-shortcut-count 0)
  (anything-kill-async-processes)
  (with-current-buffer (anything-buffer-get)
    (set (make-local-variable 'anything-input-local) anything-pattern)
    (erase-buffer)
    (when anything-enable-shortcuts
      (mapc 'delete-overlay anything-digit-overlays))
    (let (delayed-sources)
      (unwind-protect
          (setq delayed-sources
                (loop for source in (remove-if-not 'anything-update-source-p
                                                   (anything-get-sources))
                      if (anything-delayed-source-p source)
                      collect source
                      else do (anything-process-source source)))
        (anything-log-eval
         (mapcar (lambda (s) (assoc-default 'name s)) delayed-sources))
        (anything-update-move-first-line)
        (if anything-test-mode
            (mapc 'anything-process-source delayed-sources)
          (anything-maybe-fit-frame)
          (when delayed-sources
            (anything-new-timer
             'anything-process-delayed-sources-timer
             (run-with-idle-timer
              anything-idle-delay nil
              'anything-process-delayed-sources delayed-sources)))
          <span class="linecomment">;; FIXME I want to execute anything-after-update-hook</span>
          <span class="linecomment">;; AFTER processing delayed sources</span>
          (anything-log-run-hook 'anything-after-update-hook))
        (anything-log "<span class="quote">end update</span>")))))

(defun anything-update-source-p (source)
  (and (or (not anything-source-filter)
           (member (assoc-default 'name source) anything-source-filter))
       (&gt;= (length anything-pattern)
           (anything-aif (assoc 'requires-pattern source)
               (or (cdr it) 1)
             0))))
(defun anything-delayed-source-p (source)
  (or (assoc 'delayed source)
      (and anything-quick-update
           (&lt; (window-height (get-buffer-window (current-buffer)))
              (line-number-at-pos (point-max))))))

(defun anything-update-move-first-line ()
  (goto-char (point-min))
  (save-excursion (anything-log-run-hook 'anything-update-hook))
  (anything-next-line))

(defun anything-force-update ()
  "<span class="quote">Recalculate and update candidates.
If current source has `update' attribute, a function without argument, call it before update.</span>"
  (interactive)
  (let ((source (anything-get-current-source)))
    (if source
        (anything-force-update--reinit source)
      (anything-erase-message)
      (mapc 'anything-force-update--reinit (anything-get-sources)))
    (let ((selection (anything-get-selection nil t)))
      (anything-update)
      (anything-keep-selection source selection))))

(defun anything-force-update--reinit (source)
  (anything-aif (anything-funcall-with-source source 'anything-candidate-buffer)
      (kill-buffer it))
  (dolist (attr '(update init))
    (anything-aif (assoc-default attr source)
        (anything-funcall-with-source source it)))
  (anything-remove-candidate-cache source))

(defun anything-erase-message ()
  (message "<span class="quote"></span>"))

(defun anything-keep-selection (source selection)
  (when (and source selection)
    (with-anything-window
      (anything-goto-source source)
      (forward-char -1)                  <span class="linecomment">;back to \n</span>
      (if (search-forward (concat "<span class="quote">\n</span>" selection "<span class="quote">\n</span>") nil t)
          (forward-line -1)
        (goto-char (point-min))
        (forward-line 1))
      (anything-mark-current-line))))

(defun anything-remove-candidate-cache (source)
  (setq anything-candidate-cache
        (delete (assoc (assoc-default 'name source) anything-candidate-cache)
                anything-candidate-cache)))

(defun anything-insert-match (match insert-function source)
  "<span class="quote">Insert MATCH into the anything buffer. If MATCH is a list then
insert the string inteneded to appear on the display and store
the real value in a text property.</span>"
  (let ((start (point-at-bol (point)))
        (string (or (car-safe match) match))
        (realvalue (cdr-safe match)))
    (when (symbolp string) (setq string (symbol-name string)))
    (when (stringp string)
      (funcall insert-function string)
      <span class="linecomment">;; Some sources with candidates-in-buffer have already added</span>
      <span class="linecomment">;; 'anything-realvalue property when creating candidate buffer.</span>
      (unless (get-text-property start 'anything-realvalue)
        (and realvalue
             (put-text-property start (point-at-eol)
                                'anything-realvalue realvalue)))
      (when anything-source-in-each-line-flag
        (put-text-property start (point-at-eol) 'anything-source source))
      (funcall insert-function "<span class="quote">\n</span>"))))

(defun anything-insert-header-from-source (source)
  (let ((name (assoc-default 'name source)))
    (anything-insert-header
     name
     (anything-aif (assoc-default 'header-name source)
         (anything-funcall-with-source source it name)))))

(defun anything-insert-header (name &optional display-string)
  "<span class="quote">Insert header of source NAME into the anything buffer.</span>"
  (unless (bobp)
    (let ((start (point)))
      (insert "<span class="quote">\n</span>")
      (put-text-property start (point) 'anything-header-separator t)))

  (let ((start (point)))
    (insert name)
    (put-text-property (point-at-bol)
                       (point-at-eol) 'anything-header t)
    (when display-string
      (overlay-put (make-overlay (point-at-bol) (point-at-eol))
                   'display display-string))
    (insert "<span class="quote">\n</span>")
    (put-text-property start (point) 'face anything-header-face)))


(defun anything-insert-candidate-separator ()
  "<span class="quote">Insert separator of candidates into the anything buffer.</span>"
  (insert anything-candidate-separator)
  (put-text-property (point-at-bol)
                     (point-at-eol) 'anything-candidate-separator t)
  (insert "<span class="quote">\n</span>"))




<span class="linecomment">;; (@* "Core: async process")</span>
(defun anything-output-filter (process string)
  "<span class="quote">Process output from PROCESS.</span>"
  (anything-output-filter-1 (assoc process anything-async-processes) string))

(defun anything-output-filter-1 (process-assoc string)
  (anything-log-eval string)
  (with-current-buffer anything-buffer
    (let ((source (cdr process-assoc)))
      (save-excursion
       (anything-aif (assoc-default 'insertion-marker source)
           (goto-char it)
         (goto-char (point-max))
         (anything-insert-header-from-source source)
         (setcdr process-assoc
                 (append source `((insertion-marker . ,(point-marker))))))
       (anything-output-filter--process-source
        (car process-assoc) string source
        (anything-candidate-number-limit source))))
    (anything-output-filter--post-process)))

(defun anything-output-filter--process-source (process string source limit)
  (dolist (candidate (anything-transform-candidates
                      (anything-output-filter--collect-candidates
                       (split-string string "<span class="quote">\n</span>")
                       (assoc 'incomplete-line source))
                      source t))
    (if (not (assq 'multiline source))
        (anything-insert-match candidate 'insert-before-markers source)
      (let ((start (point)))
        (anything-insert-candidate-separator)
        (anything-insert-match candidate 'insert-before-markers source)
        (put-text-property start (point) 'anything-multiline t)))
    (incf (cdr (assoc 'item-count source)))
    (when (&gt;= (assoc-default 'item-count source) limit)
      (anything-kill-async-process process)
      (return))))

(defun anything-output-filter--collect-candidates (lines incomplete-line-info)
  (anything-log-eval (cdr incomplete-line-info))
  (butlast
   (loop for line in lines collect
         (if (cdr incomplete-line-info)
             (prog1
                 (concat (cdr incomplete-line-info) line)
               (setcdr incomplete-line-info nil))
           line)
         finally (setcdr incomplete-line-info line))))

(defun anything-output-filter--post-process ()
  (anything-maybe-fit-frame)
  (anything-log-run-hook 'anything-update-hook)
  (anything-aif (get-buffer-window anything-buffer 'visible)
      (save-selected-window
        (select-window it)
        (anything-skip-noncandidate-line 'next)
        (anything-mark-current-line))))


(defun anything-kill-async-processes ()
  "<span class="quote">Kill all known asynchronous processes according to
`anything-async-processes'.</span>"
    "<span class="quote">Kill locate process.</span>"
    (mapc 'anything-kill-async-process (mapcar 'car anything-async-processes))
    (setq anything-async-processes nil))


(defun anything-kill-async-process (process)
  "<span class="quote">Kill PROCESS and detach the associated functions.</span>"
  (set-process-filter process nil)
  (delete-process process))
  

<span class="linecomment">;; (@* "Core: action")</span>
(defun anything-execute-selection-action (&optional selection action preserve-saved-action)
  "<span class="quote">If a candidate was selected then perform the associated
action.</span>"
  (anything-log "<span class="quote">executing action</span>")
  (setq action (anything-get-default-action
                (or action
                    anything-saved-action
                    (if (get-buffer anything-action-buffer)
                        (anything-get-selection anything-action-buffer)
                      (anything-get-action)))))
  (let ((source (or anything-saved-current-source (anything-get-current-source))))
    (setq selection (or selection
                        (anything-get-selection)
                        (and (assoc 'accept-empty source) "<span class="quote"></span>")))
    (unless preserve-saved-action (setq anything-saved-action nil))
    (if (and selection action)
        (anything-funcall-with-source
         source action
         (anything-coerce-selection selection source)))))

(defun anything-coerce-selection (selection source)
  "<span class="quote">Coerce source with coerce function.</span>"
  (anything-aif (assoc-default 'coerce source)
             (anything-funcall-with-source source it selection)
           selection))

(defun anything-get-default-action (action)
  (if (and (listp action) (not (functionp action)))
      (cdar action)
    action))

(defun anything-select-action ()
  "<span class="quote">Select an action for the currently selected candidate.
If action buffer is selected, back to the anything buffer.</span>"
  (interactive)
  (cond ((get-buffer-window anything-action-buffer 'visible)
         (set-window-buffer (get-buffer-window anything-action-buffer)
                            anything-buffer)
         (kill-buffer anything-action-buffer)
         (anything-set-pattern anything-input 'noupdate))
        (t
         (setq anything-saved-selection (anything-get-selection))
         (unless anything-saved-selection
           (error "<span class="quote">Nothing is selected.</span>"))
         (setq anything-saved-current-source (anything-get-current-source))
         (let ((actions (anything-get-action)))
           (if (functionp actions)
               (message "<span class="quote">Sole action: %s</span>" actions)
             (anything-show-action-buffer actions)
             (anything-delete-minibuffer-contents)
             (setq anything-pattern 'dummy) <span class="linecomment">; so that it differs from the previous one</span>
             (anything-check-minibuffer-input))))))

(defun anything-show-action-buffer (actions)
  (with-current-buffer (get-buffer-create anything-action-buffer)
    (erase-buffer)
    (buffer-disable-undo)
    (set-window-buffer (get-buffer-window anything-buffer) anything-action-buffer)
    (set (make-local-variable 'anything-sources)
         `(((name . "<span class="quote">Actions</span>")
            (volatile)
            (candidates . ,actions)
            (candidate-number-limit))))
    (set (make-local-variable 'anything-source-filter) nil)
    (set (make-local-variable 'anything-selection-overlay) nil)
    (set (make-local-variable 'anything-digit-overlays) nil)
    (anything-initialize-overlays anything-action-buffer)))

<span class="linecomment">;; (@* "Core: selection")</span>
(defun anything-move-selection-common (move-func unit direction)
  "<span class="quote">Move the selection marker to a new position determined by
UNIT and DIRECTION.</span>"
  (unless (or (anything-empty-buffer-p (anything-buffer-get))
              (not (anything-window)))
    (with-anything-window
      (funcall move-func)
      (anything-skip-noncandidate-line direction)
      (anything-display-source-at-screen-top-maybe unit)
      (when (anything-get-previous-header-pos)
        (anything-mark-current-line))
      (anything-display-mode-line (anything-get-current-source)))))

(defun anything-display-source-at-screen-top-maybe (unit)
  (when (and anything-display-source-at-screen-top (eq unit 'source))
    (set-window-start (selected-window)
                      (save-excursion (forward-line -1) (point)))))

(defun anything-skip-noncandidate-line (direction)
  (anything-skip-header-and-separator-line direction)
  (and (bobp) (forward-line 1))     <span class="linecomment">;skip first header</span>
  (and (eobp) (forward-line -1))    <span class="linecomment">;avoid last empty line</span>
  )

(defun anything-skip-header-and-separator-line (direction)
  (while (and (not (bobp))
              (or (anything-pos-header-line-p)
                  (anything-pos-candidate-separator-p)))
    (forward-line (if (and (eq direction 'previous)
                           (not (eq (point-at-bol) (point-min))))
                      -1
                    1))))

(defvar anything-mode-line-string-real nil)
(defun anything-display-mode-line (source)
  (set (make-local-variable 'anything-mode-line-string)
       (anything-interpret-value (or (assoc-default 'mode-line source)
                                     (default-value 'anything-mode-line-string))
                                 source))
  (if anything-mode-line-string
      (setq mode-line-format
            '("<span class="quote"> </span>" mode-line-buffer-identification "<span class="quote"> </span>"
              (line-number-mode "<span class="quote">%l</span>") "<span class="quote"> </span>" (anything-follow-mode "<span class="quote">(F)</span>")
              "<span class="quote"> </span>" anything-mode-line-string-real "<span class="quote">-%-</span>")
            anything-mode-line-string-real
            (substitute-command-keys anything-mode-line-string))
    (setq mode-line-format
          (default-value 'mode-line-format)))
  (setq header-line-format
        (anything-interpret-value (assoc-default 'header-line source) source)))

(defun anything-previous-line ()
  "<span class="quote">Move selection to the previous line.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (if (not (anything-pos-multiline-p))
         (forward-line -1)      <span class="linecomment">;double forward-line is meaningful</span>
       (forward-line -1)        <span class="linecomment">;because evaluation order is important</span>
       (anything-skip-header-and-separator-line 'previous)
       (let ((header-pos (anything-get-previous-header-pos))
             (separator-pos (anything-get-previous-candidate-separator-pos)))
         (when header-pos
           (goto-char (if (or (null separator-pos) (&lt; separator-pos header-pos))
                          header-pos <span class="linecomment">; first candidate</span>
                        separator-pos))
           (forward-line 1)))))
   'line 'previous))

(defun anything-next-line ()
  "<span class="quote">Move selection to the next line.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (if (not (anything-pos-multiline-p))
         (forward-line 1)
       (let ((header-pos (anything-get-next-header-pos))
             (separator-pos (anything-get-next-candidate-separator-pos)))
         (cond ((and separator-pos
                     (or (null header-pos) (&lt; separator-pos header-pos)))
                (goto-char separator-pos))
               (header-pos
                (goto-char header-pos))))))
   'line 'next))

(defun anything-previous-page ()
  "<span class="quote">Move selection back with a pageful.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (condition-case nil
         (scroll-down)
       (beginning-of-buffer (goto-char (point-min)))))
   'page 'previous))

(defun anything-next-page ()
  "<span class="quote">Move selection forward with a pageful.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (condition-case nil
         (scroll-up)
       (end-of-buffer (goto-char (point-max)))))
   'page 'next))

(defun anything-beginning-of-buffer ()
  "<span class="quote">Move selection at the top.</span>"
  (interactive)
  (anything-move-selection-common (lambda () (goto-char (point-min)))
                                  'edge 'previous))

(defun anything-end-of-buffer ()
  "<span class="quote">Move selection at the bottom.</span>"
  (interactive)
  (anything-move-selection-common (lambda () (goto-char (point-max)))
                                  'edge 'next))

(defun anything-previous-source ()
  "<span class="quote">Move selection to the previous source.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (forward-line -1)
     (if (bobp)
         (goto-char (point-max))
       (anything-skip-header-and-separator-line 'previous))
     (goto-char (anything-get-previous-header-pos))
     (forward-line 1))
   'source 'previous))

(defun anything-next-source ()
  "<span class="quote">Move selection to the next source.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda () (goto-char (or (anything-get-next-header-pos) (point-min))))
   'source 'next))

(defun anything-goto-source (source-or-name)
  "<span class="quote">Move the selection to the source (SOURCE-OR-NAME).</span>"
  (anything-move-selection-common
   (lambda ()
     (goto-char (point-min))
     (let ((name (if (stringp source-or-name) source-or-name
                   (assoc-default 'name source-or-name))))
       (condition-case err
           (while (not (string= name (anything-current-line-contents)))
             (goto-char (anything-get-next-header-pos)))
         (error (message "<span class="quote"></span>")))))
   'source 'next))

(defun anything-mark-current-line ()
  "<span class="quote">Move selection overlay to current line.</span>"
  (move-overlay
   anything-selection-overlay (point-at-bol)
   (if (anything-pos-multiline-p)
       (let ((header-pos (anything-get-next-header-pos))
             (separator-pos (anything-get-next-candidate-separator-pos)))
         (or (and (null header-pos) separator-pos)
             (and header-pos separator-pos (&lt; separator-pos header-pos)
                  separator-pos)
             header-pos
             (point-max)))
     (1+ (point-at-eol))))
  (anything-follow-execute-persistent-action-maybe))

(defun anything-this-command-key ()
  (event-basic-type (elt (this-command-keys-vector) 0)))
<span class="linecomment">;; (progn (read-key-sequence "Key: ") (p (anything-this-command-key)))</span>

(defun anything-select-with-shortcut-internal (types get-key-func)
  (if (memq anything-enable-shortcuts types)
      (save-selected-window
        (select-window (anything-window))          
        (let* ((key (funcall get-key-func))
               (overlay (ignore-errors (nth (position key anything-shortcut-keys)
                                            anything-digit-overlays))))
          (if (not (and overlay (overlay-buffer overlay)))
              (when (numberp key)
                (select-window (minibuffer-window))
                (self-insert-command 1))
            (goto-char (overlay-start overlay))
            (anything-mark-current-line)
            (anything-exit-minibuffer))))
    (self-insert-command 1)))

(defun anything-select-with-prefix-shortcut ()
  "<span class="quote">Invoke default action with prefix shortcut.</span>"
  (interactive)
  (anything-select-with-shortcut-internal
   '(prefix)
   (lambda () (read-event "<span class="quote">Select shortcut key: </span>"))))

(defun anything-select-with-digit-shortcut ()
  "<span class="quote">Invoke default action with digit/alphabet shortcut.</span>"
  (interactive)
  (anything-select-with-shortcut-internal
   '(alphabet t) 'anything-this-command-key))

<span class="linecomment">;; (setq anything-enable-shortcuts 'prefix)</span>
<span class="linecomment">;; (define-key anything-map "@" 'anything-select-with-prefix-shortcut)</span>
<span class="linecomment">;; (define-key anything-map (kbd "&lt;f18&gt;") 'anything-select-with-prefix-shortcut)</span>

(defun anything-exit-minibuffer ()
  "<span class="quote">Select the current candidate by exiting the minibuffer.</span>"
  (interactive)
  (declare (special anything-iswitchb-candidate-selected))
  (setq anything-iswitchb-candidate-selected (anything-get-selection))
  (exit-minibuffer))

(defun anything-keyboard-quit ()
  "<span class="quote">Quit minibuffer in anything.

If action buffer is displayed, kill it.</span>"
  (interactive)
  (when (get-buffer-window anything-action-buffer 'visible)
    (kill-buffer anything-action-buffer))
  (abort-recursive-edit))

(defun anything-get-next-header-pos ()
  "<span class="quote">Return the position of the next header from point.</span>"
  (next-single-property-change (point) 'anything-header))


(defun anything-get-previous-header-pos ()
  "<span class="quote">Return the position of the previous header from point</span>"
  (previous-single-property-change (point) 'anything-header))


(defun anything-pos-multiline-p ()
  "<span class="quote">Return non-nil if the current position is in the multiline source region.</span>"
  (get-text-property (point) 'anything-multiline))


(defun anything-get-next-candidate-separator-pos ()
  "<span class="quote">Return the position of the next candidate separator from point.</span>"
  (next-single-property-change (point) 'anything-candidate-separator))


(defun anything-get-previous-candidate-separator-pos ()
  "<span class="quote">Return the position of the previous candidate separator from point.</span>"
  (previous-single-property-change (point) 'anything-candidate-separator))


(defun anything-pos-header-line-p ()
  "<span class="quote">Return t if the current line is a header line.</span>"
  (or (get-text-property (point-at-bol) 'anything-header)
      (get-text-property (point-at-bol) 'anything-header-separator)))

(defun anything-pos-candidate-separator-p ()
  "<span class="quote">Return t if the current line is a candidate separator.</span>"
  (get-text-property (point-at-bol) 'anything-candidate-separator))

<span class="linecomment">;; (@* "Core: help")</span>
(defun anything-help-internal (bufname insert-content-fn)
  "<span class="quote">Show long message during `anything' session.</span>"
  (save-window-excursion
    (select-window (anything-window))
    (delete-other-windows)
    (switch-to-buffer (get-buffer-create bufname))
    (erase-buffer)
    (funcall insert-content-fn)
    (setq mode-line-format "<span class="quote">%b (SPC,C-v:NextPage  b,M-v:PrevPage  other:Exit)</span>")
    (setq cursor-type nil)
    (goto-char 1)
    (anything-help-event-loop)))

(defun anything-help-event-loop ()
  (ignore-errors
    (loop for event = (read-event) do
          (case event
            ((?\C-v ? )  (scroll-up))
            ((?\M-v ?b) (scroll-down))
            (t (return))))))

(defun anything-help ()
  "<span class="quote">Help of `anything'.</span>"
  (interactive)
  (anything-help-internal
   "<span class="quote"> *Anything Help*</span>"
   (lambda ()
     (insert (substitute-command-keys
              (anything-interpret-value anything-help-message)))
     (org-mode))))

(defun anything-debug-output ()
  "<span class="quote">Show all anything-related variables at this time.</span>"
  (interactive)
  (anything-help-internal "<span class="quote"> *Anything Debug*</span>" 'anything-debug-output-function))

(defun anything-debug-output-function (&optional vars)
  (message "<span class="quote">Calculating all anything-related values...</span>")
  (insert "<span class="quote">If you debug some variables or forms, set `anything-debug-forms'
to a list of forms.\n\n</span>")
  (dolist (v (or vars
                 anything-debug-forms
                 (apropos-internal "<span class="quote">^anything-</span>" 'boundp)))
    (insert "<span class="quote">** </span>"
            (pp-to-string v) "<span class="quote">\n</span>"
            (pp-to-string (eval v)) "<span class="quote">\n</span>"))
  (message "<span class="quote">Calculating all anything-related values...Done</span>"))

<span class="linecomment">;; (@* "Core: misc")</span>
(defun anything-kill-buffer-hook ()
  "<span class="quote">Remove tick entry from `anything-tick-hash' when killing a buffer.</span>"
  (loop for key being the hash-keys in anything-tick-hash
        if (string-match (format "<span class="quote">^%s/</span>" (regexp-quote (buffer-name))) key)
        do (remhash key anything-tick-hash)))
(add-hook 'kill-buffer-hook 'anything-kill-buffer-hook)

(defun anything-maybe-fit-frame ()
  "<span class="quote">Fit anything frame to its buffer, and put it at top right of display.

It is disabled by default because some flickering occurred in some environment.
To enable fitting, set both `anything-inhibit-fit-frame-flag' and
 `fit-frame-inhibit-fitting' to nil.
You can set user options `fit-frame-max-width-percent' and
`fit-frame-max-height-percent' to control max frame size.</span>"
  (declare (warn (unresolved 0)))
  (when (and (not anything-inhibit-fit-frame-flag)
             (anything-window)
             (require 'fit-frame nil t)
             (boundp 'fit-frame-inhibit-fitting-flag)
             (not fit-frame-inhibit-fitting-flag))
    (ignore-errors
      (with-anything-window
        (fit-frame nil nil nil t)
        (modify-frame-parameters
         (selected-frame)
         `((left . ,(- (x-display-pixel-width) (+ (frame-pixel-width) 7)))
           (top . 0))))))) <span class="linecomment">; The (top . 0) shouldn't be necessary (Emacs bug).</span>

(defun anything-preselect (candidate-or-regexp)
  (with-anything-window
    (when candidate-or-regexp
      (goto-char (point-min))
      <span class="linecomment">;; go to first candidate of first source</span>
      (forward-line 1)
      (let ((start (point)))
        (unless (or (re-search-forward
                     (concat "<span class="quote">^</span>" (regexp-quote candidate-or-regexp) "<span class="quote">$</span>")
                     nil t)
                    (progn (goto-char start)
                           (re-search-forward candidate-or-regexp nil t)))
          (goto-char start))))
    (anything-mark-current-line)))

(defun anything-delete-current-selection ()
  "<span class="quote">Delete the currently selected item.</span>"
  (interactive)
  (with-anything-window
    (cond ((anything-pos-multiline-p)
           (anything-aif (anything-get-next-candidate-separator-pos)
               (delete-region (point-at-bol)
                              (1+ (progn (goto-char it) (point-at-eol))))
             <span class="linecomment">;; last candidate</span>
             (goto-char (anything-get-previous-candidate-separator-pos))
             (delete-region (point-at-bol) (point-max)))
           (when (eobp)
             (goto-char (or (anything-get-previous-candidate-separator-pos)
                            (point-min)))
             (forward-line 1)))
          (t
           (delete-region (point-at-bol) (1+ (point-at-eol)))
           (when (eobp) (forward-line -1))))
    (anything-mark-current-line)))

(defun anything-edit-current-selection-internal (func)
  (with-anything-window
    (beginning-of-line)
    (let ((realvalue (get-text-property (point) 'anything-realvalue)))
      (funcall func)
      (beginning-of-line)
      (and realvalue
           (put-text-property (point) (point-at-eol)
                              'anything-realvalue realvalue))
      (anything-mark-current-line))))

(defmacro anything-edit-current-selection (&rest forms)
  "<span class="quote">Evaluate FORMS at current selection in the anything buffer.
You can edit the line.</span>"
  `(anything-edit-current-selection-internal
    (lambda () ,@forms)))
(put 'anything-edit-current-selection 'lisp-indent-function 0)

(defun anything-set-pattern (pattern &optional noupdate)
  "<span class="quote">Set minibuffer contents to PATTERN.
if optional NOUPDATE is non-nil, anything buffer is not changed.</span>"
  (with-selected-window (minibuffer-window)
    (delete-minibuffer-contents)
    (insert pattern))
  (when noupdate
    (setq anything-pattern pattern)
    (anything-hooks 'cleanup)
    (run-with-idle-timer 0 nil 'anything-hooks 'setup)))

(defun anything-delete-minibuffer-contents ()
  "<span class="quote">Same as `delete-minibuffer-contents' but this is a command.</span>"
  (interactive)
  (anything-set-pattern "<span class="quote"></span>"))
(defalias 'anything-delete-minibuffer-content 'anything-delete-minibuffer-contents)

<span class="linecomment">;; (@* "Built-in plug-in: type")</span>
(defun anything-compile-source--type (source)
  (anything-aif (assoc-default 'type source)
      (append source (assoc-default it anything-type-attributes) nil)
    source))

<span class="linecomment">;; `define-anything-type-attribute' is public API.</span>

(defun anything-add-type-attribute (type definition)
  (anything-aif (assq type anything-type-attributes)
      (setq anything-type-attributes (delete it anything-type-attributes)))
  (push (cons type definition) anything-type-attributes))

(defvar anything-types nil)
(defun anything-document-type-attribute (type doc)
  (add-to-list 'anything-types type t)
  (put type 'anything-typeattrdoc
       (concat "<span class="quote">- </span>" (symbol-name type) "<span class="quote">\n\n</span>" doc "<span class="quote">\n</span>")))

(defadvice documentation-property (after anything-document-type-attribute activate)
  "<span class="quote">Hack to display type attributes' documentation as `anything-type-attributes' docstring.</span>"
  (when (eq (ad-get-arg 0) 'anything-type-attributes)
    (setq ad-return-value
          (concat ad-return-value "<span class="quote">\n\n++++ Types currently defined ++++\n</span>"
                  (mapconcat (lambda (sym) (get sym 'anything-typeattrdoc))
                             anything-types "<span class="quote">\n</span>")))))

<span class="linecomment">;; (@* "Built-in plug-in: dummy")</span>
(defun anything-dummy-candidate (candidate source)
  <span class="linecomment">;; `source' is defined in filtered-candidate-transformer</span>
  (list anything-pattern))  

(defun anything-compile-source--dummy (source)
  (if (assoc 'dummy source)
      (append source
              '((candidates "<span class="quote">dummy</span>")
                (accept-empty)
                (match identity)
                (filtered-candidate-transformer . anything-dummy-candidate)
                (disable-shortcuts)
                (volatile)))
    source))

<span class="linecomment">;; (@* "Built-in plug-in: disable-shortcuts")</span>
(defvar anything-orig-enable-shortcuts nil)
(defun anything-save-enable-shortcuts ()
  (anything-once
   (lambda () (setq anything-orig-enable-shortcuts anything-enable-shortcuts
                    anything-enable-shortcuts nil))))
(defun anything-compile-source--disable-shortcuts (source)
  (if (assoc 'disable-shortcuts source)
      (append `((init ,@(anything-mklist (assoc-default 'init source))
                      anything-save-enable-shortcuts)
                (resume ,@(anything-mklist (assoc-default 'resume source))
                        anything-save-enable-shortcuts)
                (cleanup ,@(anything-mklist (assoc-default 'cleanup source))
                         (lambda () (setq anything-enable-shortcuts
                                          anything-orig-enable-shortcuts))))
              source)
    source))

<span class="linecomment">;; (@* "Built-in plug-in: candidates-in-buffer")</span>
(defun anything-candidates-in-buffer ()
  "<span class="quote">Get candidates from the candidates buffer according to `anything-pattern'.

BUFFER is `anything-candidate-buffer' by default.  Each
candidate must be placed in one line.  This function is meant to
be used in candidates-in-buffer or candidates attribute of an
anything source.  Especially fast for many (1000+) candidates.

eg.
 '((name . \"many files\")
   (init . (lambda () (with-current-buffer (anything-candidate-buffer 'local)
                        (insert-many-filenames))))
   (search re-search-forward)  ; optional
   (candidates-in-buffer)
   (type . file))

+===============================================================+
| The new way of making and narrowing candidates: Using buffers |
+===============================================================+

By default, `anything' makes candidates by evaluating the
candidates function, then narrows them by `string-match' for each
candidate.

But this way is very slow for many candidates. The new way is
storing all candidates in a buffer and narrowing them by
`re-search-forward'. Search function is customizable by search
attribute. The important point is that buffer processing is MUCH
FASTER than string list processing and is the Emacs way.

The init function writes all candidates to a newly-created
candidate buffer.  The candidates buffer is created or specified
by `anything-candidate-buffer'.  Candidates are stored in a line.

The candidates function narrows all candidates, IOW creates a
subset of candidates dynamically. It is the task of
`anything-candidates-in-buffer'.  As long as
`anything-candidate-buffer' is used,`(candidates-in-buffer)' is
sufficient in most cases.

Note that `(candidates-in-buffer)' is shortcut of three attributes:
  (candidates . anything-candidates-in-buffer)
  (volatile)
  (match identity)
And `(candidates-in-buffer . func)' is shortcut of three attributes:
  (candidates . func)
  (volatile)
  (match identity)
The expansion is performed in `anything-get-sources'.

The candidates-in-buffer attribute implies the volatile attribute.
The volatile attribute is needed because `anything-candidates-in-buffer'
creates candidates dynamically and need to be called everytime
`anything-pattern' changes.

Because `anything-candidates-in-buffer' plays the role of `match' attribute
function, specifying `(match identity)' makes the source slightly faster.

To customize `anything-candidates-in-buffer' behavior, use search,
get-line and search-from-end attributes. See also `anything-sources' docstring.
</span>"
  (declare (special source))
  (anything-candidates-in-buffer-1 (anything-candidate-buffer)
                                   anything-pattern
                                   (or (assoc-default 'get-line source)
                                       #'buffer-substring-no-properties)
                                   <span class="linecomment">;; use external variable `source'.</span>
                                   (or (assoc-default 'search source)
                                       (if (assoc 'search-from-end source)
                                           '(re-search-backward)
                                         '(re-search-forward)))
                                   (anything-candidate-number-limit source)
                                   (assoc 'search-from-end source)))

(defun anything-candidates-in-buffer-1 (buffer pattern get-line-fn search-fns limit search-from-end)
  <span class="linecomment">;; buffer == nil when candidates buffer does not exist.</span>
  (when buffer
    (with-current-buffer buffer
      (let ((start-point (if search-from-end (point-max) (point-min)))
            (endp (if search-from-end #'bobp #'eobp)))
        (goto-char (1- start-point))
        (if (string= pattern "<span class="quote"></span>")
            (anything-initial-candidates-from-candidate-buffer
             endp get-line-fn limit search-from-end)
          (anything-search-from-candidate-buffer
           pattern get-line-fn search-fns limit search-from-end
           start-point endp))))))

(defun anything-point-is-moved (proc)
  "<span class="quote">If point is moved after executing PROC, return t, otherwise nil.</span>"
  (/= (point) (progn (funcall proc) (point))))

(defun anything-search-from-candidate-buffer (pattern get-line-fn search-fns
                                                      limit search-from-end
                                                      start-point endp)
  (let (buffer-read-only
        matches exit newmatches)
    (anything-search-from-candidate-buffer-internal
     (lambda ()
       (clrhash anything-cib-hash)
       (dolist (searcher search-fns)
         (goto-char start-point)
         (setq newmatches nil)
         (loop with item-count = 0
               while (funcall searcher pattern nil t)
               for cand = (funcall get-line-fn (point-at-bol) (point-at-eol))
               do (anything-accumulate-candidates-internal
                   cand newmatches anything-cib-hash item-count limit)
               unless (anything-point-is-moved
                       (lambda ()
                         (if search-from-end
                             (goto-char (1- (point-at-bol)))
                           (forward-line 1))))
               return nil)
         (setq matches (append matches (nreverse newmatches)))
         (if exit (return)))
       (delq nil matches)))))

(defun anything-initial-candidates-from-candidate-buffer (endp get-line-fn limit search-from-end)
  (delq nil (loop with next-line-fn =
                  (if search-from-end
                      (lambda (x) (goto-char (max (1- (point-at-bol)) 1)))
                    #'forward-line)
                  until (funcall endp)
                  for i from 1 to limit
                  collect (funcall get-line-fn (point-at-bol) (point-at-eol))
                  do (funcall next-line-fn 1))))

(defun anything-search-from-candidate-buffer-internal (search-fn)
  (goto-char (point-min))
  (insert "<span class="quote">\n</span>")
  (goto-char (point-max))
  (insert "<span class="quote">\n</span>")
  (unwind-protect
      (funcall search-fn)
    (goto-char (point-min))
    (delete-char 1)
    (goto-char (1- (point-max)))
    (delete-char 1)
                
    (set-buffer-modified-p nil)))

(defun anything-candidate-buffer (&optional create-or-buffer)
  "<span class="quote">Register and return a buffer containing candidates of current source.
`anything-candidate-buffer' searches buffer-local candidates buffer first,
then global candidates buffer.

Acceptable values of CREATE-OR-BUFFER:

- nil (omit)
  Only return the candidates buffer.
- a buffer
  Register a buffer as a candidates buffer.
- 'global
  Create a new global candidates buffer,
  named \" *anything candidates:SOURCE*\".
- other non-nil value
  Create a new local candidates buffer,
  named \" *anything candidates:SOURCE*ANYTHING-CURRENT-BUFFER\".
</span>"
  (let* ((global-bname (format "<span class="quote"> *anything candidates:%s*</span>" anything-source-name))
         (local-bname (format "<span class="quote"> *anything candidates:%s*%s</span>"
                              anything-source-name
                              (buffer-name anything-current-buffer)))
         (register-func
          (lambda ()
            (setq anything-candidate-buffer-alist
                  (cons (cons anything-source-name create-or-buffer)
                        (delete (assoc anything-source-name
                                       anything-candidate-buffer-alist)
                                anything-candidate-buffer-alist)))))
         (kill-buffers-func
          (lambda ()
            (loop for b in (buffer-list)
                  if (string-match (format "<span class="quote">^%s</span>" (regexp-quote global-bname))
                                   (buffer-name b))
                  do (kill-buffer b))))
         (create-func
          (lambda ()
            (with-current-buffer
                (get-buffer-create (if (eq create-or-buffer 'global)
                                       global-bname
                                     local-bname))
              (buffer-disable-undo)
              (erase-buffer)
              (font-lock-mode -1))))
         (return-func
          (lambda ()
            (or (get-buffer local-bname)
                (get-buffer global-bname)
                (anything-aif (assoc-default anything-source-name
                                             anything-candidate-buffer-alist)
                    (and (buffer-live-p it) it))))))
    (when create-or-buffer
      (funcall register-func)
      (unless (bufferp create-or-buffer) 
        (and (eq create-or-buffer 'global) (funcall kill-buffers-func))
        (funcall create-func)))
    (funcall return-func)))

(defun anything-compile-source--candidates-in-buffer (source)
  (anything-aif (assoc 'candidates-in-buffer source)
      (append source
              `((candidates . ,(or (cdr it) 'anything-candidates-in-buffer))
                (volatile) (match identity)))
    source))

<span class="linecomment">;; (@* "Utility: resplit anything window")</span>
(defun anything-toggle-resplit-window ()
  "<span class="quote">Toggle resplit anything window, vertically or horizontally.</span>"
  (interactive)
  (with-anything-window
    (let ((before-height (window-height)))
      (delete-window)
      (set-window-buffer
       (select-window (if (= (window-height) before-height)
                          (split-window-vertically)
                        (split-window-horizontally)))
       anything-buffer))))

<span class="linecomment">;; (@* "Utility: select another action by key")</span>
(defun anything-select-nth-action (n)
  "<span class="quote">Select the nth action for the currently selected candidate.</span>"
  (setq anything-saved-selection (anything-get-selection))
  (unless anything-saved-selection
    (error "<span class="quote">Nothing is selected.</span>"))
  (setq anything-saved-action (anything-get-nth-action n (anything-get-action)))
  (anything-exit-minibuffer))

(defun anything-get-nth-action (n action)
  (cond ((and (zerop n) (functionp action))
         action)
        ((listp action)
         (or (cdr (elt action n))
             (error "<span class="quote">No such action</span>")))
        ((and (functionp action) (&lt; 0 n))
         (error "<span class="quote">Sole action.</span>"))
        (t
         (error "<span class="quote">Error in `anything-select-nth-action'.</span>"))))

(defun anything-select-2nd-action ()
  "<span class="quote">Select the 2nd action for the currently selected candidate.</span>"
  (interactive)
  (anything-select-nth-action 1))

(defun anything-select-3rd-action ()
  "<span class="quote">Select the 3rd action for the currently selected candidate.</span>"
  (interactive)
  (anything-select-nth-action 2))

(defun anything-select-4th-action ()
  "<span class="quote">Select the 4th action for the currently selected candidate.</span>"
  (interactive)
  (anything-select-nth-action 3))

(defun anything-select-2nd-action-or-end-of-line ()
  "<span class="quote">Select the 2nd action for the currently selected candidate if the point is at the end of minibuffer.
Otherwise goto the end of minibuffer.</span>"
  (interactive)
  (if (eolp)
      (anything-select-nth-action 1)
    (end-of-line)))

<span class="linecomment">;; (@* "Utility: Persistent Action")</span>
(defmacro with-anything-display-same-window (&rest body)
  "<span class="quote">Make `pop-to-buffer' and `display-buffer' display in the same window.</span>"
  `(let ((display-buffer-function 'anything-persistent-action-display-buffer))
     ,@body))
(put 'with-anything-display-same-window 'lisp-indent-function 0)

(defvar anything-persistent-action-display-window nil)
(defun anything-initialize-persistent-action ()
  (set (make-local-variable 'anything-persistent-action-display-window) nil))

(defun* anything-execute-persistent-action (&optional (attr 'persistent-action))
  "<span class="quote">If a candidate is selected then perform the associated action without quitting anything.</span>"
  (interactive)
  (anything-log "<span class="quote">executing persistent-action</span>")
  (save-selected-window
    (anything-select-persistent-action-window)
    (anything-log-eval (current-buffer))
    (let ((anything-in-persistent-action t))
      (with-anything-display-same-window
        (anything-execute-selection-action
         nil
         (or (assoc-default attr (anything-get-current-source))
             (anything-get-action))
         t)
        (anything-log-run-hook 'anything-after-persistent-action-hook)))))

(defun anything-persistent-action-display-window ()
  (with-current-buffer anything-buffer
    (setq anything-persistent-action-display-window
          (cond ((window-live-p anything-persistent-action-display-window)
                 anything-persistent-action-display-window)
                ((and anything-samewindow (one-window-p t))
                 (split-window))
                ((get-buffer-window anything-current-buffer))
                (t
                 (next-window (selected-window) 1))))))

(defun anything-select-persistent-action-window ()
  (select-window (get-buffer-window (anything-buffer-get)))
  (select-window
   (setq minibuffer-scroll-window (anything-persistent-action-display-window))))

(defun anything-persistent-action-display-buffer (buf &optional not-this-window)
  "<span class="quote">Make `pop-to-buffer' and `display-buffer' display in the same window in persistent action.
If `anything-persistent-action-use-special-display' is non-nil and
BUF is to be displayed by `special-display-function', use it.
Otherwise ignores `special-display-buffer-names' and `special-display-regexps'.</span>"
  (let* ((name (buffer-name buf))
         display-buffer-function pop-up-windows
         (same-window-regexps
          (unless (and anything-persistent-action-use-special-display
                       (or (member name
                                   (mapcar (lambda (x) (or (car-safe x) x))
                                           special-display-buffer-names))
                           (remove-if-not
                            (lambda (x) (string-match (or (car-safe x) x) name))
                            special-display-regexps)))
            '("<span class="quote">.</span>"))))
    (display-buffer buf not-this-window)))

<span class="linecomment">;; scroll-other-window(-down)? for persistent-action</span>
(defun anything-scroll-other-window-base (command)
  (with-selected-window (anything-persistent-action-display-window)
    (funcall command anything-scroll-amount)))

(defun anything-scroll-other-window ()
  "<span class="quote">Scroll other window (not *Anything* window) upward.</span>"
  (interactive)
  (anything-scroll-other-window-base 'scroll-up))
(defun anything-scroll-other-window-down ()
  "<span class="quote">Scroll other window (not *Anything* window) downward.</span>"
  (interactive)
  (anything-scroll-other-window-base 'scroll-down))

<span class="linecomment">;; (@* "Utility: Visible Mark")</span>
(defface anything-visible-mark
  '((((min-colors 88) (background dark))
     (:background "<span class="quote">green1</span>" :foreground "<span class="quote">black</span>"))
    (((background dark)) (:background "<span class="quote">green</span>" :foreground "<span class="quote">black</span>"))
    (((min-colors 88)) (:background "<span class="quote">green1</span>"))
    (t (:background "<span class="quote">green</span>")))
  "<span class="quote">Face for visible mark.</span>"
  :group 'anything)
(defvar anything-visible-mark-face 'anything-visible-mark)
(defvar anything-visible-mark-overlays nil)

(defun anything-clear-visible-mark ()
  (with-current-buffer (anything-buffer-get)
    (mapc 'delete-overlay anything-visible-mark-overlays)
    (set (make-local-variable 'anything-visible-mark-overlays) nil)))
(add-hook 'anything-after-initialize-hook 'anything-clear-visible-mark)

(defvar anything-c-marked-candidate-list nil
  "<span class="quote">[OBSOLETE] DO NOT USE!!</span>")
(defvar anything-marked-candidates nil
  "<span class="quote">Marked candadates. List of (source . real) pair.</span>")

(defun anything-this-visible-mark ()
  (loop for o in anything-visible-mark-overlays
        when (equal (point-at-bol) (overlay-start o))
        do   (return o)))

(defun anything-delete-visible-mark (overlay)
  (setq anything-c-marked-candidate-list
        (remove (anything-current-line-contents) anything-c-marked-candidate-list))
  (setq anything-marked-candidates
        (remove
         (cons (anything-get-current-source) (anything-get-selection))
         anything-marked-candidates))
  (delete-overlay overlay)
  (setq anything-visible-mark-overlays
        (delq overlay anything-visible-mark-overlays)))

(defun anything-make-visible-mark ()
  (let ((o (make-overlay (point-at-bol) (1+ (point-at-eol)))))
    (overlay-put o 'face anything-visible-mark-face)
    (overlay-put o 'source (assoc-default 'name (anything-get-current-source)))
    (overlay-put o 'string (buffer-substring (overlay-start o) (overlay-end o)))
    (add-to-list 'anything-visible-mark-overlays o))
  (push (anything-current-line-contents) anything-c-marked-candidate-list)
  (push (cons (anything-get-current-source) (anything-get-selection))
        anything-marked-candidates))

(defun anything-toggle-visible-mark ()
  "<span class="quote">Toggle anything visible mark at point.</span>"
  (interactive)
  (with-anything-window
    (anything-aif (anything-this-visible-mark)
        (anything-delete-visible-mark it)
      (anything-make-visible-mark))
    (anything-next-line)))

(defun anything-display-all-visible-marks ()
  "<span class="quote">Show all `anything' visible marks strings.</span>"
  (interactive)
  (with-anything-window
    (lexical-let ((overlays (reverse anything-visible-mark-overlays)))
      (anything-run-after-quit
       (lambda ()
         (with-output-to-temp-buffer "<span class="quote">*anything visible marks*</span>"
           (dolist (o overlays) (princ (overlay-get o 'string)))))))))

(defun anything-marked-candidates ()
  "<span class="quote">Marked candidates (real value) of current source if any,
otherwise 1-element list of current selection.

It is analogous to `dired-get-marked-files'.</span>"
  (with-current-buffer (anything-buffer-get)
    (let ((cands
           (if anything-marked-candidates
               (loop with current-src = (anything-get-current-source)
                     for (source . real) in (reverse anything-marked-candidates)
                     when (equal current-src source)
                     collect (anything-coerce-selection real source))
             (list (anything-get-selection)))))
      (anything-log-eval cands)
      cands)))

(defun anything-reset-marked-candidates ()
  (with-current-buffer (anything-buffer-get)
    (set (make-local-variable 'anything-c-marked-candidate-list) nil)
    (set (make-local-variable 'anything-marked-candidates) nil)))

(add-hook 'anything-after-initialize-hook 'anything-reset-marked-candidates)
<span class="linecomment">;; (add-hook 'anything-after-action-hook 'anything-reset-marked-candidates)</span>

(defun anything-current-source-name= (name)
  (save-excursion
    (goto-char (anything-get-previous-header-pos))
    (equal name (anything-current-line-contents))))

(defun anything-revive-visible-mark ()
  (with-current-buffer anything-buffer
    (dolist (o anything-visible-mark-overlays)
      (goto-char (point-min))
      (while (and (search-forward (overlay-get o 'string) nil t)
                  (anything-current-source-name= (overlay-get o 'source)))
        <span class="linecomment">;; Now the next line of visible mark</span>
        (move-overlay o (point-at-bol 0) (1+ (point-at-eol 0)))))))
(add-hook 'anything-update-hook 'anything-revive-visible-mark)

(defun anything-next-point-in-list (curpos points &optional prev)
  (cond
   <span class="linecomment">;; rule out special cases</span>
   ((null points)                        curpos)
   ((and prev (&lt; curpos (car points)))   curpos)
   ((&lt; (car (last points)) curpos)
    (if prev (car (last points)) curpos))
   (t
    (nth (if prev
             (loop for pt in points
                   for i from 0
                   if (&lt;= curpos pt)
                   do (return (1- i)))
           (loop for pt in points
                 for i from 0
                 if (&lt; curpos pt)
                 do (return i)))
         points))))

(defun anything-next-visible-mark (&optional prev)
  "<span class="quote">Move next anything visible mark.</span>"
  (interactive)
  (with-anything-window
    (goto-char (anything-next-point-in-list
                (point)
                (sort (mapcar 'overlay-start anything-visible-mark-overlays) '&lt;)
                prev))
    (anything-mark-current-line)))

(defun anything-prev-visible-mark ()
  "<span class="quote">Move previous anything visible mark.</span>"
  (interactive)
  (anything-next-visible-mark t))

<span class="linecomment">;; (@* "Utility: `find-file' integration")</span>
(defun anything-quit-and-find-file ()
  "<span class="quote">Drop into `find-file' from `anything' like `iswitchb-find-file'.
If current selection is a buffer or a file, `find-file' from its directory.</span>"
  (interactive)
  (anything-run-after-quit
   (lambda (f)
     (if (file-exists-p f)
         (let ((default-directory (file-name-directory f)))
           (call-interactively 'find-file))
       (call-interactively 'find-file)))
   (anything-aif (get-buffer (anything-get-selection))
       (buffer-file-name it)
     (expand-file-name (anything-get-selection)))))

<span class="linecomment">;; (@* "Utility: Selection Paste")</span>
(defun anything-yank-selection ()
  "<span class="quote">Set minibuffer contents to current selection.</span>"
  (interactive)
  (anything-set-pattern (anything-get-selection nil t)))

(defun anything-kill-selection-and-quit ()
  "<span class="quote">Store current selection to kill ring.
You can paste it by typing C-y.</span>"
  (interactive)
  (anything-run-after-quit
   (lambda (sel)
     (kill-new sel)
     (message "<span class="quote">Killed: %s</span>" sel))
   (anything-get-selection nil t)))


<span class="linecomment">;; (@* "Utility: Automatical execution of persistent-action")</span>
(add-to-list 'minor-mode-alist '(anything-follow-mode "<span class="quote"> AFollow</span>"))
(defun anything-follow-mode ()
  "<span class="quote">If this mode is on, persistent action is executed everytime the cursor is moved.</span>"
  (interactive)
  (with-current-buffer anything-buffer
    (setq anything-follow-mode (not anything-follow-mode))
    (message "<span class="quote">anything-follow-mode is %s</span>"
             (if anything-follow-mode "<span class="quote">enabled</span>" "<span class="quote">disabled</span>"))))

(defun anything-follow-execute-persistent-action-maybe ()
  "<span class="quote">Execute persistent action after `anything-input-idle-delay' secs when `anything-follow-mode' is enabled.</span>"
  (and (not (get-buffer-window anything-action-buffer 'visible))
       (buffer-local-value 'anything-follow-mode
                           (get-buffer-create anything-buffer))
       (sit-for anything-input-idle-delay)
       (anything-window)
       (anything-get-selection)
       (save-excursion
         (anything-execute-persistent-action))))

<span class="linecomment">;; (@* "Utility: Migrate `anything-sources' to my-anything command")</span>
(defun anything-migrate-sources ()
  "<span class="quote">Help to migrate to new `anything' way.</span>"
  (interactive)
  (with-current-buffer (get-buffer-create "<span class="quote">*anything migrate*</span>")
    (erase-buffer)
    (insert (format "<span class="quote">\
Setting `anything-sources' directly is not good because
`anything' is not for one command.  For now, interactive use of
`anything' (M-x anything) is only for demonstration purpose.
So you should define commands calling `anything'.
I help you to migrate to the new way.

The code below is automatically generated from current
`anything-sources' value. You can use the `my-anything' command
now!

Copy and paste it to your .emacs. Then substitute `my-anything'
for `anything' bindings in all `define-key', `local-set-key' and
`global-set-key' calls.

\(defun my-anything ()
  \"Anything command for you.

It is automatically generated by `anything-migrate-sources'.\"
  (interactive)
  (anything-other-buffer
    '%S
    \"*my-anything*\"))
</span>" anything-sources))
    (eval-last-sexp nil)
    (substitute-key-definition 'anything 'my-anything global-map)
    (pop-to-buffer (current-buffer))))

<span class="linecomment">;; (@* "Utility: Incremental search within results (unmaintained)")</span>

(defvar anything-isearch-original-global-map nil
  "<span class="quote">Original global map before Anything isearch is started.</span>")

(defvar anything-isearch-original-message-timeout nil
  "<span class="quote">Original message timeout before Anything isearch is started.</span>")

(defvar anything-isearch-pattern nil
  "<span class="quote">The current isearch pattern.</span>")

(defvar anything-isearch-message-suffix "<span class="quote"></span>"
  "<span class="quote">Message suffix indicating the current state of the search.</span>")

(defvar anything-isearch-original-point nil
  "<span class="quote">Original position of point before isearch is started.</span>")

(defvar anything-isearch-original-window nil
  "<span class="quote">Original selected window before isearch is started.</span>")

(defvar anything-isearch-original-cursor-in-non-selected-windows nil
  "<span class="quote">Original value of cursor-in-non-selected-windows before isearch is started.</span>")

(defvar anything-isearch-original-deferred-action-list nil
  "<span class="quote">Original value of deferred-action-list before isearch is started.</span>")

(defvar anything-isearch-match-positions nil
  "<span class="quote">Stack of positions of matches or non-matches.

It's a list of plists with two properties: `event', the last user
 event, `start', the start position of the current match, and
 `pos', the position of point after that event.

The value of `event' can be the following symbols: `char' if a
character was typed, `error' if a non-matching character was
typed, `search' if a forward search had to be done after a
character, and `search-again' if a search was done for the next
occurrence of the current pattern.</span>")

(defvar anything-isearch-match-start nil
  "<span class="quote">Start position of the current match.</span>")


(defun anything-isearch ()
  "<span class="quote">Start incremental search within results. (UNMAINTAINED)</span>"
  (interactive)
  (if (anything-empty-buffer-p (anything-buffer-get))
      (message "<span class="quote">There are no results.</span>")

    (setq anything-isearch-original-message-timeout minibuffer-message-timeout)
    (setq minibuffer-message-timeout nil)

    (setq anything-isearch-original-global-map global-map)

    (condition-case nil
        (progn
          (setq anything-isearch-original-window (selected-window))
          (select-window (anything-window))
          (setq cursor-type t)

          (setq anything-isearch-original-deferred-action-list
                (default-value 'deferred-action-list))
          (setq-default deferred-action-list nil)
          (add-hook 'deferred-action-list 'anything-isearch-post-command)

          (use-global-map anything-isearch-map)
          (setq overriding-terminal-local-map anything-isearch-map)

          (setq anything-isearch-pattern "<span class="quote"></span>")

          (setq anything-isearch-original-cursor-in-non-selected-windows
                cursor-in-non-selected-windows)
          (setq cursor-in-non-selected-windows nil) 

          (setq anything-isearch-original-point (point-marker))
          (goto-char (point-min))
          (forward-line)
          (anything-mark-current-line)

          (setq anything-isearch-match-positions nil)
          (setq anything-isearch-match-start (point-marker))

          (if anything-isearch-overlay
              <span class="linecomment">;; make sure the overlay belongs to the anything buffer</span>
              (move-overlay anything-isearch-overlay (point-min) (point-min)
                            (get-buffer (anything-buffer-get)))

            (setq anything-isearch-overlay (make-overlay (point-min) (point-min)))
            (overlay-put anything-isearch-overlay 'face anything-isearch-match-face))

          (setq anything-isearch-message-suffix
                (substitute-command-keys "<span class="quote">cancel with \\[anything-isearch-cancel]</span>")))

      (error (anything-isearch-cleanup)))))


(defun anything-isearch-post-command ()
  "<span class="quote">Print the current pattern after every command.</span>"
  (anything-isearch-message)
  (when (anything-window)
    (with-anything-window
      (move-overlay anything-isearch-overlay anything-isearch-match-start (point)
                    (get-buffer (anything-buffer-get))))))


(defun anything-isearch-printing-char ()
  "<span class="quote">Add printing char to the pattern.</span>"
  (interactive)
  (let ((char (char-to-string last-command-event)))
    (setq anything-isearch-pattern (concat anything-isearch-pattern char))

    (with-anything-window
      (if (looking-at char)
          (progn
            (push (list 'event 'char
                        'start anything-isearch-match-start
                        'pos (point-marker))
                  anything-isearch-match-positions)
            (forward-char))

        (let ((start (point)))
          (while (and (re-search-forward anything-isearch-pattern nil t)
                      (anything-pos-header-line-p)))
          (if (or (anything-pos-header-line-p)
                  (eq start (point)))
              (progn
                (goto-char start)
                (push (list 'event 'error
                            'start anything-isearch-match-start
                            'pos (point-marker))
                      anything-isearch-match-positions))

            (push (list 'event 'search
                        'start anything-isearch-match-start
                        'pos (copy-marker start))
                  anything-isearch-match-positions)
            (setq anything-isearch-match-start
                  (copy-marker (match-beginning 0))))))
  
      (anything-mark-current-line))))


(defun anything-isearch-again ()
  "<span class="quote">Search again for the current pattern</span>"
  (interactive)
  (if (equal anything-isearch-pattern "<span class="quote"></span>")
      (setq anything-isearch-message-suffix "<span class="quote">no pattern yet</span>")

    (with-anything-window
      (let ((start (point)))
        (while (and (re-search-forward anything-isearch-pattern nil t)
                    (anything-pos-header-line-p)))
        (if (or (anything-pos-header-line-p)
                (eq start (point)))
            (progn
              (goto-char start)
              (unless (eq 'error
                          (plist-get (car anything-isearch-match-positions)
                                     'event))
                (setq anything-isearch-message-suffix "<span class="quote">no more matches</span>")))

          (push (list 'event 'search-again
                      'start anything-isearch-match-start
                      'pos (copy-marker start))
                anything-isearch-match-positions)
          (setq anything-isearch-match-start (copy-marker (match-beginning 0)))

          (anything-mark-current-line))))))


(defun anything-isearch-delete ()
  "<span class="quote">Undo last event.</span>"
  (interactive)
  (unless (equal anything-isearch-pattern "<span class="quote"></span>")
    (let ((last (pop anything-isearch-match-positions)))
      (unless (eq 'search-again (plist-get last 'event))
        (setq anything-isearch-pattern
              (substring anything-isearch-pattern 0 -1)))

      (with-anything-window      
        (goto-char (plist-get last 'pos))
        (setq anything-isearch-match-start (plist-get last 'start))
        (anything-mark-current-line)))))


(defun anything-isearch-default-action ()
  "<span class="quote">Execute the default action for the selected candidate.</span>"
  (interactive)
  (anything-isearch-cleanup)
  (with-current-buffer (anything-buffer-get) (anything-exit-minibuffer)))


(defun anything-isearch-select-action ()
  "<span class="quote">Choose an action for the selected candidate.</span>"
  (interactive)
  (anything-isearch-cleanup)
  (with-anything-window
    (anything-select-action)))


(defun anything-isearch-cancel ()
  "<span class="quote">Cancel Anything isearch.</span>"
  (interactive)
  (anything-isearch-cleanup)
  (when (anything-window)
    (with-anything-window
      (goto-char anything-isearch-original-point)
      (anything-mark-current-line))))


(defun anything-isearch-cleanup ()
  "<span class="quote">Clean up the mess.</span>"
  (setq minibuffer-message-timeout anything-isearch-original-message-timeout)
  (with-current-buffer (anything-buffer-get)
    (setq overriding-terminal-local-map nil)
    (setq cursor-type nil)
    (setq cursor-in-non-selected-windows
          anything-isearch-original-cursor-in-non-selected-windows))
  (when anything-isearch-original-window
    (select-window anything-isearch-original-window))

  (use-global-map anything-isearch-original-global-map)
  (setq-default deferred-action-list
                anything-isearch-original-deferred-action-list)
  (when (overlayp anything-isearch-overlay) 
    (delete-overlay anything-isearch-overlay)))


(defun anything-isearch-message ()
  "<span class="quote">Print prompt.</span>"
  (if (and (equal anything-isearch-message-suffix "<span class="quote"></span>")
           (eq (plist-get (car anything-isearch-match-positions) 'event)
               'error))
      (setq anything-isearch-message-suffix "<span class="quote">failing</span>"))

  (unless (equal anything-isearch-message-suffix "<span class="quote"></span>")
    (setq anything-isearch-message-suffix 
          (concat "<span class="quote"> [</span>" anything-isearch-message-suffix "<span class="quote">]</span>")))

  (message (concat "<span class="quote">Search within results: </span>"
                   anything-isearch-pattern
                   anything-isearch-message-suffix))

  (setq anything-isearch-message-suffix "<span class="quote"></span>"))


<span class="linecomment">;; (@* "Utility: Iswitchb integration (unmaintained)")</span>

(defvar anything-iswitchb-candidate-selected nil
  "<span class="quote">Indicates whether an anything candidate is selected from iswitchb.</span>")

(defvar anything-iswitchb-frame-configuration nil
  "<span class="quote">Saved frame configuration, before anything buffer was displayed.</span>")

(defvar anything-iswitchb-saved-keys nil
  "<span class="quote">The original in iswitchb before binding anything keys.</span>")


(defun anything-iswitchb-setup ()
  "<span class="quote">Integrate anything completion into iswitchb (UNMAINTAINED).

If the user is idle for `anything-iswitchb-idle-delay' seconds
after typing something into iswitchb then anything candidates are
shown for the current iswitchb input.

ESC cancels anything completion and returns to normal iswitchb.

Some key bindings in `anything-map' are modified.
See also `anything-iswitchb-setup-keys'.</span>"
  (interactive)

  (require 'iswitchb)

  <span class="linecomment">;; disable timid completion during iswitchb</span>
  (put 'iswitchb-buffer 'timid-completion 'disabled)
  (add-hook 'minibuffer-setup-hook  'anything-iswitchb-minibuffer-setup)

  (defadvice iswitchb-visit-buffer
    (around anything-iswitchb-visit-buffer activate)
    (if anything-iswitchb-candidate-selected
        (anything-execute-selection-action)
      ad-do-it))

  (defadvice iswitchb-possible-new-buffer
    (around anything-iswitchb-possible-new-buffer activate)
    (if anything-iswitchb-candidate-selected
        (anything-execute-selection-action)
      ad-do-it))
  (anything-iswitchb-setup-keys)
  (message "<span class="quote">Iswitchb integration is activated.</span>"))

(defun anything-iswitchb-setup-keys ()
  "<span class="quote">Modify `anything-map' for anything-iswitchb users.

C-p is used instead of M-p, because anything uses ESC
 (currently hardcoded) for `anything-iswitchb-cancel-anything' and
Emacs handles ESC and Meta as synonyms, so ESC overrides
other commands with Meta prefix.

Note that iswitchb uses M-p and M-n by default for history
navigation, so you should bind C-p and C-n in
`iswitchb-mode-map' if you use the history keys and don't want
to use different keys for iswitchb while anything is not yet
kicked in. These keys are not bound automatically by anything
in `iswitchb-mode-map' because they (C-n at least) already have
a standard iswitchb binding which you might be accustomed to.

Binding M-s is used instead of C-s, because C-s has a binding in
iswitchb.  You can rebind it AFTER `anything-iswitchb-setup'.

Unbind C-r to prevent problems during anything-isearch.</span>"
  (define-key anything-map (kbd "<span class="quote">C-s</span>") nil)
  (define-key anything-map (kbd "<span class="quote">M-p</span>") nil)
  (define-key anything-map (kbd "<span class="quote">M-n</span>") nil)
  (define-key anything-map (kbd "<span class="quote">M-v</span>") nil)
  (define-key anything-map (kbd "<span class="quote">C-v</span>") nil)
  (define-key anything-map (kbd "<span class="quote">C-p</span>") 'anything-previous-history-element)
  (define-key anything-map (kbd "<span class="quote">C-n</span>") 'anything-next-history-element)
  (define-key anything-map (kbd "<span class="quote">M-s</span>") nil)
  (define-key anything-map (kbd "<span class="quote">M-s</span>") 'anything-isearch)
  (define-key anything-map (kbd "<span class="quote">C-r</span>") nil))

(defun anything-iswitchb-minibuffer-setup ()
  (when (eq this-command 'iswitchb-buffer)
    (add-hook 'minibuffer-exit-hook  'anything-iswitchb-minibuffer-exit)

    (setq anything-iswitchb-frame-configuration nil)
    (setq anything-iswitchb-candidate-selected nil)
    (add-hook 'anything-update-hook 'anything-iswitchb-handle-update)

    (anything-initialize)
    
    (add-hook 'deferred-action-list 'anything-iswitchb-check-input)))


(defun anything-iswitchb-minibuffer-exit ()
  (remove-hook 'minibuffer-exit-hook  'anything-iswitchb-minibuffer-exit)
  (remove-hook 'deferred-action-list 'anything-iswitchb-check-input)
  (remove-hook 'anything-update-hook 'anything-iswitchb-handle-update)

  (anything-cleanup)

  (when anything-iswitchb-frame-configuration
    (anything-set-frame/window-configuration
     anything-iswitchb-frame-configuration)
    (setq anything-iswitchb-frame-configuration nil)))


(defun anything-iswitchb-check-input ()
  "<span class="quote">Extract iswitchb input and check if it needs to be handled.</span>"
  (declare (special iswitchb-text))
  (if (or anything-iswitchb-frame-configuration
          (sit-for anything-iswitchb-idle-delay))
      (anything-check-new-input iswitchb-text)))


(defun anything-iswitchb-handle-update ()
  "<span class="quote">Pop up the anything buffer if it's not empty and it's not
shown yet and bind anything commands in iswitchb.</span>"
  (unless (or (anything-empty-buffer-p anything-buffer)
              anything-iswitchb-frame-configuration)
    (setq anything-iswitchb-frame-configuration
          (anything-current-frame/window-configuration))

    (save-selected-window 
      (if (not anything-samewindow)
          (pop-to-buffer anything-buffer)

        (select-window (get-lru-window))
        (switch-to-buffer anything-buffer)))

    (with-current-buffer (window-buffer (active-minibuffer-window))
      (let* ((anything-prefix "<span class="quote">anything-</span>")
             (prefix-length (length anything-prefix))
             (commands 
              (delete-dups
               (remove-if 'null
                          (mapcar 
                           (lambda (binding)
                             (let ((command (cdr binding)))
                               (when (and (symbolp command)
                                          (eq (compare-strings 
                                               anything-prefix 
                                               0 prefix-length
                                               (symbol-name command)
                                               0 prefix-length)
                                              t))
                                 command)))
                           (cdr anything-map)))))
             (bindings (mapcar (lambda (command)
                                 (cons command 
                                       (where-is-internal command anything-map)))
                               commands)))

        (push (list 'anything-iswitchb-cancel-anything (kbd "<span class="quote">&lt;ESC&gt;</span>"))
              bindings)

        (setq anything-iswitchb-saved-keys nil)

      (let* ((iswitchb-prefix "<span class="quote">iswitchb-</span>")
             (prefix-length (length iswitchb-prefix)))
        (dolist (binding bindings)
          (dolist (key (cdr binding))
            (let ((old-command (lookup-key (current-local-map) key)))
              (unless (and anything-iswitchb-dont-touch-iswithcb-keys
                           (symbolp old-command)
                           (eq (compare-strings iswitchb-prefix 
                                                0 prefix-length
                                                (symbol-name old-command)
                                                0 prefix-length)
                               t))
                (push (cons key old-command)
                      anything-iswitchb-saved-keys)
                (define-key (current-local-map) key (car binding)))))))))))


(defun anything-iswitchb-cancel-anything ()
  "<span class="quote">Cancel anything completion and return to standard iswitchb.</span>"
  (interactive)
  (save-excursion
    (dolist (binding anything-iswitchb-saved-keys)
      (define-key (current-local-map) (car binding) (cdr binding)))
    (anything-iswitchb-minibuffer-exit)))

<span class="linecomment">;; (@* "Compatibility")</span>

<span class="linecomment">;; Copied assoc-default from XEmacs version 21.5.12</span>
(unless (fboundp 'assoc-default)
  (defun assoc-default (key alist &optional test default)
    "<span class="quote">Find object KEY in a pseudo-alist ALIST.
ALIST is a list of conses or objects.  Each element (or the element's car,
if it is a cons) is compared with KEY by evaluating (TEST (car elt) KEY).
If that is non-nil, the element matches;
then `assoc-default' returns the element's cdr, if it is a cons,
or DEFAULT if the element is not a cons.

If no element matches, the value is nil.
If TEST is omitted or nil, `equal' is used.</span>"
    (let (found (tail alist) value)
      (while (and tail (not found))
        (let ((elt (car tail)))
          (when (funcall (or test 'equal) (if (consp elt) (car elt) elt) key)
            (setq found t value (if (consp elt) (cdr elt) default))))
        (setq tail (cdr tail)))
      value)))

<span class="linecomment">;; Function not available in XEmacs, </span>
(unless (fboundp 'minibuffer-contents)
  (defun minibuffer-contents ()
    "<span class="quote">Return the user input in a minbuffer as a string.
The current buffer must be a minibuffer.</span>"
    (field-string (point-max)))

  (defun delete-minibuffer-contents  ()
    "<span class="quote">Delete all user input in a minibuffer.
The current buffer must be a minibuffer.</span>"
    (delete-field (point-max))))

<span class="linecomment">;; Function not available in older Emacs (&lt;= 22.1).</span>
(unless (fboundp 'buffer-chars-modified-tick)
  (defun buffer-chars-modified-tick (&optional buffer)
    "<span class="quote">Return BUFFER's character-change tick counter.
Each buffer has a character-change tick counter, which is set to the
value of the buffer's tick counter (see `buffer-modified-tick'), each
time text in that buffer is inserted or deleted.  By comparing the
values returned by two individual calls of `buffer-chars-modified-tick',
you can tell whether a character change occurred in that buffer in
between these calls.  No argument or nil as argument means use current
buffer as BUFFER.</span>"
    (with-current-buffer (or buffer (current-buffer))
      (if (listp buffer-undo-list)
          (length buffer-undo-list)
        (buffer-modified-tick)))))

<span class="linecomment">;; (@* "CUA workaround")</span>
(defadvice cua-delete-region (around anything-avoid-cua activate)
  (ignore-errors ad-do-it))
(defadvice copy-region-as-kill (around anything-avoid-cua activate)
  (if cua-mode
      (ignore-errors ad-do-it)
    ad-do-it))


<span class="linecomment">;;(@* "Attribute Documentation")</span>
(defun anything-describe-anything-attribute (anything-attribute)
  "<span class="quote">Display the full documentation of ANYTHING-ATTRIBUTE (a symbol).</span>"
  (interactive (list (intern
                      (completing-read
                       "<span class="quote">Describe anything attribute: </span>"
                       (mapcar 'symbol-name anything-additional-attributes)))))
  (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
    (princ (get anything-attribute 'anything-attrdoc))))

(anything-document-attribute 'name "<span class="quote">mandatory</span>"
  "<span class="quote">  The name of the source. It is also the heading which appears
  above the list of matches from the source. Must be unique. </span>")
(anything-document-attribute 'header-name "<span class="quote">optional</span>"
  "<span class="quote">  A function returning the display string of the header. Its
  argument is the name of the source. This attribute is useful to
  add an additional information with the source name. </span>")
(anything-document-attribute 'candidates "<span class="quote">mandatory if candidates-in-buffer attribute is not provided</span>"
  "<span class="quote">  Specifies how to retrieve candidates from the source. It can
  either be a variable name, a function called with no parameters
  or the actual list of candidates.

  The list must be a list whose members are strings, symbols
  or (DISPLAY . REAL) pairs.

  In case of (DISPLAY . REAL) pairs, the DISPLAY string is shown
  in the Anything buffer, but the REAL one is used as action
  argument when the candidate is selected. This allows a more
  readable presentation for candidates which would otherwise be,
  for example, too long or have a common part shared with other
  candidates which can be safely replaced with an abbreviated
  string for display purposes.

  Note that if the (DISPLAY . REAL) form is used then pattern
  matching is done on the displayed string, not on the real
  value.

  If the candidates have to be retrieved asynchronously (for
  example, by an external command which takes a while to run)
  then the function should start the external command
  asynchronously and return the associated process object.
  Anything will take care of managing the process (receiving the
  output from it, killing it if necessary, etc.). The process
  should return candidates matching the current pattern (see
  variable `anything-pattern'.)

  Note that currently results from asynchronous sources appear
  last in the anything buffer regardless of their position in
  `anything-sources'. </span>")
(anything-document-attribute 'action "<span class="quote">mandatory if type attribute is not provided</span>"
  "<span class="quote">  It is a list of (DISPLAY . FUNCTION) pairs or FUNCTION.
  FUNCTION is called with one parameter: the selected candidate.

  An action other than the default can be chosen from this list
  of actions for the currently selected candidate (by default
  with TAB). The DISPLAY string is shown in the completions
  buffer and the FUNCTION is invoked when an action is
  selected. The first action of the list is the default. </span>")
(anything-document-attribute 'coerce "<span class="quote">optional</span>"
  "<span class="quote">  It's a function called with one argument: the selected candidate.
  
  This function is intended for type convertion.
  In normal case, the selected candidate (string) is passed to action function.
  If coerce function is specified, it is called just before action function.

  Example: converting string to symbol
    (coerce . intern)
</span>")
(anything-document-attribute 'type "<span class="quote">optional if action attribute is provided</span>"
  "<span class="quote">  Indicates the type of the items the source returns. 

  Merge attributes not specified in the source itself from
  `anything-type-attributes'.

  This attribute is implemented by plug-in. </span>")
(anything-document-attribute 'init "<span class="quote">optional</span>"
  "<span class="quote">  Function called with no parameters when anything is started. It
  is useful for collecting current state information which can be
  used to create the list of candidates later.

  For example, if a source needs to work with the current
  directory then it can store its value here, because later
  anything does its job in the minibuffer and in the
  `anything-buffer' and the current directory can be different
  there. </span>")
(anything-document-attribute 'delayed-init "<span class="quote">optional</span>"
  "<span class="quote">  Function called with no parameters before candidate function is
  called.  It is similar with `init' attribute, but its
  evaluation is deferred. It is useful to combine with </span>")
(anything-document-attribute 'match "<span class="quote">optional</span>"
  "<span class="quote">  List of functions called with one parameter: a candidate. The
  function should return non-nil if the candidate matches the
  current pattern (see variable `anything-pattern').

  This attribute allows the source to override the default
  pattern matching based on `string-match'. It can be used, for
  example, to implement a source for file names and do the
  pattern matching on the basename of files, since it's more
  likely one is typing part of the basename when searching for a
  file, instead of some string anywhere else in its path.

  If the list contains more than one function then the list of
  matching candidates from the source is constructed by appending
  the results after invoking the first function on all the
  potential candidates, then the next function, and so on. The
  matching candidates supplied by the first function appear first
  in the list of results and then results from the other
  functions, respectively.

  This attribute has no effect for asynchronous sources (see
  attribute `candidates'), since they perform pattern matching
  themselves. </span>")
(anything-document-attribute 'candidate-transformer "<span class="quote">optional</span>"
  "<span class="quote">  It's a function or a list of functions called with one argument
  when the completion list from the source is built. The argument
  is the list of candidates retrieved from the source. The
  function should return a transformed list of candidates which
  will be used for the actual completion.  If it is a list of
  functions, it calls each function sequentially.

  This can be used to transform or remove items from the list of
  candidates.

  Note that `candidates' is run already, so the given transformer
  function should also be able to handle candidates with (DISPLAY
  . REAL) format. </span>")
(anything-document-attribute 'filtered-candidate-transformer "<span class="quote">optional</span>"
  "<span class="quote">  It has the same format as `candidate-transformer', except the
  function is called with two parameters: the candidate list and
  the source.

  This transformer is run on the candidate list which is already
  filtered by the current pattern. While `candidate-transformer'
  is run only once, it is run every time the input pattern is
  changed.

  It can be used to transform the candidate list dynamically, for
  example, based on the current pattern.

  In some cases it may also be more efficent to perform candidate
  transformation here, instead of with `candidate-transformer'
  even if this transformation is done every time the pattern is
  changed.  For example, if a candidate set is very large then
  `candidate-transformer' transforms every candidate while only
  some of them will actually be dislpayed due to the limit
  imposed by `anything-candidate-number-limit'.

  Note that `candidates' and `candidate-transformer' is run
  already, so the given transformer function should also be able
  to handle candidates with (DISPLAY . REAL) format.

  This option has no effect for asynchronous sources. (Not yet,
  at least. </span>")
(anything-document-attribute 'action-transformer "<span class="quote">optional</span>"
  "<span class="quote">  It's a function or a list of functions called with two
  arguments when the action list from the source is
  assembled. The first argument is the list of actions, the
  second is the current selection.  If it is a list of functions,
  it calls each function sequentially.

  The function should return a transformed action list.

  This can be used to customize the list of actions based on the
  currently selected candidate. </span>")
(anything-document-attribute 'pattern-transformer "<span class="quote">optional</span>"
  "<span class="quote">  It's a function or a list of functions called with one argument
  before computing matches. Its argument is `anything-pattern'.
  Functions should return transformed `anything-pattern'.

  It is useful to change interpretation of `anything-pattern'. </span>")
(anything-document-attribute 'delayed "<span class="quote">optional</span>"
  "<span class="quote">  Candidates from the source are shown only if the user stops
  typing and is idle for `anything-idle-delay' seconds. </span>")
(anything-document-attribute 'volatile "<span class="quote">optional</span>"
  "<span class="quote">  Indicates the source assembles the candidate list dynamically,
  so it shouldn't be cached within a single Anything
  invocation. It is only applicable to synchronous sources,
  because asynchronous sources are not cached. </span>")
(anything-document-attribute 'requires-pattern "<span class="quote">optional</span>"
  "<span class="quote">  If present matches from the source are shown only if the
  pattern is not empty. Optionally, it can have an integer
  parameter specifying the required length of input which is
  useful in case of sources with lots of candidates. </span>")
(anything-document-attribute 'persistent-action "<span class="quote">optional</span>"
  "<span class="quote">  Function called with one parameter; the selected candidate.

  An action performed by `anything-execute-persistent-action'.
  If none, use the default action. </span>")
(anything-document-attribute 'candidates-in-buffer "<span class="quote">optional</span>"
  "<span class="quote">  Shortcut attribute for making and narrowing candidates using
  buffers.  This newly-introduced attribute prevents us from
  forgetting to add volatile and match attributes.

  See docstring of `anything-candidates-in-buffer'.

  (candidates-in-buffer) is equivalent of three attributes:
    (candidates . anything-candidates-in-buffer)
    (volatile)
    (match identity)

  (candidates-in-buffer . candidates-function) is equivalent of:
    (candidates . candidates-function)
    (volatile)
    (match identity)

  This attribute is implemented by plug-in. </span>")
(anything-document-attribute 'search "<span class="quote">optional</span>"
  "<span class="quote">  List of functions like `re-search-forward' or `search-forward'.
  Buffer search function used by `anything-candidates-in-buffer'.
  By default, `anything-candidates-in-buffer' uses `re-search-forward'.
  This attribute is meant to be used with
  (candidates . anything-candidates-in-buffer) or
  (candidates-in-buffer) in short. </span>")
(anything-document-attribute 'search-from-end "<span class="quote">optional</span>"
  "<span class="quote">  Make `anything-candidates-in-buffer' search from the end of buffer.
  If this attribute is specified, `anything-candidates-in-buffer' uses
  `re-search-backward' instead. </span>")
(anything-document-attribute 'get-line "<span class="quote">optional</span>"
  "<span class="quote">  A function like `buffer-substring-no-properties' or `buffer-substring'.
  This function converts point of line-beginning and point of line-end,
  which represents a candidate computed by `anything-candidates-in-buffer'.
  By default, `anything-candidates-in-buffer' uses
  `buffer-substring-no-properties'. </span>")
(anything-document-attribute 'display-to-real "<span class="quote">optional</span>"
  "<span class="quote">  Function called with one parameter; the selected candidate.

  The function transforms the selected candidate, and the result
  is passed to the action function.  The display-to-real
  attribute provides another way to pass other string than one
  shown in Anything buffer.

  Traditionally, it is possible to make candidates,
  candidate-transformer or filtered-candidate-transformer
  function return a list with (DISPLAY . REAL) pairs. But if REAL
  can be generated from DISPLAY, display-to-real is more
  convenient and faster. </span>")
(anything-document-attribute 'real-to-display "<span class="quote">optional</span>"
  "<span class="quote">  Function called with one parameter; the selected candidate.

  The inverse of display-to-real attribute.

  The function transforms the selected candidate, which is passed
  to the action function, for display.  The real-to-display
  attribute provides the other way to pass other string than one
  shown in Anything buffer.

  Traditionally, it is possible to make candidates,
  candidate-transformer or filtered-candidate-transformer
  function return a list with (DISPLAY . REAL) pairs. But if
  DISPLAY can be generated from REAL, real-to-display is more
  convenient.

  Note that DISPLAY parts returned from candidates /
  candidate-transformer are IGNORED as the name `display-to-real'
  says. </span>")
(anything-document-attribute 'cleanup "<span class="quote">optional</span>"
  "<span class="quote">  Function called with no parameters when *anything* buffer is closed. It
  is useful for killing unneeded candidates buffer.

  Note that the function is executed BEFORE performing action. </span>")
(anything-document-attribute 'candidate-number-limit "<span class="quote">optional</span>"
  "<span class="quote">  Override `anything-candidate-number-limit' only for this source. </span>")
(anything-document-attribute 'accept-empty "<span class="quote">optional</span>"
  "<span class="quote">  Pass empty string \"\" to action function. </span>")
(anything-document-attribute 'disable-shortcuts "<span class="quote">optional</span>"
  "<span class="quote">  Disable `anything-enable-shortcuts' in current `anything' session.

  This attribute is implemented by plug-in. </span>")
(anything-document-attribute 'dummy "<span class="quote">optional</span>"
  "<span class="quote">  Set `anything-pattern' to candidate. If this attribute is
  specified, The candidates attribute is ignored.

  This attribute is implemented by plug-in.
  This plug-in implies disable-shortcuts plug-in. </span>")
(anything-document-attribute 'multiline "<span class="quote">optional</span>"
  "<span class="quote">  Enable to selection multiline candidates. </span>")
(anything-document-attribute 'update "<span class="quote">optional</span>"
  "<span class="quote">  Function called with no parameters when \\&lt;anything-map&gt;\\[anything-force-update] is pressed. </span>")
(anything-document-attribute 'mode-line "<span class="quote">optional</span>"
  "<span class="quote">  source local `anything-mode-line-string'. (included in `mode-line-format')
  It accepts also variable/function name. </span>")
(anything-document-attribute 'header-line "<span class="quote">optional</span>"
  "<span class="quote">  source local `header-line-format'.
  It accepts also variable/function name. </span>")
(anything-document-attribute 'resume "<span class="quote">optional</span>" "<span class="quote">  Function called with no parameters when `anything-resume' is started.</span>")

<span class="linecomment">;; (@* "Bug Report")</span>
(defvar anything-maintainer-mail-address
  (concat "<span class="quote">rubiki</span>" "<span class="quote">tch@ru</span>" "<span class="quote">by-lang.org</span>"))
(defvar anything-bug-report-salutation
  "<span class="quote">Describe bug below, using a precise recipe.

When I executed M-x ...

How to send a bug report:
  1) Be sure to use the LATEST version of anything.el.
  2) Enable debugger. M-x toggle-debug-on-error or (setq debug-on-error t)
  3) Use Lisp version instead of compiled one: (load \"anything.el\")
  4) If you got an error, please paste *Backtrace* buffer.
  5) Type C-c C-c to send.
# If you are a Japanese, please write in Japanese:-)</span>")
(defvar anything-no-dump-variables
  '(anything-candidate-buffer-alist
    anything-digit-overlays
    anything-help-message
    anything-candidate-cache
    )
  "<span class="quote">Variables not to dump in bug report.</span>")

(defun anything-dumped-variables-in-bug-report ()
  (let ((hash (make-hash-table)))
    (loop for var in (apropos-internal "<span class="quote">anything-</span>" 'boundp)
          for vname = (symbol-name var)
          unless (or (string-match "<span class="quote">-map$</span>" vname)
                     (string-match "<span class="quote">^anything-c-source-</span>" vname)
                     (string-match "<span class="quote">-hash$</span>" vname)
                     (string-match "<span class="quote">-face$</span>" vname)
                     (memq var anything-no-dump-variables))
          collect var)))

(defun anything-send-bug-report ()
  "<span class="quote">Send a bug report of anything.el.</span>"
  (interactive)
  (with-current-buffer (or anything-last-buffer
                           (current-buffer))
    (reporter-submit-bug-report
     anything-maintainer-mail-address
     "<span class="quote">anything.el</span>"
     (anything-dumped-variables-in-bug-report)
     nil nil
     anything-bug-report-salutation)))

(defun anything-send-bug-report-from-anything ()
  "<span class="quote">Send a bug report of anything.el in anything session.</span>"
  (interactive)
  (anything-run-after-quit 'anything-send-bug-report))

<span class="linecomment">;; (@* "Unit Tests")</span>

(defun* anything-test-candidates (sources &optional (input "<span class="quote"></span>") (compile-source-functions anything-compile-source-functions-default))
  "<span class="quote">Test helper function for anything.
Given pseudo `anything-sources' and `anything-pattern', returns list like
  ((\"source name1\" (\"candidate1\" \"candidate2\"))
   (\"source name2\" (\"candidate3\" \"candidate4\")))
</span>"
  (let ((anything-test-mode t)
        anything-enable-shortcuts
        anything-candidate-cache
        (anything-compile-source-functions compile-source-functions)
        anything-before-initialize-hook
        anything-after-initialize-hook
        anything-update-hook
        anything-test-candidate-list)
    (get-buffer-create anything-buffer)

    (anything-initialize-1 nil input sources)
    (anything-update)
    <span class="linecomment">;; test-mode spec: select 1st candidate!</span>
    (with-current-buffer anything-buffer
      (forward-line 1)
      (anything-mark-current-line))
    (prog1
        anything-test-candidate-list
      (anything-cleanup))))

(defmacro anything-test-update (sources pattern)
  "<span class="quote">Test helper macro for anything. It is meant for testing *anything* buffer contents.</span>"
  `(progn (stub anything-get-sources =&gt; ,sources)
          (stub anything-log-run-hook =&gt; nil)
          (stub anything-maybe-fit-frame =&gt; nil)
          (stub run-with-idle-timer =&gt; nil)
          (let (anything-test-mode (anything-pattern ,pattern))
            (anything-update))))

<span class="linecomment">;;;; unit test</span>
<span class="linecomment">;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/el-expectations.el")</span>
<span class="linecomment">;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/el-mock.el")</span>
(dont-compile
  (when (fboundp 'expectations)
    (expectations
      (desc "<span class="quote">anything-current-buffer</span>")
      (expect "<span class="quote">__a_buffer</span>"
        (with-current-buffer (get-buffer-create "<span class="quote">__a_buffer</span>")
          (anything-test-candidates '(((name . "<span class="quote">FOO</span>"))) "<span class="quote"></span>")
          (prog1
              (buffer-name anything-current-buffer)
            (kill-buffer "<span class="quote">__a_buffer</span>")
            )))
      (desc "<span class="quote">anything-buffer-file-name</span>")
      (expect (regexp "<span class="quote">/__a_file__</span>")
        (with-current-buffer (get-buffer-create "<span class="quote">__a_file__</span>")
          (setq buffer-file-name "<span class="quote">/__a_file__</span>")
          (anything-test-candidates '(((name . "<span class="quote">FOO</span>"))) "<span class="quote"></span>")
          (prog1
              anything-buffer-file-name
            <span class="linecomment">;;(kill-buffer "__a_file__")</span>
            )))
      (desc "<span class="quote">anything-interpret-value</span>")
      (expect "<span class="quote">literal</span>"
        (anything-interpret-value "<span class="quote">literal</span>"))
      (expect "<span class="quote">lambda</span>"
        (anything-interpret-value (lambda () "<span class="quote">lambda</span>")))
      (expect "<span class="quote">lambda with source name</span>"
        (let ((source '((name . "<span class="quote">lambda with source name</span>"))))
          (anything-interpret-value (lambda () anything-source-name) source)))
      (expect "<span class="quote">function symbol</span>"
        (flet ((f () "<span class="quote">function symbol</span>"))
          (anything-interpret-value 'f)))
      (expect "<span class="quote">variable symbol</span>"
        (let ((v "<span class="quote">variable symbol</span>"))
          (anything-interpret-value 'v)))
      (expect (error error *)
        (anything-interpret-value 'unbounded-1))
      (desc "<span class="quote">anything-compile-sources</span>")
      (expect '(((name . "<span class="quote">foo</span>")))
        (anything-compile-sources '(((name . "<span class="quote">foo</span>"))) nil)
        )
      (expect '(((name . "<span class="quote">foo</span>") (type . test) (action . identity)))
        (let ((anything-type-attributes '((test (action . identity)))))
          (anything-compile-sources '(((name . "<span class="quote">foo</span>") (type . test)))
                                    '(anything-compile-source--type))))
      (desc "<span class="quote">anything-sources accepts symbols</span>")
      (expect '(((name . "<span class="quote">foo</span>")))
        (let* ((foo '((name . "<span class="quote">foo</span>"))))
          (anything-compile-sources '(foo) nil)))
      (desc "<span class="quote">anything-get-sources action</span>")
      (expect '(((name . "<span class="quote">Actions</span>") (candidates . actions)))
        (stub anything-action-window =&gt; t)
        (let (anything-compiled-sources
              (anything-sources '(((name . "<span class="quote">Actions</span>") (candidates . actions)))))
          (anything-get-sources)))
      (desc "<span class="quote">get-buffer-create candidates-buffer</span>")
      (expect '(((name . "<span class="quote">many</span>") (init . many-init)
                 (candidates-in-buffer . anything-candidates-in-buffer)
                 (candidates . anything-candidates-in-buffer)
                 (volatile) (match identity)))
        (anything-compile-sources
         '(((name . "<span class="quote">many</span>") (init . many-init)
            (candidates-in-buffer . anything-candidates-in-buffer)))
         '(anything-compile-source--candidates-in-buffer)))
      (expect '(((name . "<span class="quote">many</span>") (init . many-init)
                 (candidates-in-buffer)
                 (candidates . anything-candidates-in-buffer)
                 (volatile) (match identity)))
        (anything-compile-sources
         '(((name . "<span class="quote">many</span>") (init . many-init)
            (candidates-in-buffer)))
         '(anything-compile-source--candidates-in-buffer)))
      (expect '(((name . "<span class="quote">many</span>") (init . many-init)
                 (candidates-in-buffer)
                 (type . test)
                 (action . identity)
                 (candidates . anything-candidates-in-buffer)
                 (volatile) (match identity)))
        (let ((anything-type-attributes '((test (action . identity)))))
          (anything-compile-sources
           '(((name . "<span class="quote">many</span>") (init . many-init)
              (candidates-in-buffer)
              (type . test)))
           '(anything-compile-source--type
             anything-compile-source--candidates-in-buffer))))

      (desc "<span class="quote">anything-get-candidates</span>")
      (expect '("<span class="quote">foo</span>" "<span class="quote">bar</span>")
        (anything-get-candidates '((name . "<span class="quote">foo</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>"))))
      (expect '("<span class="quote">FOO</span>" "<span class="quote">BAR</span>")
        (anything-get-candidates '((name . "<span class="quote">foo</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")
                                   (candidate-transformer
                                    . (lambda (cands) (mapcar 'upcase cands))))))
      (expect '("<span class="quote">foo</span>" "<span class="quote">bar</span>")
        (anything-get-candidates '((name . "<span class="quote">foo</span>")
                                   (candidates . (lambda () '("<span class="quote">foo</span>" "<span class="quote">bar</span>"))))))
      (expect '("<span class="quote">foo</span>" "<span class="quote">bar</span>")
        (let ((var '("<span class="quote">foo</span>" "<span class="quote">bar</span>")))
          (anything-get-candidates '((name . "<span class="quote">foo</span>")
                                     (candidates . var)))))
      (expect (error error *)
        (anything-get-candidates '((name . "<span class="quote">foo</span>")
                                   (candidates . "<span class="quote">err</span>"))))
      (expect (error error *)
        (let ((var "<span class="quote">err</span>"))
          (anything-get-candidates '((name . "<span class="quote">foo</span>")
                                     (candidates . var)))))
      (expect (error error *)
        (anything-get-candidates '((name . "<span class="quote">foo</span>")
                                   (candidates . unDeFined-syMbol))))
      (desc "<span class="quote">anything-compute-matches</span>")
      (expect '("<span class="quote">foo</span>" "<span class="quote">bar</span>")
        (let ((anything-pattern "<span class="quote"></span>"))
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>") (volatile)))))
      (expect '("<span class="quote">foo</span>")
        (let ((anything-pattern "<span class="quote">oo</span>"))
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>") (volatile)))))
      (expect '("<span class="quote">bar</span>")
        (let ((anything-pattern "<span class="quote">^b</span>"))
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>") (volatile)))))
      (expect '("<span class="quote">a</span>" "<span class="quote">b</span>")
        (let ((anything-pattern "<span class="quote"></span>")
              (anything-candidate-number-limit 2))
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>") (volatile)))))
      (expect '("<span class="quote">a</span>" "<span class="quote">b</span>")
        (let ((anything-pattern "<span class="quote">.</span>")
              (anything-candidate-number-limit 2))
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>") (volatile)))))
      (expect '("<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>")
        (let ((anything-pattern "<span class="quote"></span>")
              anything-candidate-number-limit)
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>") (volatile)))))
      (expect '("<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>")
        (let ((anything-pattern "<span class="quote">[abc]</span>")
              anything-candidate-number-limit)
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>") (volatile)))))
      (expect '(a b c)
        (let ((anything-pattern "<span class="quote">[abc]</span>")
              anything-candidate-number-limit)
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates a b c) (volatile)))))
      (expect '(("<span class="quote">foo</span>" . "<span class="quote">FOO</span>") ("<span class="quote">bar</span>" . "<span class="quote">BAR</span>"))
        (let ((anything-pattern "<span class="quote"></span>"))
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates ("<span class="quote">foo</span>" . "<span class="quote">FOO</span>") ("<span class="quote">bar</span>" . "<span class="quote">BAR</span>")) (volatile)))))
      (expect '(("<span class="quote">foo</span>" . "<span class="quote">FOO</span>"))
        (let ((anything-pattern "<span class="quote">foo</span>"))
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates ("<span class="quote">foo</span>" . "<span class="quote">FOO</span>") ("<span class="quote">bar</span>" . "<span class="quote">foo</span>")) (volatile)))))
      <span class="linecomment">;; using anything-test-candidate-list</span>
      (desc "<span class="quote">anything-test-candidates</span>")
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">foo</span>" "<span class="quote">bar</span>")))
        (anything-test-candidates '(((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")))))
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">bar</span>")))
        (anything-test-candidates '(((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>"))) "<span class="quote">ar</span>"))
      (expect '(("<span class="quote">T1</span>" ("<span class="quote">hoge</span>" "<span class="quote">aiue</span>"))
                ("<span class="quote">T2</span>" ("<span class="quote">test</span>" "<span class="quote">boke</span>")))
        (anything-test-candidates '(((name . "<span class="quote">T1</span>") (candidates "<span class="quote">hoge</span>" "<span class="quote">aiue</span>"))
                                    ((name . "<span class="quote">T2</span>") (candidates "<span class="quote">test</span>" "<span class="quote">boke</span>")))))
      (expect '(("<span class="quote">T1</span>" ("<span class="quote">hoge</span>"))
                ("<span class="quote">T2</span>" ("<span class="quote">boke</span>")))
        (anything-test-candidates '(((name . "<span class="quote">T1</span>") (candidates "<span class="quote">hoge</span>" "<span class="quote">aiue</span>"))
                                    ((name . "<span class="quote">T2</span>") (candidates "<span class="quote">test</span>" "<span class="quote">boke</span>"))) "<span class="quote">o</span>"))
      (desc "<span class="quote">requires-pattern attribute</span>")
      (expect nil
        (anything-test-candidates '(((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")
                                     (requires-pattern . 1)))))
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">bar</span>")))
        (anything-test-candidates '(((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")
                                     (requires-pattern . 1))) "<span class="quote">b</span>"))
      (desc "<span class="quote">delayed attribute(for test)</span>")
      (expect '(("<span class="quote">T2</span>" ("<span class="quote">boke</span>"))
                ("<span class="quote">T1</span>" ("<span class="quote">hoge</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">T1</span>") (candidates "<span class="quote">hoge</span>" "<span class="quote">aiue</span>") (delayed))
           ((name . "<span class="quote">T2</span>") (candidates "<span class="quote">test</span>" "<span class="quote">boke</span>")))
         "<span class="quote">o</span>"))
      (desc "<span class="quote">match attribute(prefix search)</span>")
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">bar</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")
            (match (lambda (c) (string-match (concat "<span class="quote">^</span>" anything-pattern) c)))))
         "<span class="quote">ba</span>"))
      (expect nil
        (anything-test-candidates
         '(((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")
            (match (lambda (c) (string-match (concat "<span class="quote">^</span>" anything-pattern) c)))))
         "<span class="quote">ar</span>"))
      (expect "<span class="quote">TestSource</span>"
        (let (x)
          (anything-test-candidates
           '(((name . "<span class="quote">TestSource</span>") (candidates "<span class="quote">a</span>")
              (match (lambda (c) (setq x anything-source-name)))))
           "<span class="quote">a</span>")
          x))
      (desc "<span class="quote">init attribute</span>")
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">bar</span>")))
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>") (init . (lambda () (setq v '("<span class="quote">foo</span>" "<span class="quote">bar</span>"))))
              (candidates . v)))
           "<span class="quote">ar</span>")))
      (desc "<span class="quote">candidate-transformer attribute</span>")
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">BAR</span>")))
        (anything-test-candidates '(((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")
                                     (candidate-transformer
                                      . (lambda (cands) (mapcar 'upcase cands)))))
                                  "<span class="quote">ar</span>"))
      (desc "<span class="quote">filtered-candidate-transformer attribute</span>")
      <span class="linecomment">;; needs more tests</span>
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">BAR</span>")))
        (anything-test-candidates '(((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")
                                     (filtered-candidate-transformer
                                      . (lambda (cands src) (mapcar 'upcase cands)))))
                                  "<span class="quote">ar</span>"))
      (desc "<span class="quote">anything-transform-candidates in process</span>")
      (expect (mock (anything-composed-funcall-with-source
                     '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")
                       (filtered-candidate-transformer
                        . (lambda (cands src) (mapcar 'upcase cands))))
                     (lambda (cands src) (mapcar 'upcase cands))
                     '("<span class="quote">foo</span>" "<span class="quote">bar</span>")
                     '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")
                       (filtered-candidate-transformer
                        . (lambda (cands src) (mapcar 'upcase cands))))
                     t))
        (stub anything-process-candidate-transformer =&gt; '("<span class="quote">foo</span>" "<span class="quote">bar</span>"))
        (anything-transform-candidates
         '("<span class="quote">foo</span>" "<span class="quote">bar</span>")
         '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")
           (filtered-candidate-transformer
            . (lambda (cands src) (mapcar 'upcase cands))))
         t)
        )
      (desc "<span class="quote">anything-candidates-in-buffer-1</span>")
      (expect nil
        (anything-candidates-in-buffer-1
         nil "<span class="quote"></span>"
         'buffer-substring-no-properties '(re-search-forward) 50 nil))
      (expect '("<span class="quote">foo+</span>" "<span class="quote">bar+</span>" "<span class="quote">baz+</span>")
        (with-temp-buffer
          (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>")
          (anything-candidates-in-buffer-1
           (current-buffer) "<span class="quote"></span>"
           'buffer-substring-no-properties '(re-search-forward) 5 nil)))
      (expect '("<span class="quote">foo+</span>" "<span class="quote">bar+</span>")
        (with-temp-buffer
          (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>")
          (anything-candidates-in-buffer-1
           (current-buffer) "<span class="quote"></span>"
           'buffer-substring-no-properties '(re-search-forward) 2 nil)))
      (expect '("<span class="quote">foo+</span>")
        (with-temp-buffer
          (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>")
          (anything-candidates-in-buffer-1
           (current-buffer) "<span class="quote">oo\\+</span>"
           'buffer-substring-no-properties '(re-search-forward) 50 nil)))
      (expect '("<span class="quote">foo+</span>")
        (with-temp-buffer
          (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>")
          (anything-candidates-in-buffer-1 
           (current-buffer) "<span class="quote">oo+</span>"
           #'buffer-substring-no-properties '(search-forward) 50 nil)))
      (expect '("<span class="quote">foo+</span>" "<span class="quote">bar+</span>")
        (with-temp-buffer
          (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>")
          (anything-candidates-in-buffer-1
           (current-buffer) "<span class="quote">.</span>"
           'buffer-substring-no-properties '(re-search-forward) 2 nil)))
      (expect '(("<span class="quote">foo+</span>" "<span class="quote">FOO+</span>"))
        (with-temp-buffer
          (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>")
          (anything-candidates-in-buffer-1
           (current-buffer) "<span class="quote">oo\\+</span>"
           (lambda (s e)
             (let ((l (buffer-substring-no-properties s e)))
               (list l (upcase l))))
           '(re-search-forward) 50 nil)))
      (desc "<span class="quote">anything-candidates-in-buffer</span>")
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">foo+</span>" "<span class="quote">bar+</span>" "<span class="quote">baz+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>"))))
            (candidates . anything-candidates-in-buffer)
            (match identity)
            (volatile)))))
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">foo+</span>" "<span class="quote">bar+</span>" "<span class="quote">baz+</span>")))
        (let (anything-candidate-number-limit)
          (anything-test-candidates
           '(((name . "<span class="quote">TEST</span>")
              (init
               . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                              (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>"))))
              (candidates . anything-candidates-in-buffer)
              (match identity)
              (volatile))))))
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">foo+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>"))))
            (candidates . anything-candidates-in-buffer)
            (match identity)
            (volatile)))
         "<span class="quote">oo\\+</span>"))
      <span class="linecomment">;; BUG remain empty string, but the pattern is rare case.</span>
      (expect '(("<span class="quote">a</span>" ("<span class="quote"></span>" "<span class="quote">a</span>" "<span class="quote">b</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">a</span>")
            (init . (lambda ()
                      (with-current-buffer (anything-candidate-buffer 'global)
                        (insert "<span class="quote">a\nb\n</span>"))))
            (candidates-in-buffer)))
         "<span class="quote">a*</span>"))
      (desc "<span class="quote">search attribute</span>")
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">foo+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">foo+\nbar+\nbaz+\nooo\n</span>"))))
            (search search-forward)
            (candidates . anything-candidates-in-buffer)
            (match identity)
            (volatile)))
         "<span class="quote">oo+</span>"))
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">foo+</span>" "<span class="quote">ooo</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">foo+\nbar+\nbaz+\nooo\n</span>"))))
            (search search-forward re-search-forward)
            (candidates . anything-candidates-in-buffer)
            (match identity)
            (volatile)))
         "<span class="quote">oo+</span>"))
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">foo+</span>" "<span class="quote">ooo</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">foo+\nbar+\nbaz+\nooo\n</span>"))))
            (search re-search-forward search-forward)
            (candidates . anything-candidates-in-buffer)
            (match identity)
            (volatile)))
         "<span class="quote">oo+</span>"))
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">ooo</span>" "<span class="quote">foo+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">bar+\nbaz+\nooo\nfoo+\n</span>"))))
            (search re-search-forward search-forward)
            (candidates . anything-candidates-in-buffer)
            (match identity)
            (volatile)))
         "<span class="quote">oo+</span>"))
      <span class="linecomment">;; faster exact match</span>
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">bar+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">bar+\nbaz+\nooo\nfoo+\n</span>"))))
            (search (lambda (pattern &rest _)
                      (and (search-forward (concat "<span class="quote">\n</span>" pattern "<span class="quote">\n</span>") nil t)
                           (forward-line -1))))
            (candidates . anything-candidates-in-buffer)
            (match identity)
            (volatile)))
         "<span class="quote">bar+</span>"))
      <span class="linecomment">;; faster prefix match</span>
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">bar+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">bar+\nbaz+\nooo\nfoo+\n</span>"))))
            (search (lambda (pattern &rest _)
                      (search-forward (concat "<span class="quote">\n</span>" pattern) nil t)))
            (candidates . anything-candidates-in-buffer)
            (match identity)
            (volatile)))
         "<span class="quote">ba</span>"))
      (desc "<span class="quote">anything-current-buffer-is-modified</span>")
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">modified</span>")))
        (let ((sources '(((name . "<span class="quote">FOO</span>")
                          (candidates
                           . (lambda ()
                               (if (anything-current-buffer-is-modified)
                                   '("<span class="quote">modified</span>")
                                 '("<span class="quote">unmodified</span>"))))))))
          (with-temp-buffer
            (clrhash anything-tick-hash)
            (insert "<span class="quote">1</span>")
            (anything-test-candidates sources))))
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">unmodified</span>")))
        (let ((sources '(((name . "<span class="quote">FOO</span>")
                          (candidates
                           . (lambda ()
                               (if (anything-current-buffer-is-modified)
                                   '("<span class="quote">modified</span>")
                                 '("<span class="quote">unmodified</span>"))))))))
          (with-temp-buffer
            (clrhash anything-tick-hash)
            (insert "<span class="quote">1</span>")
            (anything-test-candidates sources)
            (anything-test-candidates sources))))
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">modified</span>")))
        (let ((sources '(((name . "<span class="quote">FOO</span>")
                          (candidates
                           . (lambda ()
                               (if (anything-current-buffer-is-modified)
                                   '("<span class="quote">modified</span>")
                                 '("<span class="quote">unmodified</span>"))))))))
          (with-temp-buffer
            (clrhash anything-tick-hash)
            (insert "<span class="quote">1</span>")
            (anything-test-candidates sources)
            (insert "<span class="quote">2</span>")
            (anything-test-candidates sources))))
      (expect '(("<span class="quote">BAR</span>" ("<span class="quote">modified</span>")))
        (let ((sources1 '(((name . "<span class="quote">FOO</span>")
                           (candidates
                            . (lambda ()
                                (if (anything-current-buffer-is-modified)
                                    '("<span class="quote">modified</span>")
                                  '("<span class="quote">unmodified</span>")))))))
              (sources2 '(((name . "<span class="quote">BAR</span>")
                           (candidates
                            . (lambda ()
                                (if (anything-current-buffer-is-modified)
                                    '("<span class="quote">modified</span>")
                                  '("<span class="quote">unmodified</span>"))))))))
          (with-temp-buffer
            (clrhash anything-tick-hash)
            (insert "<span class="quote">1</span>")
            (anything-test-candidates sources1)
            (anything-test-candidates sources2))))
      (expect '(("<span class="quote">FOO</span>" ("<span class="quote">unmodified</span>")))
        (let ((sources1 '(((name . "<span class="quote">FOO</span>")
                           (candidates
                            . (lambda ()
                                (if (anything-current-buffer-is-modified)
                                    '("<span class="quote">modified</span>")
                                  '("<span class="quote">unmodified</span>")))))))
              (sources2 '(((name . "<span class="quote">BAR</span>")
                           (candidates
                            . (lambda ()
                                (if (anything-current-buffer-is-modified)
                                    '("<span class="quote">modified</span>")
                                  '("<span class="quote">unmodified</span>"))))))))
          (with-temp-buffer
            (clrhash anything-tick-hash)
            (insert "<span class="quote">1</span>")
            (anything-test-candidates sources1)
            (anything-test-candidates sources2)
            (anything-test-candidates sources1))))
      (expect '(("<span class="quote">BAR</span>" ("<span class="quote">unmodified</span>")))
        (let ((sources1 '(((name . "<span class="quote">FOO</span>")
                           (candidates
                            . (lambda ()
                                (if (anything-current-buffer-is-modified)
                                    '("<span class="quote">modified</span>")
                                  '("<span class="quote">unmodified</span>")))))))
              (sources2 '(((name . "<span class="quote">BAR</span>")
                           (candidates
                            . (lambda ()
                                (if (anything-current-buffer-is-modified)
                                    '("<span class="quote">modified</span>")
                                  '("<span class="quote">unmodified</span>"))))))))
          (with-temp-buffer
            (clrhash anything-tick-hash)
            (insert "<span class="quote">1</span>")
            (anything-test-candidates sources1)
            (anything-test-candidates sources2)
            (anything-test-candidates sources2))))
      (expect '(("<span class="quote">BAR</span>" ("<span class="quote">modified</span>")))
        (let ((sources1 '(((name . "<span class="quote">FOO</span>")
                           (candidates
                            . (lambda ()
                                (if (anything-current-buffer-is-modified)
                                    '("<span class="quote">modified</span>")
                                  '("<span class="quote">unmodified</span>")))))))
              (sources2 '(((name . "<span class="quote">BAR</span>")
                           (candidates
                            . (lambda ()
                                (if (anything-current-buffer-is-modified)
                                    '("<span class="quote">modified</span>")
                                  '("<span class="quote">unmodified</span>"))))))))
          (with-temp-buffer
            (clrhash anything-tick-hash)
            (insert "<span class="quote">1</span>")
            (anything-test-candidates sources1)
            (anything-test-candidates sources2)
            (with-temp-buffer
              (anything-test-candidates sources2)))))
      (desc "<span class="quote">anything-source-name</span>")
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates '(((name . "<span class="quote">FOO</span>")
                                       (init
                                        . (lambda () (setq v anything-source-name)))
                                       (candidates "<span class="quote">ok</span>"))))
          v))
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates '(((name . "<span class="quote">FOO</span>")
                                       (candidates
                                        . (lambda ()
                                            (setq v anything-source-name)
                                            '("<span class="quote">ok</span>"))))))
          v))
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates '(((name . "<span class="quote">FOO</span>")
                                       (candidates "<span class="quote">ok</span>")
                                       (candidate-transformer
                                        . (lambda (c)
                                            (setq v anything-source-name)
                                            c)))))
          v))
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates '(((name . "<span class="quote">FOO</span>")
                                       (candidates "<span class="quote">ok</span>")
                                       (filtered-candidate-transformer
                                        . (lambda (c s)
                                            (setq v anything-source-name)
                                            c)))))
          v))
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates '(((name . "<span class="quote">FOO</span>")
                                       (candidates "<span class="quote">ok</span>")
                                       (display-to-real
                                        . (lambda (c)
                                            (setq v anything-source-name)
                                            c))
                                       (action . identity))))
          (anything-execute-selection-action)
          v))
      (desc "<span class="quote">anything-candidate-buffer create</span>")
      (expect "<span class="quote"> *anything candidates:FOO*</span>"
        (let* (anything-candidate-buffer-alist
               (anything-source-name "<span class="quote">FOO</span>")
               (buf (anything-candidate-buffer 'global)))
          (prog1 (buffer-name buf)
            (kill-buffer buf))))
      (expect "<span class="quote"> *anything candidates:FOO*aTestBuffer</span>"
        (let* (anything-candidate-buffer-alist
               (anything-source-name "<span class="quote">FOO</span>")
               (anything-current-buffer (get-buffer-create "<span class="quote">aTestBuffer</span>"))
               (buf (anything-candidate-buffer 'local)))
          (prog1 (buffer-name buf)
            (kill-buffer anything-current-buffer)
            (kill-buffer buf))))
      (expect 0
        (let (anything-candidate-buffer-alist
              (anything-source-name "<span class="quote">FOO</span>") buf)
          (with-current-buffer  (anything-candidate-buffer 'global)
            (insert "<span class="quote">1</span>"))
          (setq buf  (anything-candidate-buffer 'global))
          (prog1 (buffer-size buf)
            (kill-buffer buf))))
      (desc "<span class="quote">anything-candidate-buffer get-buffer</span>")
      (expect "<span class="quote"> *anything candidates:FOO*</span>"
        (let* (anything-candidate-buffer-alist
               (anything-source-name "<span class="quote">FOO</span>")
               (buf (anything-candidate-buffer 'global)))
          (prog1 (buffer-name (anything-candidate-buffer))
            (kill-buffer buf))))
      (expect "<span class="quote"> *anything candidates:FOO*aTestBuffer</span>"
        (let* (anything-candidate-buffer-alist
               (anything-source-name "<span class="quote">FOO</span>")
               (anything-current-buffer (get-buffer-create "<span class="quote">aTestBuffer</span>"))
               (buf (anything-candidate-buffer 'local)))
          (prog1 (buffer-name (anything-candidate-buffer))
            (kill-buffer anything-current-buffer)
            (kill-buffer buf))))
      (expect "<span class="quote"> *anything candidates:FOO*</span>"
        (let* (anything-candidate-buffer-alist
               (anything-source-name "<span class="quote">FOO</span>")
               (buf-local (anything-candidate-buffer 'local))
               (buf-global (anything-candidate-buffer 'global)))
          (prog1 (buffer-name (anything-candidate-buffer))
            (kill-buffer buf-local)
            (kill-buffer buf-global))))
      (expect "<span class="quote"> *anything candidates:FOO*aTestBuffer</span>"
        (let* (anything-candidate-buffer-alist
               (anything-source-name "<span class="quote">FOO</span>")
               (anything-current-buffer (get-buffer-create "<span class="quote">aTestBuffer</span>"))
               (buf-global (anything-candidate-buffer 'global))
               (buf-local (anything-candidate-buffer 'local)))
          (prog1 (buffer-name (anything-candidate-buffer))
            (kill-buffer buf-local)
            (kill-buffer buf-global))))
      (expect nil
        (let* (anything-candidate-buffer-alist
               (anything-source-name "<span class="quote">NOP__</span>"))
          (anything-candidate-buffer)))
      (desc "<span class="quote">anything-candidate-buffer register-buffer</span>")
      (expect "<span class="quote"> *anything test candidates*</span>"
        (let (anything-candidate-buffer-alist
              (buf (get-buffer-create "<span class="quote"> *anything test candidates*</span>")))
          (with-current-buffer buf
            (insert "<span class="quote">1\n2\n</span>")
            (prog1 (buffer-name (anything-candidate-buffer buf))
              (kill-buffer (current-buffer))))))
      (expect "<span class="quote"> *anything test candidates*</span>"
        (let (anything-candidate-buffer-alist
              (buf (get-buffer-create "<span class="quote"> *anything test candidates*</span>")))
          (with-current-buffer buf
            (insert "<span class="quote">1\n2\n</span>")
            (anything-candidate-buffer buf)
            (prog1 (buffer-name (anything-candidate-buffer))
              (kill-buffer (current-buffer))))))
      (expect "<span class="quote">1\n2\n</span>"
        (let (anything-candidate-buffer-alist
              (buf (get-buffer-create "<span class="quote"> *anything test candidates*</span>")))
          (with-current-buffer buf
            (insert "<span class="quote">1\n2\n</span>")
            (anything-candidate-buffer buf)
            (prog1 (buffer-string)
              (kill-buffer (current-buffer))))))
      (expect "<span class="quote">buf1</span>"
        (let (anything-candidate-buffer-alist
              (anything-source-name "<span class="quote">foo</span>")
              (buf1 (get-buffer-create "<span class="quote">buf1</span>"))
              (buf2 (get-buffer-create "<span class="quote">buf2</span>")))
          (anything-candidate-buffer buf1)
          (anything-candidate-buffer buf2)
          (prog1 (buffer-name (anything-candidate-buffer buf1))
            (kill-buffer buf1)
            (kill-buffer buf2))))
      (desc "<span class="quote">action attribute</span>")
      (expect "<span class="quote">foo</span>"
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (candidates "<span class="quote">foo</span>")
            (action ("<span class="quote">identity</span>" . identity)))))
        (anything-execute-selection-action))
      (expect "<span class="quote">foo</span>"
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (candidates "<span class="quote">foo</span>")
            (action ("<span class="quote">identity</span>" . (lambda (c) (identity c)))))))
        (anything-execute-selection-action))
      (desc "<span class="quote">anything-get-default-action</span>")
      (expect 'upcase
        (anything-get-default-action '(("<span class="quote">upcase</span>" . upcase))))
      (expect 'downcase
        (anything-get-default-action '(("<span class="quote">downcase</span>" . downcase))))
      (expect (lambda (x) (capitalize x))
        (anything-get-default-action (lambda (x) (capitalize x))))
      (expect 'identity
        (anything-get-default-action 'identity))
      (desc "<span class="quote">anything-execute-selection-action</span>")
      (expect "<span class="quote">FOO</span>"
        (anything-execute-selection-action
         "<span class="quote">foo</span>" '(("<span class="quote">upcase</span>" . upcase))  nil))
      (expect "<span class="quote">FOO</span>"
        (anything-execute-selection-action
         "<span class="quote">foo</span>" '(("<span class="quote">upcase</span>" . (lambda (c) (upcase c)))) nil))

      (desc "<span class="quote">display-to-real attribute</span>")
      (expect "<span class="quote">FOO</span>"
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (candidates "<span class="quote">foo</span>")
            (display-to-real . upcase)
            (action ("<span class="quote">identity</span>" . identity)))))
        (anything-execute-selection-action))
      (desc "<span class="quote">cleanup test</span>")
      (expect 'cleaned
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">TEST</span>")
              (cleanup . (lambda () (setq v 'cleaned))))))
          v))
      (desc "<span class="quote">anything-get-current-source</span>")
      <span class="linecomment">;; in init/candidates/action/candidate-transformer/filtered-candidate-transformer</span>
      <span class="linecomment">;; display-to-real/cleanup function</span>
      (expect "<span class="quote">FOO</span>"
        (assoc-default
         'name
         (anything-funcall-with-source '((name . "<span class="quote">FOO</span>")) 'anything-get-current-source)))
      <span class="linecomment">;; init</span>
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (init . (lambda () (setq v (anything-get-current-source)))))))
          (assoc-default 'name v)))
      <span class="linecomment">;; candidates</span>
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (candidates . (lambda () (setq v (anything-get-current-source)) '("<span class="quote">a</span>"))))))
          (assoc-default 'name v)))
      <span class="linecomment">;; action</span>
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (candidates "<span class="quote">a</span>")
              (action
               . (lambda (c) (setq v (anything-get-current-source)) c)))))
          (anything-execute-selection-action)
          (assoc-default 'name v)))
      <span class="linecomment">;; candidate-transformer</span>
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (candidates "<span class="quote">a</span>")
              (candidate-transformer
               . (lambda (c) (setq v (anything-get-current-source)) c)))))
          (assoc-default 'name v)))
      <span class="linecomment">;; filtered-candidate-transformer</span>
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (candidates "<span class="quote">a</span>")
              (filtered-candidate-transformer
               . (lambda (c s) (setq v (anything-get-current-source)) c)))))
          (assoc-default 'name v)))
      <span class="linecomment">;; action-transformer</span>
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (candidates "<span class="quote">a</span>")
              (action-transformer
               . (lambda (a c) (setq v (anything-get-current-source)) a))
              (action . identity))))
          (anything-execute-selection-action)
          (assoc-default 'name v)))
      <span class="linecomment">;; display-to-real</span>
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (init . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                                   (insert "<span class="quote">a\n</span>"))))
              (candidates-in-buffer)
              (display-to-real
               . (lambda (c) (setq v (anything-get-current-source)) c))
              (action . identity))))
          (anything-execute-selection-action)
          (assoc-default 'name v)))
      <span class="linecomment">;; cleanup</span>
      (expect "<span class="quote">FOO</span>"
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (candidates "<span class="quote">a</span>")
              (cleanup
               . (lambda () (setq v (anything-get-current-source)))))))
          (assoc-default 'name v)))
      <span class="linecomment">;; candidates are displayed</span>
      (expect "<span class="quote">TEST</span>"
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (candidates "<span class="quote">foo</span>")
            (action ("<span class="quote">identity</span>" . identity)))))
        (assoc-default 'name (anything-get-current-source)))
      (desc "<span class="quote">anything-attr</span>")
      (expect "<span class="quote">FOO</span>"
        (anything-funcall-with-source
         '((name . "<span class="quote">FOO</span>"))
         (lambda ()
           (anything-attr 'name))))
      (expect 'fuga
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (hoge . fuga)
              (init . (lambda () (setq v (anything-attr 'hoge))))
              (candidates "<span class="quote">a</span>"))))
          v))
      (expect nil
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (init . (lambda () (setq v (anything-attr 'hoge))))
              (candidates "<span class="quote">a</span>"))))
          v))
      (expect nil
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (hoge)                    <span class="linecomment">;INCOMPATIBLE!</span>
              (init . (lambda () (setq v (anything-attr 'hoge))))
              (candidates "<span class="quote">a</span>"))))
          v))
      (desc "<span class="quote">anything-attr*</span>")
      (expect "<span class="quote">generic</span>"
        (let (v (value1 "<span class="quote">generic</span>"))
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (hoge . value1)
              (init . (lambda () (setq v (anything-attr* 'hoge)))))))
          v))
      (desc "<span class="quote">anything-attr-defined</span>")
      (expect (non-nil)
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (hoge)
              (init . (lambda () (setq v (anything-attr-defined 'hoge))))
              (candidates "<span class="quote">a</span>"))))
          v))      
      (expect nil
        (let (v)
          (anything-test-candidates
           '(((name . "<span class="quote">FOO</span>")
              (init . (lambda () (setq v (anything-attr-defined 'hoge))))
              (candidates "<span class="quote">a</span>"))))
          v))      
      (desc "<span class="quote">anything-attrset</span>")
      (expect '((name . "<span class="quote">FOO</span>") (hoge . 77))
        (let ((src '((name . "<span class="quote">FOO</span>") (hoge))))
          (anything-attrset 'hoge 77 src)
          src))
      (expect 77
        (anything-attrset 'hoge 77 '((name . "<span class="quote">FOO</span>") (hoge))))

      (expect '((name . "<span class="quote">FOO</span>") (hoge . 77))
        (let ((src '((name . "<span class="quote">FOO</span>") (hoge . 1))))
          (anything-attrset 'hoge 77 src)
          src))

      (expect '((name . "<span class="quote">FOO</span>") (hoge . 77) (x))
        (let ((src '((name . "<span class="quote">FOO</span>") (x))))
          (anything-attrset 'hoge 77 src)
          src))
      (expect 77
        (anything-attrset 'hoge 77 '((name . "<span class="quote">FOO</span>"))))
      (desc "<span class="quote">anything-preselect</span>")
      <span class="linecomment">;; entire candidate</span>
      (expect "<span class="quote">foo</span>"
        (with-current-buffer (anything-create-anything-buffer t)
          (let ((anything-pattern "<span class="quote"></span>")
                (anything-test-mode t))
            (anything-process-source '((name . "<span class="quote">test</span>")
                                       (candidates "<span class="quote">hoge</span>" "<span class="quote">foo</span>" "<span class="quote">bar</span>")))
            (anything-preselect "<span class="quote">foo</span>")
            (anything-get-selection))))
      <span class="linecomment">;; regexp</span>
      (expect "<span class="quote">foo</span>"
        (with-current-buffer (anything-create-anything-buffer t)
          (let ((anything-pattern "<span class="quote"></span>")
                (anything-test-mode t))
            (anything-process-source '((name . "<span class="quote">test</span>")
                                       (candidates "<span class="quote">hoge</span>" "<span class="quote">foo</span>" "<span class="quote">bar</span>")))
            (anything-preselect "<span class="quote">fo+</span>")
            (anything-get-selection))))
      <span class="linecomment">;; no match -&gt; first entry</span>
      (expect "<span class="quote">hoge</span>"
        (with-current-buffer (anything-create-anything-buffer t)
          (let ((anything-pattern "<span class="quote"></span>")
                (anything-test-mode t))
            (anything-process-source '((name . "<span class="quote">test</span>")
                                       (candidates "<span class="quote">hoge</span>" "<span class="quote">foo</span>" "<span class="quote">bar</span>")))
            (anything-preselect "<span class="quote">not found</span>")
            (anything-get-selection))))
      (desc "<span class="quote">anything-check-new-input</span>")
      (expect "<span class="quote">newpattern</span>"
        (stub anything-update)
        (stub anything-action-window)
        (let ((anything-pattern "<span class="quote">pattern</span>"))
          (anything-check-new-input "<span class="quote">newpattern</span>")
          anything-pattern))
      <span class="linecomment">;; anything-input == nil when action window is available</span>
      (expect nil
        (stub anything-update)
        (stub anything-action-window =&gt; t)
        (let ((anything-pattern "<span class="quote">pattern</span>")
              anything-input)
          (anything-check-new-input "<span class="quote">newpattern</span>")
          anything-input))
      <span class="linecomment">;; anything-input == anything-pattern unless action window is available</span>
      (expect "<span class="quote">newpattern</span>"
        (stub anything-update)
        (stub anything-action-window =&gt; nil)
        (let ((anything-pattern "<span class="quote">pattern</span>")
              anything-input)
          (anything-check-new-input "<span class="quote">newpattern</span>")
          anything-input))
      (expect (mock (anything-update))
        (stub anything-action-window)
        (let (anything-pattern)
          (anything-check-new-input "<span class="quote">foo</span>")))
      (desc "<span class="quote">anything-update</span>")
      (expect (mock (anything-process-source '((name . "<span class="quote">1</span>"))))
        (anything-test-update '(((name . "<span class="quote">1</span>"))) "<span class="quote"></span>"))
      <span class="linecomment">;; (find-function 'anything-update)</span>
      <span class="linecomment">;; TODO el-mock.el should express 2nd call of function.</span>
      <span class="linecomment">;;     (expect (mock (anything-process-source '((name . "2"))))</span>
      <span class="linecomment">;;       (stub anything-get-sources =&gt; '(((name . "1")) ((name . "2"))))</span>
      <span class="linecomment">;;       (stub anything-log-run-hook)</span>
      <span class="linecomment">;;       (stub anything-maybe-fit-frame)</span>
      <span class="linecomment">;;       (stub run-with-idle-timer)</span>
      <span class="linecomment">;;       (anything-update))</span>
      (expect (mock (run-with-idle-timer * nil 'anything-process-delayed-sources
                                         '(((name . "<span class="quote">2</span>") (delayed)))))
        (stub anything-get-sources =&gt; '(((name . "<span class="quote">1</span>"))
                                        ((name . "<span class="quote">2</span>") (delayed))))
        (stub anything-log-run-hook)
        (stub anything-maybe-fit-frame)
        (let ((anything-pattern "<span class="quote"></span>") anything-test-mode)
          (anything-update)))

      (desc "<span class="quote">requires-pattern attribute</span>")
      (expect (not-called anything-process-source)
        (anything-test-update '(((name . "<span class="quote">1</span>") (requires-pattern))) "<span class="quote"></span>"))
      (expect (not-called anything-process-source)
        (anything-test-update '(((name . "<span class="quote">1</span>") (requires-pattern . 3))) "<span class="quote">xx</span>"))

      (desc "<span class="quote">anything-normalize-sources</span>")
      (expect '(anything-c-source-test)
        (anything-normalize-sources 'anything-c-source-test))
      (expect '(anything-c-source-test)
        (anything-normalize-sources '(anything-c-source-test)))
      (expect '(anything-c-source-test)
        (let ((anything-sources '(anything-c-source-test)))
          (anything-normalize-sources nil)))
      (expect '(((name . "<span class="quote">test</span>")))
        (anything-normalize-sources '((name . "<span class="quote">test</span>"))))
      (expect '(((name . "<span class="quote">test</span>")))
        (anything-normalize-sources '(((name . "<span class="quote">test</span>")))))
      (desc "<span class="quote">anything-get-action</span>")
      (expect '(("<span class="quote">identity</span>" . identity))
        (stub buffer-size =&gt; 1)
        (stub anything-get-current-source =&gt; '((name . "<span class="quote">test</span>")
                                               (action ("<span class="quote">identity</span>" . identity))))
        (anything-get-action))
      (expect 'identity
        (stub buffer-size =&gt; 1)
        (stub anything-get-current-source =&gt; '((name . "<span class="quote">test</span>")
                                               (action . identity)))
        (anything-get-action))
      (expect '((("<span class="quote">identity</span>" . identity)) "<span class="quote">action-transformer is called</span>")
        (stub buffer-size =&gt; 1)
        (stub anything-get-current-source
              =&gt; '((name . "<span class="quote">test</span>")
                   (action ("<span class="quote">identity</span>" . identity))
                   (action-transformer
                    . (lambda (actions selection)
                        (list actions selection)))))
        (stub anything-get-selection =&gt; "<span class="quote">action-transformer is called</span>")
        (anything-get-action))
      (desc "<span class="quote">anything-select-nth-action</span>")
      (expect (error error *)
        (stub anything-get-selection =&gt; nil)
        (anything-select-nth-action 0))
      (desc "<span class="quote">anything-get-nth-action</span>")
      (expect 'cadr
        (anything-get-nth-action 2 '(("<span class="quote">0</span>" . car) ("<span class="quote">1</span>" . cdr) ("<span class="quote">2</span>" . cadr))))
      (expect (error error *)
        (anything-get-nth-action 2 '(("<span class="quote">0</span>" . car))))
      (expect 'identity
        (anything-get-nth-action 0 'identity))
      (expect (error error *)
        (anything-get-nth-action 1 'identity))
      (expect (error error *)
        (anything-get-nth-action 0 'unbound-function-xxx))
      (expect (error error *)
        (anything-get-nth-action 0 "<span class="quote">invalid data</span>"))
      (desc "<span class="quote">anything-funcall-foreach</span>")
      (expect (mock (upcase "<span class="quote">foo</span>"))
        (stub anything-get-sources =&gt; '(((init . (lambda () (upcase "<span class="quote">foo</span>"))))))
        (anything-funcall-foreach 'init))
      (expect (mock (downcase "<span class="quote">bar</span>"))
        (stub anything-get-sources =&gt; '(((init . (lambda () (upcase "<span class="quote">foo</span>"))))
                                        ((init . (lambda () (downcase "<span class="quote">bar</span>"))))))
        (anything-funcall-foreach 'init))
      (expect (not-called anything-funcall-with-source)
        (stub anything-get-sources =&gt; '(((init . (lambda () (upcase "<span class="quote">foo</span>"))))))
        (anything-funcall-foreach 'not-found))
      <span class="linecomment">;; TODO anything-select-with-digit-shortcut test</span>
      (desc "<span class="quote">anything-get-cached-candidates</span>")
      (expect '("<span class="quote">cached</span>" "<span class="quote">version</span>")
        (let ((anything-candidate-cache '(("<span class="quote">test</span>" "<span class="quote">cached</span>" "<span class="quote">version</span>"))))
          (anything-get-cached-candidates '((name . "<span class="quote">test</span>")
                                            (candidates "<span class="quote">new</span>")))))
      (expect '("<span class="quote">new</span>")
        (let ((anything-candidate-cache '(("<span class="quote">other</span>" "<span class="quote">cached</span>" "<span class="quote">version</span>"))))
          (anything-get-cached-candidates '((name . "<span class="quote">test</span>")
                                            (candidates "<span class="quote">new</span>")))))
      (expect '(("<span class="quote">test</span>" "<span class="quote">new</span>")
                ("<span class="quote">other</span>" "<span class="quote">cached</span>" "<span class="quote">version</span>"))
        (let ((anything-candidate-cache '(("<span class="quote">other</span>" "<span class="quote">cached</span>" "<span class="quote">version</span>"))))
          (anything-get-cached-candidates '((name . "<span class="quote">test</span>")
                                            (candidates "<span class="quote">new</span>")))
          anything-candidate-cache))
      (expect '(("<span class="quote">other</span>" "<span class="quote">cached</span>" "<span class="quote">version</span>"))
        (let ((anything-candidate-cache '(("<span class="quote">other</span>" "<span class="quote">cached</span>" "<span class="quote">version</span>"))))
          (anything-get-cached-candidates '((name . "<span class="quote">test</span>")
                                            (candidates "<span class="quote">new</span>")
                                            (volatile)))
          anything-candidate-cache))
      <span class="linecomment">;; TODO when candidates == process</span>
      <span class="linecomment">;; TODO anything-output-filter</span>
      (desc "<span class="quote">candidate-number-limit attribute</span>")
      (expect '("<span class="quote">a</span>" "<span class="quote">b</span>")
        (let ((anything-pattern "<span class="quote"></span>")
              (anything-candidate-number-limit 20))
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>")
                                      (candidate-number-limit . 2) (volatile)))))
      (expect '("<span class="quote">a</span>" "<span class="quote">b</span>")
        (let ((anything-pattern "<span class="quote">[abc]</span>")
              (anything-candidate-number-limit 20))
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>")
                                      (candidate-number-limit . 2) (volatile)))))
      (expect '("<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>" "<span class="quote">d</span>")
        (let ((anything-pattern "<span class="quote">[abcd]</span>")
              (anything-candidate-number-limit 2))
          (anything-compute-matches '((name . "<span class="quote">FOO</span>") (candidates "<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>" "<span class="quote">d</span>")
                                      (candidate-number-limit) (volatile)))))
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>")))
        (let ((anything-candidate-number-limit 2))
          (anything-test-candidates
           '(((name . "<span class="quote">TEST</span>")
              (init
               . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                              (insert "<span class="quote">a\nb\nc\nd\n</span>"))))
              (candidates . anything-candidates-in-buffer)
              (match identity)
              (candidate-number-limit . 3)
              (volatile))))))
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote">c</span>")))
        (let ((anything-candidate-number-limit 2))
          (anything-test-candidates
           '(((name . "<span class="quote">TEST</span>")
              (init
               . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                              (insert "<span class="quote">a\nb\nc\nd\n</span>"))))
              (candidates . anything-candidates-in-buffer)
              (match identity)
              (candidate-number-limit . 3)
              (volatile)))
           "<span class="quote">.</span>")))
      (desc "<span class="quote">multiple init</span>")
      (expect '(1 . 2)
        (let (a b)
          (anything-test-candidates
           '(((name . "<span class="quote">test</span>")
              (init (lambda () (setq a 1))
                    (lambda () (setq b 2))))))
          (cons a b)))
      (expect 1
        (let (a)
          (anything-test-candidates
           '(((name . "<span class="quote">test</span>")
              (init (lambda () (setq a 1))))))
          a))
      (desc "<span class="quote">multiple cleanup</span>")
      (expect '(1 . 2)
        (let (a b)
          (anything-test-candidates
           '(((name . "<span class="quote">test</span>")
              (cleanup (lambda () (setq a 1))
                       (lambda () (setq b 2))))))
          (cons a b)))
      (desc "<span class="quote">anything-mklist</span>")
      (expect '(1)
        (anything-mklist 1))
      (expect '(2)
        (anything-mklist '(2)))
      (expect '((lambda ()))
        (anything-mklist (lambda ())))
      (desc "<span class="quote">anything-before-initialize-hook</span>")
      (expect 'called
        (let ((anything-before-initialize-hook '((lambda () (setq v 'called))))
              v)
          (anything-initialize)
          v))
      (desc "<span class="quote">anything-after-initialize-hook</span>")
      (expect '(b a)
        (let ((anything-before-initialize-hook
               '((lambda () (setq v '(a)))))
              (anything-after-initialize-hook
               '((lambda () (setq v (cons 'b v)))))
              v)
          (anything-initialize)
          v))
      (expect 0
        (let ((anything-after-initialize-hook
               '((lambda () (setq v (buffer-size (get-buffer anything-buffer))))))
              v)
          (anything-initialize)
          v))
      (desc "<span class="quote">get-line attribute</span>")
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">FOO+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>"))))
            (candidates-in-buffer)
            (get-line . (lambda (s e) (upcase (buffer-substring-no-properties s e))))))
         "<span class="quote">oo\\+</span>"))
      (desc "<span class="quote">with-anything-restore-variables</span>")
      (expect '(7 8)
        (let ((a 7) (b 8)
              (anything-restored-variables '(a b)))
          (with-anything-restore-variables
            (setq a 0 b 0))
          (list a b)))
      (desc "<span class="quote">anything-cleanup-hook</span>")
      (expect 'called
        (let ((anything-cleanup-hook
               '((lambda () (setq v 'called))))
              v)
          (anything-cleanup)
          v))
      (desc "<span class="quote">with-anything-display-same-window</span>")
      (expect (non-nil)
        (save-window-excursion
          (delete-other-windows)
          (split-window)
          
          (let ((buf (get-buffer-create "<span class="quote"> tmp</span>"))
                (win (selected-window)))
            (with-anything-display-same-window
              (display-buffer buf)
              (eq win (get-buffer-window buf))))))
      (expect (non-nil)
        (save-window-excursion
          (delete-other-windows)
          (split-window)
          
          (let ((buf (get-buffer-create "<span class="quote"> tmp</span>"))
                (win (selected-window)))
            (with-anything-display-same-window
              (pop-to-buffer buf)
              (eq win (get-buffer-window buf))))))
      (expect (non-nil)
        (save-window-excursion
          (delete-other-windows)
          (split-window)
          
          (let ((buf (get-buffer-create "<span class="quote"> tmp</span>"))
                (win (selected-window)))
            (with-anything-display-same-window
              (switch-to-buffer buf)
              (eq win (get-buffer-window buf))))))
      (expect (non-nil)
        (save-window-excursion
          (delete-other-windows)
          (let ((buf (get-buffer-create "<span class="quote"> tmp</span>"))
                (win (selected-window)))
            (with-anything-display-same-window
              (display-buffer buf)
              (eq win (get-buffer-window buf))))))
      (expect (non-nil)
        (save-window-excursion
          (delete-other-windows)
          (let ((buf (get-buffer-create "<span class="quote"> tmp</span>"))
                (win (selected-window)))
            (with-anything-display-same-window
              (pop-to-buffer buf)
              (eq win (get-buffer-window buf))))))
      (desc "<span class="quote">search-from-end attribute</span>")
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">baz+</span>" "<span class="quote">bar+</span>" "<span class="quote">foo+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>"))))
            (candidates-in-buffer)
            (search-from-end)))))
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">baz+</span>" "<span class="quote">bar+</span>" "<span class="quote">foo+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>"))))
            (candidates-in-buffer)
            (search-from-end)))
         "<span class="quote">\\+</span>"))
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">baz+</span>" "<span class="quote">bar+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>"))))
            (candidates-in-buffer)
            (search-from-end)
            (candidate-number-limit . 2)))))
      (expect '(("<span class="quote">TEST</span>" ("<span class="quote">baz+</span>" "<span class="quote">bar+</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">TEST</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (insert "<span class="quote">foo+\nbar+\nbaz+\n</span>"))))
            (candidates-in-buffer)
            (search-from-end)
            (candidate-number-limit . 2)))
         "<span class="quote">\\+</span>"))
      (expect '(("<span class="quote">a</span>" ("<span class="quote">c2</span>" "<span class="quote">c1</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">a</span>")
            (init . (lambda ()
                      (with-current-buffer (anything-candidate-buffer 'global)
                        (insert "<span class="quote">c1\nc2\n</span>"))))
            (search-from-end)
            (candidates-in-buffer)))))
      <span class="linecomment">;; BUG remain empty string, but the pattern is rare case.</span>
      (expect '(("<span class="quote">a</span>" ("<span class="quote">c</span>" "<span class="quote">b</span>" "<span class="quote">a</span>" "<span class="quote"></span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">a</span>")
            (init . (lambda ()
                      (with-current-buffer (anything-candidate-buffer 'global)
                        (insert "<span class="quote">a\nb\nc\n</span>"))))
            (search-from-end)
            (candidates-in-buffer)))
         "<span class="quote">a*</span>"))
      (desc "<span class="quote">header-name attribute</span>")
      (expect "<span class="quote">original is transformed</span>"
        (anything-test-update '(((name . "<span class="quote">original</span>")
                                 (candidates "<span class="quote">1</span>")
                                 (header-name
                                  . (lambda (name)
                                      (format "<span class="quote">%s is transformed</span>" name)))))
                              "<span class="quote"></span>")
        (with-current-buffer (anything-buffer-get)
          (buffer-string)
          (overlay-get (car (overlays-at (1+(point-min)))) 'display)))
      (desc "<span class="quote">volatile and match attribute</span>")
      <span class="linecomment">;; candidates function is called once per `anything-process-delayed-sources'</span>
      (expect 1
        (let ((v 0))
          (anything-test-candidates '(((name . "<span class="quote">test</span>")
                                       (candidates . (lambda () (incf v) '("<span class="quote">ok</span>")))
                                       (volatile)
                                       (match identity identity identity)))
                                    "<span class="quote">o</span>")
          v))
      (desc "<span class="quote">accept-empty attribute</span>")
      (expect nil
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>") (candidates "<span class="quote"></span>") (action . identity))))
        (anything-execute-selection-action))
      (expect "<span class="quote"></span>"
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>") (candidates "<span class="quote"></span>") (action . identity) (accept-empty))))
        (anything-execute-selection-action))
      (desc "<span class="quote">anything-tick-hash</span>")
      (expect nil
        (with-current-buffer (get-buffer-create "<span class="quote"> *00create+*</span>")
          (puthash "<span class="quote"> *00create+*/xxx</span>" 1 anything-tick-hash)
          (kill-buffer (current-buffer)))
        (gethash "<span class="quote"> *00create+*/xxx</span>" anything-tick-hash))
      (desc "<span class="quote">anything-execute-action-at-once-if-once</span>")
      (expect "<span class="quote">HOGE</span>"
        (let ((anything-execute-action-at-once-if-one t))
          (anything '(((name . "<span class="quote">one test1</span>")
                       (candidates "<span class="quote">hoge</span>")
                       (action . upcase))))))
      (expect "<span class="quote">ANY</span>"
        (let ((anything-execute-action-at-once-if-one t))
          (anything '(((name . "<span class="quote">one test2</span>")
                       (candidates "<span class="quote">hoge</span>" "<span class="quote">any</span>")
                       (action . upcase)))
                    "<span class="quote">an</span>")))
      <span class="linecomment">;; candidates &gt; 1</span>
      (expect (mock (read-string "<span class="quote">word: </span>" nil))
        (let ((anything-execute-action-at-once-if-one t))
          (anything '(((name . "<span class="quote">one test3</span>")
                       (candidates "<span class="quote">hoge</span>" "<span class="quote">foo</span>" "<span class="quote">bar</span>")
                       (action . identity)))
                    nil "<span class="quote">word: </span>")))
      (desc "<span class="quote">anything-quit-if-no-candidate</span>")
      (expect nil
        (let ((anything-quit-if-no-candidate t))
          (anything '(((name . "<span class="quote">zero test1</span>") (candidates) (action . upcase))))))
      (expect 'called
        (let (v (anything-quit-if-no-candidate (lambda () (setq v 'called))))
          (anything '(((name . "<span class="quote">zero test2</span>") (candidates) (action . upcase))))
          v))
      (desc "<span class="quote">real-to-display attribute</span>")
      (expect '(("<span class="quote">test</span>" (("<span class="quote">DDD</span>" . "<span class="quote">ddd</span>"))))
        (anything-test-candidates '(((name . "<span class="quote">test</span>")
                                     (candidates "<span class="quote">ddd</span>")
                                     (real-to-display . upcase)
                                     (action . identity)))))
      (expect '(("<span class="quote">test</span>" (("<span class="quote">DDD</span>" . "<span class="quote">ddd</span>"))))
        (anything-test-candidates '(((name . "<span class="quote">test</span>")
                                     (candidates ("<span class="quote">ignored</span>" . "<span class="quote">ddd</span>"))
                                     (real-to-display . upcase)
                                     (action . identity)))))
      (expect '(("<span class="quote">Commands</span>" (("<span class="quote">xxxhoge</span>" . "<span class="quote">hoge</span>") ("<span class="quote">xxxboke</span>" . "<span class="quote">boke</span>"))))
        (anything-test-candidates '(((name . "<span class="quote">Commands</span>")
                                     (candidates
                                      "<span class="quote">hoge</span>" "<span class="quote">boke</span>")
                                     (real-to-display . (lambda (x) (concat "<span class="quote">xxx</span>" x)))
                                     (action . identity)))
                                  "<span class="quote">xxx</span>"))
      (expect "<span class="quote">test\nDDD\n</span>"
        (anything-test-update '(((name . "<span class="quote">test</span>")
                                 (candidates "<span class="quote">ddd</span>")
                                 (real-to-display . upcase)
                                 (action . identity)))
                              "<span class="quote"></span>")
        (with-current-buffer (anything-buffer-get) (buffer-string)))
      (desc "<span class="quote">real-to-display and candidate-transformer attribute</span>")
      (expect '(("<span class="quote">test</span>" (("<span class="quote">DDD</span>" . "<span class="quote">ddd</span>"))))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (candidates "<span class="quote">ddd</span>")
            (candidate-transformer (lambda (cands) (mapcar (lambda (c) (cons "<span class="quote">X</span>" c)) cands)))
            (real-to-display . upcase)
            (action . identity)))))
      (expect "<span class="quote">test\nDDD\n</span>"
        (anything-test-update
         '(((name . "<span class="quote">test</span>")
            (candidates "<span class="quote">ddd</span>")
            (candidate-transformer (lambda (cands) (mapcar (lambda (c) (cons "<span class="quote">X</span>" c)) cands)))
            (real-to-display . upcase)
            (action . identity)))
         "<span class="quote"></span>")
        (with-current-buffer (anything-buffer-get) (buffer-string)))
      (desc "<span class="quote">real-to-display and candidates-in-buffer</span>")
      (expect '(("<span class="quote">test</span>" (("<span class="quote">A</span>" . "<span class="quote">a</span>") ("<span class="quote">B</span>" . "<span class="quote">b</span>"))))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (erase-buffer)
                            (insert "<span class="quote">a\nb\n</span>"))))
            (candidates-in-buffer)
            (real-to-display . upcase)
            (action . identity)))))
      (expect "<span class="quote">test\nA\nB\n</span>"
        (stub read-string)
        (anything
         '(((name . "<span class="quote">test</span>")
            (init
             . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                            (erase-buffer)
                            (insert "<span class="quote">a\nb\n</span>"))))
            (candidates-in-buffer)
            (real-to-display . upcase)
            (action . identity))))
        (with-current-buffer (anything-buffer-get) (buffer-string)))
      (desc "<span class="quote">Symbols are acceptable as candidate.</span>")
      (expect '(("<span class="quote">test</span>" (sym "<span class="quote">str</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (candidates sym "<span class="quote">str</span>")))))
      (expect '(("<span class="quote">test</span>" ((sym . realsym) ("<span class="quote">str</span>" . "<span class="quote">realstr</span>"))))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (candidates (sym . realsym) ("<span class="quote">str</span>" . "<span class="quote">realstr</span>"))))))
      (expect '(("<span class="quote">test</span>" (sym)))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (candidates sym "<span class="quote">str</span>")))
         "<span class="quote">sym</span>"))
      (expect '(("<span class="quote">test</span>" ("<span class="quote">str</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (candidates sym "<span class="quote">str</span>")))
         "<span class="quote">str</span>"))
      (expect '(("<span class="quote">test</span>" ((sym . realsym))))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (candidates (sym . realsym) ("<span class="quote">str</span>" . "<span class="quote">realstr</span>"))))
         "<span class="quote">sym</span>"))
      (expect '(("<span class="quote">test</span>" (("<span class="quote">str</span>" . "<span class="quote">realstr</span>"))))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (candidates (sym . realsym) ("<span class="quote">str</span>" . "<span class="quote">realstr</span>"))))
         "<span class="quote">str</span>"))
      (desc "<span class="quote">multiple transformers</span>")
      (expect '(("<span class="quote">test</span>" ("<span class="quote">&lt;FOO&gt;</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (candidates "<span class="quote">foo</span>")
            (candidate-transformer
             . (lambda (cands)
                 (anything-compose (list cands)
                                   (list (lambda (c) (mapcar 'upcase c))
                                         (lambda (c) (list (concat "<span class="quote">&lt;</span>" (car c) "<span class="quote">&gt;</span>")))))))))))
      (expect '("<span class="quote">&lt;FOO&gt;</span>")
        (anything-composed-funcall-with-source
         '((name . "<span class="quote">test</span>"))
         (list (lambda (c) (mapcar 'upcase c))
               (lambda (c) (list (concat "<span class="quote">&lt;</span>" (car c) "<span class="quote">&gt;</span>"))))
         '("<span class="quote">foo</span>"))
        )
      (expect '(("<span class="quote">test</span>" ("<span class="quote">&lt;FOO&gt;</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (candidates "<span class="quote">foo</span>")
            (candidate-transformer
             (lambda (c) (mapcar 'upcase c))
             (lambda (c) (list (concat "<span class="quote">&lt;</span>" (car c) "<span class="quote">&gt;</span>"))))))))
      (expect '(("<span class="quote">test</span>" ("<span class="quote">&lt;BAR&gt;</span>")))
        (anything-test-candidates
         '(((name . "<span class="quote">test</span>")
            (candidates "<span class="quote">bar</span>")
            (filtered-candidate-transformer
             (lambda (c s) (mapcar 'upcase c))
             (lambda (c s) (list (concat "<span class="quote">&lt;</span>" (car c) "<span class="quote">&gt;</span>"))))))))
      (expect '(("<span class="quote">find-file</span>" . find-file)
                ("<span class="quote">view-file</span>" . view-file))
        (stub zerop =&gt; nil)
        (stub anything-get-current-source
              =&gt; '((name . "<span class="quote">test</span>")
                   (action)
                   (action-transformer
                    . (lambda (a s)
                        (anything-compose
                         (list a s)
                         (list (lambda (a s) (push '("<span class="quote">view-file</span>" . view-file) a))
                               (lambda (a s) (push '("<span class="quote">find-file</span>" . find-file) a))))))))
        (anything-get-action))
      (expect '(("<span class="quote">find-file</span>" . find-file)
                ("<span class="quote">view-file</span>" . view-file))
        (stub zerop =&gt; nil)
        (stub anything-get-current-source
              =&gt; '((name . "<span class="quote">test</span>")
                   (action)
                   (action-transformer
                    (lambda (a s) (push '("<span class="quote">view-file</span>" . view-file) a))
                    (lambda (a s) (push '("<span class="quote">find-file</span>" . find-file) a)))))
        (anything-get-action))
      (desc "<span class="quote">define-anything-type-attribute</span>")
      (expect '((file (action . find-file)))
        (let (anything-type-attributes)
          (define-anything-type-attribute 'file '((action . find-file)))
          anything-type-attributes))
      (expect '((file (action . find-file)))
        (let ((anything-type-attributes '((file (action . view-file)))))
          (define-anything-type-attribute 'file '((action . find-file)))
          anything-type-attributes))
      (expect '((file (action . find-file))
                (buffer (action . switch-to-buffer)))
        (let (anything-type-attributes)
          (define-anything-type-attribute 'buffer '((action . switch-to-buffer)))
          (define-anything-type-attribute 'file '((action . find-file)))
          anything-type-attributes))
      (desc "<span class="quote">anything-approximate-candidate-number</span>")
      (expect 0
        (with-temp-buffer
          (let ((anything-buffer (current-buffer)))
            (anything-approximate-candidate-number))))
      (expect 1
        (with-temp-buffer
          (let ((anything-buffer (current-buffer)))
            (insert "<span class="quote">Title\n</span>"
                    "<span class="quote">candiate1\n</span>")
            (anything-approximate-candidate-number))))
      (expect t
        (with-temp-buffer
          (let ((anything-buffer (current-buffer)))
            (insert "<span class="quote">Title\n</span>"
                    "<span class="quote">candiate1\n</span>"
                    "<span class="quote">candiate2\n</span>")
            (&lt;= 2 (anything-approximate-candidate-number)))))
      (expect 1
        (with-temp-buffer
          (let ((anything-buffer (current-buffer)))
            (insert "<span class="quote">Title\n</span>"
                    (propertize "<span class="quote">multi\nline\n</span>" 'anything-multiline t))
            (anything-approximate-candidate-number))))
      (expect t
        (with-temp-buffer
          (let ((anything-buffer (current-buffer))
                (anything-candidate-separator "<span class="quote">-----</span>"))
            (insert "<span class="quote">Title\n</span>"
                    (propertize "<span class="quote">multi\nline1\n</span>" 'anything-multiline t)
                    "<span class="quote">-----\n</span>"
                    (propertize "<span class="quote">multi\nline2\n</span>" 'anything-multiline t))
            (&lt;= 2 (anything-approximate-candidate-number)))))
      (desc "<span class="quote">delayed-init attribute</span>")
      (expect 0
        (let ((value 0))
          (anything-test-candidates '(((name . "<span class="quote">test</span>")
                                       (delayed-init . (lambda () (incf value)))
                                       (candiates "<span class="quote">abc</span>")
                                       (requires-pattern . 2)))
                                    "<span class="quote"></span>")
          value))
      (expect 1
        (let ((value 0))
          (anything-test-candidates '(((name . "<span class="quote">test</span>")
                                       (delayed-init . (lambda () (incf value)))
                                       (candiates "<span class="quote">abc</span>")
                                       (requires-pattern . 2)))
                                    "<span class="quote">abc</span>")
          value))
      (expect 2
        (let ((value 0))
          (anything-test-candidates '(((name . "<span class="quote">test</span>")
                                       (delayed-init (lambda () (incf value))
                                                     (lambda () (incf value)))
                                       (candiates "<span class="quote">abc</span>")
                                       (requires-pattern . 2)))
                                    "<span class="quote">abc</span>")
          value))
      (expect t
        (let (value)
          (with-temp-buffer
            (anything-test-candidates '(((name . "<span class="quote">test</span>")
                                         (delayed-init
                                          . (lambda () (setq value
                                                             (eq anything-current-buffer (current-buffer)))))
                                         (candiates "<span class="quote">abc</span>")
                                         (requires-pattern . 2)))
                                      "<span class="quote">abc</span>")
            value)))
      (desc "<span class="quote">pattern-transformer attribute</span>")
      (expect '(("<span class="quote">test2</span>" ("<span class="quote">foo</span>")) ("<span class="quote">test3</span>" ("<span class="quote">bar</span>")))
        (anything-test-candidates '(((name . "<span class="quote">test1</span>")
                                     (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>"))
                                    ((name . "<span class="quote">test2</span>")
                                     (pattern-transformer . (lambda (pat) (substring pat 1)))
                                     (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>"))
                                    ((name . "<span class="quote">test3</span>")
                                     (pattern-transformer . (lambda (pat) "<span class="quote">bar</span>"))
                                     (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")))
                                  "<span class="quote">xfoo</span>"))
      (expect '(("<span class="quote">test2</span>" ("<span class="quote">foo</span>")) ("<span class="quote">test3</span>" ("<span class="quote">bar</span>")))
        (anything-test-candidates '(((name . "<span class="quote">test1</span>")
                                     (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>"))
                                    ((name . "<span class="quote">test2</span>")
                                     (pattern-transformer (lambda (pat) (substring pat 1)))
                                     (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>"))
                                    ((name . "<span class="quote">test3</span>")
                                     (pattern-transformer (lambda (pat) "<span class="quote">bar</span>"))
                                     (candidates "<span class="quote">foo</span>" "<span class="quote">bar</span>")))
                                  "<span class="quote">xfoo</span>"))
      (expect '(("<span class="quote">test2</span>" ("<span class="quote">foo</span>")) ("<span class="quote">test3</span>" ("<span class="quote">bar</span>")))
        (anything-test-candidates '(((name . "<span class="quote">test1</span>")
                                     (init
                                      . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                                                     (insert "<span class="quote">foo\nbar\n</span>"))))
                                     (candidates-in-buffer))
                                    ((name . "<span class="quote">test2</span>")
                                     (pattern-transformer . (lambda (pat) (substring pat 1)))
                                     (init
                                      . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                                                     (insert "<span class="quote">foo\nbar\n</span>"))))
                                     (candidates-in-buffer))
                                    ((name . "<span class="quote">test3</span>")
                                     (pattern-transformer . (lambda (pat) "<span class="quote">bar</span>"))
                                     (init
                                      . (lambda () (with-current-buffer (anything-candidate-buffer 'global)
                                                     (insert "<span class="quote">foo\nbar\n</span>"))))
                                     (candidates-in-buffer)))
                                  "<span class="quote">xfoo</span>"))
      (desc "<span class="quote">anything-recent-push</span>")
      (expect '("<span class="quote">foo</span>" "<span class="quote">bar</span>" "<span class="quote">baz</span>")
        (let ((lst '("<span class="quote">bar</span>" "<span class="quote">baz</span>")))
          (anything-recent-push "<span class="quote">foo</span>" 'lst)))
      (expect '("<span class="quote">foo</span>" "<span class="quote">bar</span>" "<span class="quote">baz</span>")
        (let ((lst '("<span class="quote">foo</span>" "<span class="quote">bar</span>" "<span class="quote">baz</span>")))
          (anything-recent-push "<span class="quote">foo</span>" 'lst)))
      (expect '("<span class="quote">foo</span>" "<span class="quote">bar</span>" "<span class="quote">baz</span>")
        (let ((lst '("<span class="quote">bar</span>" "<span class="quote">foo</span>" "<span class="quote">baz</span>")))
          (anything-recent-push "<span class="quote">foo</span>" 'lst)))
      (desc "<span class="quote">anything-require-at-least-version</span>")
      (expect nil
        (anything-require-at-least-version "<span class="quote">1.1</span>"))
      (expect nil
        (anything-require-at-least-version "<span class="quote">1.200</span>"))
      (expect nil
        (anything-require-at-least-version
         (and (string-match "<span class="quote">1\.\\([0-9]+\\)</span>" anything-version)
              (match-string 0 anything-version))))
      (expect (error)
        (anything-require-at-least-version "<span class="quote">1.999</span>"))
      (expect (error)
        (anything-require-at-least-version "<span class="quote">1.2000</span>"))
      (desc "<span class="quote">anything-once</span>")
      (expect 2
        (let ((i 0))
          (anything-test-candidates
           '(((name . "<span class="quote">1</span>")
              (init . (lambda () (incf i))))
             ((name . "<span class="quote">2</span>")
              (init . (lambda () (incf i))))))
          i))
      (expect 1
        (let ((i 0))
          (anything-test-candidates
           '(((name . "<span class="quote">1</span>")
              (init . (lambda () (anything-once (lambda () (incf i))))))
             ((name . "<span class="quote">2</span>")
              (init . (lambda () (anything-once (lambda () (incf i))))))))
          i))
      (expect 1
        (let ((i 0))
          (flet ((init1 () (anything-once (lambda () (incf i)))))
            (anything-test-candidates
             '(((name . "<span class="quote">1</span>")
                (init . init1))
               ((name . "<span class="quote">2</span>")
                (init . init1)))))
          i))
      (desc "<span class="quote">anything-marked-candidates</span>")
      (expect '("<span class="quote">mark3</span>" "<span class="quote">mark1</span>")
        (let* ((source '((name . "<span class="quote">mark test</span>")))
               (anything-marked-candidates
                `((,source . "<span class="quote">mark1</span>")
                  (((name . "<span class="quote">other</span>")) . "<span class="quote">mark2</span>")
                  (,source . "<span class="quote">mark3</span>"))))
          (stub anything-buffer-get =&gt; (current-buffer))
          (stub anything-get-current-source =&gt; source)
          (anything-marked-candidates)))
      (expect '("<span class="quote">current</span>")
        (let* ((source '((name . "<span class="quote">mark test</span>")))
               (anything-marked-candidates nil))
          (stub anything-get-current-source =&gt; source)
          (stub anything-get-selection =&gt; "<span class="quote">current</span>")
          (anything-marked-candidates)))
      (desc "<span class="quote">anything-marked-candidates with coerce</span>")
      (expect '(mark3 mark1)
        (let* ((source '((name . "<span class="quote">mark test</span>")
                         (coerce . intern)))
               (anything-marked-candidates
                `((,source . "<span class="quote">mark1</span>")
                  (((name . "<span class="quote">other</span>")) . "<span class="quote">mark2</span>")
                  (,source . "<span class="quote">mark3</span>"))))
          (stub anything-buffer-get =&gt; (current-buffer))
          (stub anything-get-current-source =&gt; source)
          (anything-marked-candidates)))
      (desc "<span class="quote">anything-let</span>")
      (expect '(1 10000 nil)
        (let ((a 9999)
              (b 8)
              (c)
              (anything-buffer (exps-tmpbuf)))
          (anything-let ((a 1)
                         (b (1+ a))
                         c)
            (anything-create-anything-buffer))
          (with-current-buffer anything-buffer
            (list a b c))))
      (expect (non-nil)
        (let ((a 9999)
              (b 8)
              (c)
              (anything-buffer (exps-tmpbuf)))
          (anything-let ((a 1)
                         (b (1+ a))
                         c)
            (anything-create-anything-buffer))
          (with-current-buffer anything-buffer
            (and (assq 'a (buffer-local-variables))
                 (assq 'b (buffer-local-variables))
                 (assq 'c (buffer-local-variables))))))
      (expect 'retval
        (let ((a 9999)
              (b 8)
              (c)
              (anything-buffer (exps-tmpbuf)))
          (anything-let ((a 1)
                         (b (1+ a))
                         c)
            'retval)))
      (desc "<span class="quote">anything-let*</span>")
      (expect '(1 2 nil)
        (let ((a 9999)
              (b 8)
              (c)
              (anything-buffer (exps-tmpbuf)))
          (anything-let* ((a 1)
                          (b (1+ a))
                          c)
            (anything-create-anything-buffer))
          (with-current-buffer anything-buffer
            (list a b c))))
      (expect (non-nil)
        (let ((a 9999)
              (b 8)
              (c)
              (anything-buffer (exps-tmpbuf)))
          (anything-let* ((a 1)
                          (b (1+ a))
                          c)
            (anything-create-anything-buffer))
          (with-current-buffer anything-buffer
            (and (assq 'a (buffer-local-variables))
                 (assq 'b (buffer-local-variables))
                 (assq 'c (buffer-local-variables))))))
      (expect 'retval*
        (let ((a 9999)
              (b 8)
              (c)
              (anything-buffer (exps-tmpbuf)))
          (anything-let* ((a 1)
                          (b (1+ a))
                          c)
            'retval*)))
      (desc "<span class="quote">anything with keyword</span>")
      (expect (mock (anything-internal 'test-source "<span class="quote">input</span>" "<span class="quote">prompt: </span>" nil "<span class="quote">preselect</span>" "<span class="quote">*test*</span>" nil))
        (anything :sources   'test-source
                  :input     "<span class="quote">input</span>"
                  :prompt    "<span class="quote">prompt: </span>"
                  :resume    nil
                  :preselect "<span class="quote">preselect</span>"
                  :buffer    "<span class="quote">*test*</span>"
                  :keymap    nil))
      (expect (mock (anything-internal 'test-source nil nil nil nil "<span class="quote">*test*</span>" nil))
        (anything :sources                'test-source
                  :buffer                 "<span class="quote">*test*</span>"
                  :candidate-number-limit 20))
      (expect (mock (anything-internal 'test-source nil nil nil nil "<span class="quote">*test*</span>" nil))
        (anything 'test-source nil nil nil nil "<span class="quote">*test*</span>" nil))
      (desc "<span class="quote">anything-log-eval-internal</span>")
      (expect (mock (anything-log "<span class="quote">%S = %S</span>" '(+ 1 2) 3))
        (anything-log-eval-internal '((+ 1 2))))
      (expect (mock (anything-log "<span class="quote">%S = ERROR!</span>" 'unDeFined))
        (anything-log-eval-internal '(unDeFined)))

      (desc "<span class="quote">anything-output-filter--collect-candidates</span>")
      (expect '("<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote"></span>")
        (split-string "<span class="quote">a\nb\n</span>" "<span class="quote">\n</span>"))
      (expect '("<span class="quote">a</span>" "<span class="quote">b</span>")
        (anything-output-filter--collect-candidates
         '("<span class="quote">a</span>" "<span class="quote">b</span>" "<span class="quote"></span>") (cons 'incomplete-line  "<span class="quote"></span>")))
      (expect '("<span class="quote">a</span>" "<span class="quote">b</span>")
        (split-string "<span class="quote">a\nb</span>" "<span class="quote">\n</span>"))
      (expect '("<span class="quote">a</span>")
        (anything-output-filter--collect-candidates
         '("<span class="quote">a</span>" "<span class="quote">b</span>") (cons 'incomplete-line  "<span class="quote"></span>")))
      (expect '(incomplete-line . "<span class="quote">b</span>")
        (let ((incomplete-line-info (cons 'incomplete-line  "<span class="quote"></span>")))
          (anything-output-filter--collect-candidates
           '("<span class="quote">a</span>" "<span class="quote">b</span>") incomplete-line-info)
          incomplete-line-info))
      (expect '("<span class="quote"></span>" "<span class="quote">c</span>" "<span class="quote"></span>")
        (split-string "<span class="quote">\nc\n</span>" "<span class="quote">\n</span>"))
      (expect '("<span class="quote">b</span>" "<span class="quote">c</span>")
        <span class="linecomment">;; "a\nb" + "\nc\n"</span>
        (let ((incomplete-line-info (cons 'incomplete-line  "<span class="quote"></span>")))
          (anything-output-filter--collect-candidates
           '("<span class="quote">a</span>" "<span class="quote">b</span>") incomplete-line-info)
          (anything-output-filter--collect-candidates
           '("<span class="quote"></span>" "<span class="quote">c</span>" "<span class="quote"></span>") incomplete-line-info)))
      (desc "<span class="quote">coerce attribute</span>")
      (expect "<span class="quote">string</span>"
        (anything :sources '(((name . "<span class="quote">test</span>")
                              (candidates "<span class="quote">string</span>")
                              (action . identity)))
                  :execute-action-at-once-if-one t))
      (expect 'symbol
        (anything :sources '(((name . "<span class="quote">test</span>")
                              (candidates "<span class="quote">symbol</span>")
                              (coerce . intern)
                              (action . identity)))
                  :execute-action-at-once-if-one t))
      (expect 'real
        (anything :sources '(((name . "<span class="quote">test</span>")
                              (candidates ("<span class="quote">display</span>" . "<span class="quote">real</span>"))
                              (coerce . intern)
                              (action . identity)))
                  :execute-action-at-once-if-one t))
      (expect 'real
        (anything :sources '(((name . "<span class="quote">test</span>")
                              (candidates)
                              (candidate-transformer
                               (lambda (c) '(("<span class="quote">display</span>" . "<span class="quote">real</span>"))))
                              (coerce . intern)
                              (action . identity)))
                  :execute-action-at-once-if-one t))
      (expect 'real
        (anything :sources '(((name . "<span class="quote">test</span>")
                              (candidates)
                              (filtered-candidate-transformer
                               (lambda (c s) '(("<span class="quote">display</span>" . "<span class="quote">real</span>"))))
                              (coerce . intern)
                              (action . identity)))
                  :execute-action-at-once-if-one t))
      (expect 'real
        (anything :sources '(((name . "<span class="quote">test</span>")
                              (candidates "<span class="quote">dummy</span>")
                              (display-to-real (lambda (disp) "<span class="quote">real</span>"))
                              (coerce . intern)
                              (action . identity)))
                  :execute-action-at-once-if-one t))
      (desc "<span class="quote">anything-next-point-in-list</span>")
      (expect 10
        (anything-next-point-in-list 5 '(10 20) nil))
      (expect 20
        (anything-next-point-in-list 15 '(10 20) nil))
      (expect 25
        (anything-next-point-in-list 25 '(10 20) nil))
      (expect 5
        (anything-next-point-in-list 5 '(10 20) t))
      (expect 10
        (anything-next-point-in-list 15 '(10 20) t))
      (expect 20
        (anything-next-point-in-list 25 '(10 20) t))
      (expect 5
        (anything-next-point-in-list 5 '() nil))
      (expect 5
        (anything-next-point-in-list 5 '() t))
      (expect 10
        (anything-next-point-in-list 5 '(10) nil))
      (expect 10
        (anything-next-point-in-list 15 '(10) t))
      (expect 20
        (anything-next-point-in-list 10 '(10 20) nil))
      (expect 10
        (anything-next-point-in-list 20 '(10 20) t))
      (expect 20
        (anything-next-point-in-list 30 '(10 20 30) t))
      )))


(provide 'anything)
<span class="linecomment">;; How to save (DO NOT REMOVE!!)</span>
<span class="linecomment">;; (progn (magit-push) (emacswiki-post "anything.el"))</span>
<span class="linecomment">;; Local Variables:</span>
<span class="linecomment">;; coding: utf-8</span>
<span class="linecomment">;; End:</span>
<span class="linecomment">;;; anything.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=anything.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=anything.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=anything.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=anything.el">Administration</a></span><span class="time"><br /> Last edited 2011-03-24 23:19 UTC by <a class="author" title="from 119-171-28-53.rev.home.ne.jp" href="http://www.emacswiki.org/emacs/rubikitch">rubikitch</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=anything.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
