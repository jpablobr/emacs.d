
    

  

<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <title>coffee-mode.el at master from defunkt/coffee-mode - GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />

    <link href="https://d3nwyuy0nl342s.cloudfront.net/af7b1cee6246dd56e8ed4f1c6516828449c5c983/stylesheets/bundle_common.css" media="screen" rel="stylesheet" type="text/css" />
<link href="https://d3nwyuy0nl342s.cloudfront.net/af7b1cee6246dd56e8ed4f1c6516828449c5c983/stylesheets/bundle_github.css" media="screen" rel="stylesheet" type="text/css" />
    

    <script type="text/javascript">
      if (typeof console == "undefined" || typeof console.log == "undefined")
        console = { log: function() {} }
    </script>
    <script type="text/javascript" charset="utf-8">
      var GitHub = {
        assetHost: 'https://d3nwyuy0nl342s.cloudfront.net'
      }
      var github_user = 'jpablobr'
      
    </script>
    <script src="https://d3nwyuy0nl342s.cloudfront.net/af7b1cee6246dd56e8ed4f1c6516828449c5c983/javascripts/jquery/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="https://d3nwyuy0nl342s.cloudfront.net/af7b1cee6246dd56e8ed4f1c6516828449c5c983/javascripts/bundle_common.js" type="text/javascript"></script>
<script src="https://d3nwyuy0nl342s.cloudfront.net/af7b1cee6246dd56e8ed4f1c6516828449c5c983/javascripts/bundle_github.js" type="text/javascript"></script>


    
    <script type="text/javascript" charset="utf-8">
      GitHub.spy({
        repo: "defunkt/coffee-mode"
      })
    </script>

    
  <link href="https://github.com/defunkt/coffee-mode/commits/master.atom" rel="alternate" title="Recent Commits to coffee-mode:master" type="application/atom+xml" />

        <meta name="description" content="coffee-mode - Emacs Major Mode for CoffeeScript" />
    <script type="text/javascript">
      GitHub.nameWithOwner = GitHub.nameWithOwner || "defunkt/coffee-mode";
      GitHub.currentRef = 'master';
      GitHub.commitSHA = "88e1c8c75f8b6cd1249934cd5ad91565798fb2e8";
      GitHub.currentPath = 'coffee-mode.el';
      GitHub.masterBranch = "master";

      
    </script>
  

        <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-3769691-2']);
      _gaq.push(['_setDomainName', 'none']);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script');
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        ga.setAttribute('async', 'true');
        document.documentElement.firstChild.appendChild(ga);
      })();
    </script>

    
  </head>

  

  <body class="logged_in page-blob linux">
    

    

    

    

    

    <div class="subnavd" id="main">
      <div id="header" class="true">
        
          <a class="logo boring" href="https://github.com/">
            <img alt="github" class="default" src="https://d3nwyuy0nl342s.cloudfront.net/images/modules/header/logov3.png" />
            <!--[if (gt IE 8)|!(IE)]><!-->
            <img alt="github" class="hover" src="https://d3nwyuy0nl342s.cloudfront.net/images/modules/header/logov3-hover.png" />
            <!--<![endif]-->
          </a>
        
        
          





  
    <div class="userbox">
      <div class="avatarname">
        <a href="https://github.com/jpablobr"><img src="https://secure.gravatar.com/avatar/9995426c4cc9c83e0f1e581340df76f8?s=140&d=https://d3nwyuy0nl342s.cloudfront.net%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="20" height="20"  /></a>
        <a href="https://github.com/jpablobr" class="name">jpablobr</a>

        
        
          <a href="https://github.com/inbox/notifications" class="unread_count notifications_count new tooltipped downwards js-notification-count" title="Unread Notifications">77</a>
        
      </div>
      <ul class="usernav">
        <li><a href="https://github.com/">Dashboard</a></li>
        <li>
          
          <a href="https://github.com/inbox">Inbox</a>
          <a href="https://github.com/inbox" class="unread_count new js-inbox-count">1</a>
        </li>
        <li><a href="https://github.com/account">Account Settings</a></li>
                <li><a href="/logout">Log Out</a></li>
      </ul>
    </div><!-- /.userbox -->
  


        
        <div class="topsearch">
  
    <form action="/search" id="top_search_form" method="get">
      <a href="/search" class="advanced-search tooltipped downwards" title="Advanced Search">Advanced Search</a>
      <input type="search" class="search my_repos_autocompleter" name="q" results="5" placeholder="Search&hellip;" /> <input type="submit" value="Search" class="button" />
      <input type="hidden" name="type" value="Everything" />
      <input type="hidden" name="repo" value="" />
      <input type="hidden" name="langOverride" value="" />
      <input type="hidden" name="start_value" value="1" />
    </form>
    <ul class="nav">
      <li><a href="/explore">Explore GitHub</a></li>
      <li><a href="https://gist.github.com">Gist</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="http://help.github.com">Help</a></li>
    </ul>
  
</div>

      </div>

      
      
        
    <div class="site">
      <div class="pagehead repohead vis-public    instapaper_ignore readability-menu">

      

      <div class="title-actions-bar">
        <h1>
          <a href="/defunkt">defunkt</a> / <strong><a href="https://github.com/defunkt/coffee-mode">coffee-mode</a></strong>
          
          
        </h1>

        
    <ul class="actions">
      

      
        <li class="for-owner" style="display:none"><a href="https://github.com/defunkt/coffee-mode/admin" class="minibutton btn-admin "><span><span class="icon"></span>Admin</span></a></li>
        <li>
          <a href="/defunkt/coffee-mode/toggle_watch" class="minibutton btn-watch " id="watch_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '438524a0d6ec9020f1996f6750218beb7488a9a1'); f.appendChild(s);f.submit();return false;" style="display:none"><span><span class="icon"></span>Watch</span></a>
          <a href="/defunkt/coffee-mode/toggle_watch" class="minibutton btn-watch " id="unwatch_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '438524a0d6ec9020f1996f6750218beb7488a9a1'); f.appendChild(s);f.submit();return false;" style="display:none"><span><span class="icon"></span>Unwatch</span></a>
        </li>
        
          
            <li class="for-notforked"><a href="#fork_box" class="minibutton btn-fork " rel="facebox"><span><span class="icon"></span>Fork</span></a></li>
            

            <div id="fork_box" style="display:none">
              <h2>Where do you want to fork this to?</h2>
              
                <div class="full-button">
                  <form action="/defunkt/coffee-mode/fork" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="438524a0d6ec9020f1996f6750218beb7488a9a1" /></div>
                    <button class="classy"><span>Fork to jpablobr</span></button>
                  </form>
                </div>
              
              
                <div class="rule"></div>
                
                  <div class="full-button">
                    <form action="/defunkt/coffee-mode/fork" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="438524a0d6ec9020f1996f6750218beb7488a9a1" /></div>
                      <input id="organization" name="organization" type="hidden" value="decodedbits" />
                      <button class="classy"><span>Fork to decodedbits (organization)</span></button>
                    </form>
                  </div>
                
              
                <div class="rule"></div>
                
                  <div class="full-button">
                    <form action="/defunkt/coffee-mode/fork" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="438524a0d6ec9020f1996f6750218beb7488a9a1" /></div>
                      <input id="organization" name="organization" type="hidden" value="emacs-web-kit" />
                      <button class="classy"><span>Fork to emacs-web-kit (organization)</span></button>
                    </form>
                  </div>
                
              
                <div class="rule"></div>
                
                  <div class="full-button">
                    <form action="/defunkt/coffee-mode/fork" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="438524a0d6ec9020f1996f6750218beb7488a9a1" /></div>
                      <input id="organization" name="organization" type="hidden" value="gc-designstudio" />
                      <button class="classy"><span>Fork to gc-designstudio (organization)</span></button>
                    </form>
                  </div>
                
              
            </div>
          

          <li id='pull_request_item' class='nspr' style='display:none'><a href="/defunkt/coffee-mode/pull/new/master" class="minibutton btn-pull-request "><span><span class="icon"></span>Pull Request</span></a></li>
        
      
      
      <li class="repostats">
        <ul class="repo-stats">
          <li class="watchers"><a href="/defunkt/coffee-mode/watchers" title="Watchers" class="tooltipped downwards">95</a></li>
          <li class="forks"><a href="/defunkt/coffee-mode/network" title="Forks" class="tooltipped downwards">21</a></li>
        </ul>
      </li>
    </ul>

      </div>

        
  <ul class="tabs">
    <li><a href="https://github.com/defunkt/coffee-mode" class="selected" highlight="repo_source">Source</a></li>
    <li><a href="https://github.com/defunkt/coffee-mode/commits/master" highlight="repo_commits">Commits</a></li>
    <li><a href="/defunkt/coffee-mode/network" highlight="repo_network">Network</a></li>
    <li><a href="/defunkt/coffee-mode/pulls" highlight="repo_pulls">Pull Requests (0)</a></li>

    

    
      
      <li><a href="/defunkt/coffee-mode/issues" highlight="issues">Issues (5)</a></li>
    

    
    <li><a href="/defunkt/coffee-mode/graphs" highlight="repo_graphs">Graphs</a></li>

    <li class="contextswitch nochoices">
      <span class="toggle leftwards" >
        <em>Branch:</em>
        <code>master</code>
      </span>
    </li>
  </ul>

  <div style="display:none" id="pl-description"><p><em class="placeholder">click here to add a description</em></p></div>
  <div style="display:none" id="pl-homepage"><p><em class="placeholder">click here to add a homepage</em></p></div>

  <div class="subnav-bar">
  
  <ul>
    <li>
      
      <a href="/defunkt/coffee-mode/branches" class="dropdown">Switch Branches (1)</a>
      <ul>
        
          
            <li><strong>master &#x2713;</strong></li>
            
      </ul>
    </li>
    <li>
      <a href="#" class="dropdown ">Switch Tags (3)</a>
              <ul>
                      
              <li><a href="/defunkt/coffee-mode/blob/v0.3.0/coffee-mode.el">v0.3.0</a></li>
            
                      
              <li><a href="/defunkt/coffee-mode/blob/v0.2.0/coffee-mode.el">v0.2.0</a></li>
            
                      
              <li><a href="/defunkt/coffee-mode/blob/v0.1.0/coffee-mode.el">v0.1.0</a></li>
            
                  </ul>
      
    </li>
    <li>
    
    <a href="/defunkt/coffee-mode/branches" class="manage">Branch List</a>
    
    </li>
  </ul>
</div>

  
  
  
  
  
  



        
    <div id="repo_details" class="metabox clearfix">
      <div id="repo_details_loader" class="metabox-loader" style="display:none">Sending Request&hellip;</div>

        <a href="/defunkt/coffee-mode/downloads" class="download-source" id="download_button" title="Download source, tagged packages and binaries."><span class="icon"></span>Downloads</a>

      <div id="repository_desc_wrapper">
      <div id="repository_description" rel="repository_description_edit">
        
          <p>Emacs Major Mode for CoffeeScript
            <span id="read_more" style="display:none">&mdash; <a href="#readme">Read more</a></span>
          </p>
        
      </div>

      <div id="repository_description_edit" style="display:none;" class="inline-edit">
        <form action="/defunkt/coffee-mode/admin/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="438524a0d6ec9020f1996f6750218beb7488a9a1" /></div>
          <input type="hidden" name="field" value="repository_description">
          <input type="text" class="textfield" name="value" value="Emacs Major Mode for CoffeeScript">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>

      
      <div class="repository-homepage" id="repository_homepage" rel="repository_homepage_edit">
        <p><a href="http://ozmm.org/posts/coffee_mode.html" rel="nofollow">http://ozmm.org/posts/coffee_mode.html</a></p>
      </div>

      <div id="repository_homepage_edit" style="display:none;" class="inline-edit">
        <form action="/defunkt/coffee-mode/admin/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="438524a0d6ec9020f1996f6750218beb7488a9a1" /></div>
          <input type="hidden" name="field" value="repository_homepage">
          <input type="text" class="textfield" name="value" value="http://ozmm.org/posts/coffee_mode.html">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>
      </div>
      <div class="rule "></div>
            <div id="url_box" class="url-box">
        <ul class="clone-urls">
          
            
            <li id="http_clone_url"><a href="https://github.com/defunkt/coffee-mode.git" data-permissions="Read-Only">HTTP</a></li>
            <li id="public_clone_url"><a href="git://github.com/defunkt/coffee-mode.git" data-permissions="Read-Only">Git Read-Only</a></li>
          
          
        </ul>
        <input type="text" spellcheck="false" id="url_field" class="url-field" />
              <span style="display:none" id="url_box_clippy"></span>
      <span id="clippy_tooltip_url_box_clippy" class="clippy-tooltip tooltipped" title="copy to clipboard">
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="14"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="https://d3nwyuy0nl342s.cloudfront.net/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=url_box_clippy&amp;copied=&amp;copyto=">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="https://d3nwyuy0nl342s.cloudfront.net/flash/clippy.swf?v5"
             width="14"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=url_box_clippy&amp;copied=&amp;copyto="
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      </span>

        <p id="url_description">This URL has <strong>Read+Write</strong> access</p>
      </div>
    </div>

    <div class="frame frame-center tree-finder" style="display:none">
      <div class="breadcrumb">
        <b><a href="/defunkt/coffee-mode">coffee-mode</a></b> /
        <input class="tree-finder-input" type="text" name="query" autocomplete="off" spellcheck="false">
      </div>

      
        <div class="octotip">
          <p>
            <a href="/defunkt/coffee-mode/dismiss-tree-finder-help" class="dismiss js-dismiss-tree-list-help" title="Hide this notice forever">Dismiss</a>
            <strong>Octotip:</strong> You've activated the <em>file finder</em> by pressing <span class="kbd">t</span>
            Start typing to filter the file list. Use <span class="kbd badmono">↑</span> and <span class="kbd badmono">↓</span> to navigate,
            <span class="kbd">enter</span> to view files.
          </p>
        </div>
      

      <table class="tree-browser" cellpadding="0" cellspacing="0">
        <tr class="js-header"><th>&nbsp;</th><th>name</th></tr>
        <tr class="js-no-results no-results" style="display: none">
          <th colspan="2">No matching files</th>
        </tr>
        <tbody class="js-results-list">
        </tbody>
      </table>
    </div>

    <div id="jump-to-line" style="display:none">
      <h2>Jump to Line</h2>
      <form>
        <input class="textfield" type="text">
        <div class="full-button">
          <button type="submit" class="classy">
            <span>Go</span>
          </button>
        </div>
      </form>
    </div>


        

      </div><!-- /.pagehead -->

      

  





<script type="text/javascript">
  GitHub.downloadRepo = '/defunkt/coffee-mode/archives/master'
  GitHub.revType = "master"

  GitHub.controllerName = "blob"
  GitHub.actionName     = "show"
  GitHub.currentAction  = "blob#show"

  
    GitHub.hasWriteAccess = false
    GitHub.hasAdminAccess = false
    GitHub.watchingRepo = true
    GitHub.ignoredRepo = false
    GitHub.hasForkOfRepo = ""
    GitHub.hasForked = false
  

  
</script>






<div class="flash-messages"></div>


  <div id="commit">
    <div class="group">
        
  <div class="envelope commit">
    <div class="human">
      
        <div class="message"><pre><a href="/defunkt/coffee-mode/commit/88e1c8c75f8b6cd1249934cd5ad91565798fb2e8">Fix for regexp literals with slashes in brackets.</a> </pre></div>
      

      <div class="actor">
        <div class="gravatar">
          
          <img src="https://secure.gravatar.com/avatar/040e5cf6a6367b485e5a86e519011b28?s=140&d=https://d3nwyuy0nl342s.cloudfront.net%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="30" height="30"  />
        </div>
        <div class="name"><a href="/mooz">mooz</a> <span>(author)</span></div>
        <div class="date">
          <abbr class="relatize" title="2011-04-11 20:06:43">Mon Apr 11 20:06:43 -0700 2011</abbr>
        </div>
      </div>

      
        <div class="actor">
          <div class="gravatar">
            <img src="https://secure.gravatar.com/avatar/b8dbb1987e8e5318584865f880036796?s=140&d=https://d3nwyuy0nl342s.cloudfront.net%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="30" height="30"  />
          </div>
          <div class="name"><a href="/defunkt">defunkt</a> <span>(committer)</span></div>
          <div class="date"><abbr class="relatize" title="2011-04-20 12:49:53">Wed Apr 20 12:49:53 -0700 2011</abbr></div>
        </div>
      

    </div>
    <div class="machine">
      <span>c</span>ommit&nbsp;&nbsp;<a href="/defunkt/coffee-mode/commit/88e1c8c75f8b6cd1249934cd5ad91565798fb2e8" hotkey="c">88e1c8c75f8b6cd12499</a><br />
      <span>t</span>ree&nbsp;&nbsp;&nbsp;&nbsp;<a href="/defunkt/coffee-mode/tree/88e1c8c75f8b6cd1249934cd5ad91565798fb2e8" hotkey="t">70adca06c85145624820</a><br />
      
        <span>p</span>arent&nbsp;
        
        <a href="/defunkt/coffee-mode/tree/1f9bc1a93e85eb70c46136888d7e30ac1204f71f" hotkey="p">1f9bc1a93e85eb70c461</a>
      

    </div>
  </div>

    </div>
  </div>



  <div id="slider">

  

    <div class="breadcrumb" data-path="coffee-mode.el/">
      <b><a href="/defunkt/coffee-mode/tree/88e1c8c75f8b6cd1249934cd5ad91565798fb2e8">coffee-mode</a></b> / coffee-mode.el       <span style="display:none" id="clippy_1568">coffee-mode.el</span>
      
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="https://d3nwyuy0nl342s.cloudfront.net/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=clippy_1568&amp;copied=copied!&amp;copyto=copy to clipboard">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="https://d3nwyuy0nl342s.cloudfront.net/flash/clippy.swf?v5"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=clippy_1568&amp;copied=copied!&amp;copyto=copy to clipboard"
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      

    </div>

    <div class="frames">
      <div class="frame frame-center" data-path="coffee-mode.el/">
        
          <ul class="big-actions">
            
            <li><a class="file-edit-link minibutton" href="/defunkt/coffee-mode/file-edit/__current_ref__/coffee-mode.el"><span>Edit this file</span></a></li>
          </ul>
        

        <div id="files">
          <div class="file">
            <div class="meta">
              <div class="info">
                <span class="icon"><img alt="Txt" height="16" src="https://d3nwyuy0nl342s.cloudfront.net/images/icons/txt.png" width="16" /></span>
                <span class="mode" title="File Mode">100644</span>
                
                  <span>614 lines (483 sloc)</span>
                
                <span>18.919 kb</span>
              </div>
              <ul class="actions">
                <li><a href="/defunkt/coffee-mode/raw/master/coffee-mode.el" id="raw-url">raw</a></li>
                
                  <li><a href="/defunkt/coffee-mode/blame/master/coffee-mode.el">blame</a></li>
                
                <li><a href="/defunkt/coffee-mode/commits/master/coffee-mode.el">history</a></li>
              </ul>
            </div>
            
  <div class="data type-scheme">
    
      <table cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <pre class="line_numbers"><span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>
<span id="L95" rel="#L95">95</span>
<span id="L96" rel="#L96">96</span>
<span id="L97" rel="#L97">97</span>
<span id="L98" rel="#L98">98</span>
<span id="L99" rel="#L99">99</span>
<span id="L100" rel="#L100">100</span>
<span id="L101" rel="#L101">101</span>
<span id="L102" rel="#L102">102</span>
<span id="L103" rel="#L103">103</span>
<span id="L104" rel="#L104">104</span>
<span id="L105" rel="#L105">105</span>
<span id="L106" rel="#L106">106</span>
<span id="L107" rel="#L107">107</span>
<span id="L108" rel="#L108">108</span>
<span id="L109" rel="#L109">109</span>
<span id="L110" rel="#L110">110</span>
<span id="L111" rel="#L111">111</span>
<span id="L112" rel="#L112">112</span>
<span id="L113" rel="#L113">113</span>
<span id="L114" rel="#L114">114</span>
<span id="L115" rel="#L115">115</span>
<span id="L116" rel="#L116">116</span>
<span id="L117" rel="#L117">117</span>
<span id="L118" rel="#L118">118</span>
<span id="L119" rel="#L119">119</span>
<span id="L120" rel="#L120">120</span>
<span id="L121" rel="#L121">121</span>
<span id="L122" rel="#L122">122</span>
<span id="L123" rel="#L123">123</span>
<span id="L124" rel="#L124">124</span>
<span id="L125" rel="#L125">125</span>
<span id="L126" rel="#L126">126</span>
<span id="L127" rel="#L127">127</span>
<span id="L128" rel="#L128">128</span>
<span id="L129" rel="#L129">129</span>
<span id="L130" rel="#L130">130</span>
<span id="L131" rel="#L131">131</span>
<span id="L132" rel="#L132">132</span>
<span id="L133" rel="#L133">133</span>
<span id="L134" rel="#L134">134</span>
<span id="L135" rel="#L135">135</span>
<span id="L136" rel="#L136">136</span>
<span id="L137" rel="#L137">137</span>
<span id="L138" rel="#L138">138</span>
<span id="L139" rel="#L139">139</span>
<span id="L140" rel="#L140">140</span>
<span id="L141" rel="#L141">141</span>
<span id="L142" rel="#L142">142</span>
<span id="L143" rel="#L143">143</span>
<span id="L144" rel="#L144">144</span>
<span id="L145" rel="#L145">145</span>
<span id="L146" rel="#L146">146</span>
<span id="L147" rel="#L147">147</span>
<span id="L148" rel="#L148">148</span>
<span id="L149" rel="#L149">149</span>
<span id="L150" rel="#L150">150</span>
<span id="L151" rel="#L151">151</span>
<span id="L152" rel="#L152">152</span>
<span id="L153" rel="#L153">153</span>
<span id="L154" rel="#L154">154</span>
<span id="L155" rel="#L155">155</span>
<span id="L156" rel="#L156">156</span>
<span id="L157" rel="#L157">157</span>
<span id="L158" rel="#L158">158</span>
<span id="L159" rel="#L159">159</span>
<span id="L160" rel="#L160">160</span>
<span id="L161" rel="#L161">161</span>
<span id="L162" rel="#L162">162</span>
<span id="L163" rel="#L163">163</span>
<span id="L164" rel="#L164">164</span>
<span id="L165" rel="#L165">165</span>
<span id="L166" rel="#L166">166</span>
<span id="L167" rel="#L167">167</span>
<span id="L168" rel="#L168">168</span>
<span id="L169" rel="#L169">169</span>
<span id="L170" rel="#L170">170</span>
<span id="L171" rel="#L171">171</span>
<span id="L172" rel="#L172">172</span>
<span id="L173" rel="#L173">173</span>
<span id="L174" rel="#L174">174</span>
<span id="L175" rel="#L175">175</span>
<span id="L176" rel="#L176">176</span>
<span id="L177" rel="#L177">177</span>
<span id="L178" rel="#L178">178</span>
<span id="L179" rel="#L179">179</span>
<span id="L180" rel="#L180">180</span>
<span id="L181" rel="#L181">181</span>
<span id="L182" rel="#L182">182</span>
<span id="L183" rel="#L183">183</span>
<span id="L184" rel="#L184">184</span>
<span id="L185" rel="#L185">185</span>
<span id="L186" rel="#L186">186</span>
<span id="L187" rel="#L187">187</span>
<span id="L188" rel="#L188">188</span>
<span id="L189" rel="#L189">189</span>
<span id="L190" rel="#L190">190</span>
<span id="L191" rel="#L191">191</span>
<span id="L192" rel="#L192">192</span>
<span id="L193" rel="#L193">193</span>
<span id="L194" rel="#L194">194</span>
<span id="L195" rel="#L195">195</span>
<span id="L196" rel="#L196">196</span>
<span id="L197" rel="#L197">197</span>
<span id="L198" rel="#L198">198</span>
<span id="L199" rel="#L199">199</span>
<span id="L200" rel="#L200">200</span>
<span id="L201" rel="#L201">201</span>
<span id="L202" rel="#L202">202</span>
<span id="L203" rel="#L203">203</span>
<span id="L204" rel="#L204">204</span>
<span id="L205" rel="#L205">205</span>
<span id="L206" rel="#L206">206</span>
<span id="L207" rel="#L207">207</span>
<span id="L208" rel="#L208">208</span>
<span id="L209" rel="#L209">209</span>
<span id="L210" rel="#L210">210</span>
<span id="L211" rel="#L211">211</span>
<span id="L212" rel="#L212">212</span>
<span id="L213" rel="#L213">213</span>
<span id="L214" rel="#L214">214</span>
<span id="L215" rel="#L215">215</span>
<span id="L216" rel="#L216">216</span>
<span id="L217" rel="#L217">217</span>
<span id="L218" rel="#L218">218</span>
<span id="L219" rel="#L219">219</span>
<span id="L220" rel="#L220">220</span>
<span id="L221" rel="#L221">221</span>
<span id="L222" rel="#L222">222</span>
<span id="L223" rel="#L223">223</span>
<span id="L224" rel="#L224">224</span>
<span id="L225" rel="#L225">225</span>
<span id="L226" rel="#L226">226</span>
<span id="L227" rel="#L227">227</span>
<span id="L228" rel="#L228">228</span>
<span id="L229" rel="#L229">229</span>
<span id="L230" rel="#L230">230</span>
<span id="L231" rel="#L231">231</span>
<span id="L232" rel="#L232">232</span>
<span id="L233" rel="#L233">233</span>
<span id="L234" rel="#L234">234</span>
<span id="L235" rel="#L235">235</span>
<span id="L236" rel="#L236">236</span>
<span id="L237" rel="#L237">237</span>
<span id="L238" rel="#L238">238</span>
<span id="L239" rel="#L239">239</span>
<span id="L240" rel="#L240">240</span>
<span id="L241" rel="#L241">241</span>
<span id="L242" rel="#L242">242</span>
<span id="L243" rel="#L243">243</span>
<span id="L244" rel="#L244">244</span>
<span id="L245" rel="#L245">245</span>
<span id="L246" rel="#L246">246</span>
<span id="L247" rel="#L247">247</span>
<span id="L248" rel="#L248">248</span>
<span id="L249" rel="#L249">249</span>
<span id="L250" rel="#L250">250</span>
<span id="L251" rel="#L251">251</span>
<span id="L252" rel="#L252">252</span>
<span id="L253" rel="#L253">253</span>
<span id="L254" rel="#L254">254</span>
<span id="L255" rel="#L255">255</span>
<span id="L256" rel="#L256">256</span>
<span id="L257" rel="#L257">257</span>
<span id="L258" rel="#L258">258</span>
<span id="L259" rel="#L259">259</span>
<span id="L260" rel="#L260">260</span>
<span id="L261" rel="#L261">261</span>
<span id="L262" rel="#L262">262</span>
<span id="L263" rel="#L263">263</span>
<span id="L264" rel="#L264">264</span>
<span id="L265" rel="#L265">265</span>
<span id="L266" rel="#L266">266</span>
<span id="L267" rel="#L267">267</span>
<span id="L268" rel="#L268">268</span>
<span id="L269" rel="#L269">269</span>
<span id="L270" rel="#L270">270</span>
<span id="L271" rel="#L271">271</span>
<span id="L272" rel="#L272">272</span>
<span id="L273" rel="#L273">273</span>
<span id="L274" rel="#L274">274</span>
<span id="L275" rel="#L275">275</span>
<span id="L276" rel="#L276">276</span>
<span id="L277" rel="#L277">277</span>
<span id="L278" rel="#L278">278</span>
<span id="L279" rel="#L279">279</span>
<span id="L280" rel="#L280">280</span>
<span id="L281" rel="#L281">281</span>
<span id="L282" rel="#L282">282</span>
<span id="L283" rel="#L283">283</span>
<span id="L284" rel="#L284">284</span>
<span id="L285" rel="#L285">285</span>
<span id="L286" rel="#L286">286</span>
<span id="L287" rel="#L287">287</span>
<span id="L288" rel="#L288">288</span>
<span id="L289" rel="#L289">289</span>
<span id="L290" rel="#L290">290</span>
<span id="L291" rel="#L291">291</span>
<span id="L292" rel="#L292">292</span>
<span id="L293" rel="#L293">293</span>
<span id="L294" rel="#L294">294</span>
<span id="L295" rel="#L295">295</span>
<span id="L296" rel="#L296">296</span>
<span id="L297" rel="#L297">297</span>
<span id="L298" rel="#L298">298</span>
<span id="L299" rel="#L299">299</span>
<span id="L300" rel="#L300">300</span>
<span id="L301" rel="#L301">301</span>
<span id="L302" rel="#L302">302</span>
<span id="L303" rel="#L303">303</span>
<span id="L304" rel="#L304">304</span>
<span id="L305" rel="#L305">305</span>
<span id="L306" rel="#L306">306</span>
<span id="L307" rel="#L307">307</span>
<span id="L308" rel="#L308">308</span>
<span id="L309" rel="#L309">309</span>
<span id="L310" rel="#L310">310</span>
<span id="L311" rel="#L311">311</span>
<span id="L312" rel="#L312">312</span>
<span id="L313" rel="#L313">313</span>
<span id="L314" rel="#L314">314</span>
<span id="L315" rel="#L315">315</span>
<span id="L316" rel="#L316">316</span>
<span id="L317" rel="#L317">317</span>
<span id="L318" rel="#L318">318</span>
<span id="L319" rel="#L319">319</span>
<span id="L320" rel="#L320">320</span>
<span id="L321" rel="#L321">321</span>
<span id="L322" rel="#L322">322</span>
<span id="L323" rel="#L323">323</span>
<span id="L324" rel="#L324">324</span>
<span id="L325" rel="#L325">325</span>
<span id="L326" rel="#L326">326</span>
<span id="L327" rel="#L327">327</span>
<span id="L328" rel="#L328">328</span>
<span id="L329" rel="#L329">329</span>
<span id="L330" rel="#L330">330</span>
<span id="L331" rel="#L331">331</span>
<span id="L332" rel="#L332">332</span>
<span id="L333" rel="#L333">333</span>
<span id="L334" rel="#L334">334</span>
<span id="L335" rel="#L335">335</span>
<span id="L336" rel="#L336">336</span>
<span id="L337" rel="#L337">337</span>
<span id="L338" rel="#L338">338</span>
<span id="L339" rel="#L339">339</span>
<span id="L340" rel="#L340">340</span>
<span id="L341" rel="#L341">341</span>
<span id="L342" rel="#L342">342</span>
<span id="L343" rel="#L343">343</span>
<span id="L344" rel="#L344">344</span>
<span id="L345" rel="#L345">345</span>
<span id="L346" rel="#L346">346</span>
<span id="L347" rel="#L347">347</span>
<span id="L348" rel="#L348">348</span>
<span id="L349" rel="#L349">349</span>
<span id="L350" rel="#L350">350</span>
<span id="L351" rel="#L351">351</span>
<span id="L352" rel="#L352">352</span>
<span id="L353" rel="#L353">353</span>
<span id="L354" rel="#L354">354</span>
<span id="L355" rel="#L355">355</span>
<span id="L356" rel="#L356">356</span>
<span id="L357" rel="#L357">357</span>
<span id="L358" rel="#L358">358</span>
<span id="L359" rel="#L359">359</span>
<span id="L360" rel="#L360">360</span>
<span id="L361" rel="#L361">361</span>
<span id="L362" rel="#L362">362</span>
<span id="L363" rel="#L363">363</span>
<span id="L364" rel="#L364">364</span>
<span id="L365" rel="#L365">365</span>
<span id="L366" rel="#L366">366</span>
<span id="L367" rel="#L367">367</span>
<span id="L368" rel="#L368">368</span>
<span id="L369" rel="#L369">369</span>
<span id="L370" rel="#L370">370</span>
<span id="L371" rel="#L371">371</span>
<span id="L372" rel="#L372">372</span>
<span id="L373" rel="#L373">373</span>
<span id="L374" rel="#L374">374</span>
<span id="L375" rel="#L375">375</span>
<span id="L376" rel="#L376">376</span>
<span id="L377" rel="#L377">377</span>
<span id="L378" rel="#L378">378</span>
<span id="L379" rel="#L379">379</span>
<span id="L380" rel="#L380">380</span>
<span id="L381" rel="#L381">381</span>
<span id="L382" rel="#L382">382</span>
<span id="L383" rel="#L383">383</span>
<span id="L384" rel="#L384">384</span>
<span id="L385" rel="#L385">385</span>
<span id="L386" rel="#L386">386</span>
<span id="L387" rel="#L387">387</span>
<span id="L388" rel="#L388">388</span>
<span id="L389" rel="#L389">389</span>
<span id="L390" rel="#L390">390</span>
<span id="L391" rel="#L391">391</span>
<span id="L392" rel="#L392">392</span>
<span id="L393" rel="#L393">393</span>
<span id="L394" rel="#L394">394</span>
<span id="L395" rel="#L395">395</span>
<span id="L396" rel="#L396">396</span>
<span id="L397" rel="#L397">397</span>
<span id="L398" rel="#L398">398</span>
<span id="L399" rel="#L399">399</span>
<span id="L400" rel="#L400">400</span>
<span id="L401" rel="#L401">401</span>
<span id="L402" rel="#L402">402</span>
<span id="L403" rel="#L403">403</span>
<span id="L404" rel="#L404">404</span>
<span id="L405" rel="#L405">405</span>
<span id="L406" rel="#L406">406</span>
<span id="L407" rel="#L407">407</span>
<span id="L408" rel="#L408">408</span>
<span id="L409" rel="#L409">409</span>
<span id="L410" rel="#L410">410</span>
<span id="L411" rel="#L411">411</span>
<span id="L412" rel="#L412">412</span>
<span id="L413" rel="#L413">413</span>
<span id="L414" rel="#L414">414</span>
<span id="L415" rel="#L415">415</span>
<span id="L416" rel="#L416">416</span>
<span id="L417" rel="#L417">417</span>
<span id="L418" rel="#L418">418</span>
<span id="L419" rel="#L419">419</span>
<span id="L420" rel="#L420">420</span>
<span id="L421" rel="#L421">421</span>
<span id="L422" rel="#L422">422</span>
<span id="L423" rel="#L423">423</span>
<span id="L424" rel="#L424">424</span>
<span id="L425" rel="#L425">425</span>
<span id="L426" rel="#L426">426</span>
<span id="L427" rel="#L427">427</span>
<span id="L428" rel="#L428">428</span>
<span id="L429" rel="#L429">429</span>
<span id="L430" rel="#L430">430</span>
<span id="L431" rel="#L431">431</span>
<span id="L432" rel="#L432">432</span>
<span id="L433" rel="#L433">433</span>
<span id="L434" rel="#L434">434</span>
<span id="L435" rel="#L435">435</span>
<span id="L436" rel="#L436">436</span>
<span id="L437" rel="#L437">437</span>
<span id="L438" rel="#L438">438</span>
<span id="L439" rel="#L439">439</span>
<span id="L440" rel="#L440">440</span>
<span id="L441" rel="#L441">441</span>
<span id="L442" rel="#L442">442</span>
<span id="L443" rel="#L443">443</span>
<span id="L444" rel="#L444">444</span>
<span id="L445" rel="#L445">445</span>
<span id="L446" rel="#L446">446</span>
<span id="L447" rel="#L447">447</span>
<span id="L448" rel="#L448">448</span>
<span id="L449" rel="#L449">449</span>
<span id="L450" rel="#L450">450</span>
<span id="L451" rel="#L451">451</span>
<span id="L452" rel="#L452">452</span>
<span id="L453" rel="#L453">453</span>
<span id="L454" rel="#L454">454</span>
<span id="L455" rel="#L455">455</span>
<span id="L456" rel="#L456">456</span>
<span id="L457" rel="#L457">457</span>
<span id="L458" rel="#L458">458</span>
<span id="L459" rel="#L459">459</span>
<span id="L460" rel="#L460">460</span>
<span id="L461" rel="#L461">461</span>
<span id="L462" rel="#L462">462</span>
<span id="L463" rel="#L463">463</span>
<span id="L464" rel="#L464">464</span>
<span id="L465" rel="#L465">465</span>
<span id="L466" rel="#L466">466</span>
<span id="L467" rel="#L467">467</span>
<span id="L468" rel="#L468">468</span>
<span id="L469" rel="#L469">469</span>
<span id="L470" rel="#L470">470</span>
<span id="L471" rel="#L471">471</span>
<span id="L472" rel="#L472">472</span>
<span id="L473" rel="#L473">473</span>
<span id="L474" rel="#L474">474</span>
<span id="L475" rel="#L475">475</span>
<span id="L476" rel="#L476">476</span>
<span id="L477" rel="#L477">477</span>
<span id="L478" rel="#L478">478</span>
<span id="L479" rel="#L479">479</span>
<span id="L480" rel="#L480">480</span>
<span id="L481" rel="#L481">481</span>
<span id="L482" rel="#L482">482</span>
<span id="L483" rel="#L483">483</span>
<span id="L484" rel="#L484">484</span>
<span id="L485" rel="#L485">485</span>
<span id="L486" rel="#L486">486</span>
<span id="L487" rel="#L487">487</span>
<span id="L488" rel="#L488">488</span>
<span id="L489" rel="#L489">489</span>
<span id="L490" rel="#L490">490</span>
<span id="L491" rel="#L491">491</span>
<span id="L492" rel="#L492">492</span>
<span id="L493" rel="#L493">493</span>
<span id="L494" rel="#L494">494</span>
<span id="L495" rel="#L495">495</span>
<span id="L496" rel="#L496">496</span>
<span id="L497" rel="#L497">497</span>
<span id="L498" rel="#L498">498</span>
<span id="L499" rel="#L499">499</span>
<span id="L500" rel="#L500">500</span>
<span id="L501" rel="#L501">501</span>
<span id="L502" rel="#L502">502</span>
<span id="L503" rel="#L503">503</span>
<span id="L504" rel="#L504">504</span>
<span id="L505" rel="#L505">505</span>
<span id="L506" rel="#L506">506</span>
<span id="L507" rel="#L507">507</span>
<span id="L508" rel="#L508">508</span>
<span id="L509" rel="#L509">509</span>
<span id="L510" rel="#L510">510</span>
<span id="L511" rel="#L511">511</span>
<span id="L512" rel="#L512">512</span>
<span id="L513" rel="#L513">513</span>
<span id="L514" rel="#L514">514</span>
<span id="L515" rel="#L515">515</span>
<span id="L516" rel="#L516">516</span>
<span id="L517" rel="#L517">517</span>
<span id="L518" rel="#L518">518</span>
<span id="L519" rel="#L519">519</span>
<span id="L520" rel="#L520">520</span>
<span id="L521" rel="#L521">521</span>
<span id="L522" rel="#L522">522</span>
<span id="L523" rel="#L523">523</span>
<span id="L524" rel="#L524">524</span>
<span id="L525" rel="#L525">525</span>
<span id="L526" rel="#L526">526</span>
<span id="L527" rel="#L527">527</span>
<span id="L528" rel="#L528">528</span>
<span id="L529" rel="#L529">529</span>
<span id="L530" rel="#L530">530</span>
<span id="L531" rel="#L531">531</span>
<span id="L532" rel="#L532">532</span>
<span id="L533" rel="#L533">533</span>
<span id="L534" rel="#L534">534</span>
<span id="L535" rel="#L535">535</span>
<span id="L536" rel="#L536">536</span>
<span id="L537" rel="#L537">537</span>
<span id="L538" rel="#L538">538</span>
<span id="L539" rel="#L539">539</span>
<span id="L540" rel="#L540">540</span>
<span id="L541" rel="#L541">541</span>
<span id="L542" rel="#L542">542</span>
<span id="L543" rel="#L543">543</span>
<span id="L544" rel="#L544">544</span>
<span id="L545" rel="#L545">545</span>
<span id="L546" rel="#L546">546</span>
<span id="L547" rel="#L547">547</span>
<span id="L548" rel="#L548">548</span>
<span id="L549" rel="#L549">549</span>
<span id="L550" rel="#L550">550</span>
<span id="L551" rel="#L551">551</span>
<span id="L552" rel="#L552">552</span>
<span id="L553" rel="#L553">553</span>
<span id="L554" rel="#L554">554</span>
<span id="L555" rel="#L555">555</span>
<span id="L556" rel="#L556">556</span>
<span id="L557" rel="#L557">557</span>
<span id="L558" rel="#L558">558</span>
<span id="L559" rel="#L559">559</span>
<span id="L560" rel="#L560">560</span>
<span id="L561" rel="#L561">561</span>
<span id="L562" rel="#L562">562</span>
<span id="L563" rel="#L563">563</span>
<span id="L564" rel="#L564">564</span>
<span id="L565" rel="#L565">565</span>
<span id="L566" rel="#L566">566</span>
<span id="L567" rel="#L567">567</span>
<span id="L568" rel="#L568">568</span>
<span id="L569" rel="#L569">569</span>
<span id="L570" rel="#L570">570</span>
<span id="L571" rel="#L571">571</span>
<span id="L572" rel="#L572">572</span>
<span id="L573" rel="#L573">573</span>
<span id="L574" rel="#L574">574</span>
<span id="L575" rel="#L575">575</span>
<span id="L576" rel="#L576">576</span>
<span id="L577" rel="#L577">577</span>
<span id="L578" rel="#L578">578</span>
<span id="L579" rel="#L579">579</span>
<span id="L580" rel="#L580">580</span>
<span id="L581" rel="#L581">581</span>
<span id="L582" rel="#L582">582</span>
<span id="L583" rel="#L583">583</span>
<span id="L584" rel="#L584">584</span>
<span id="L585" rel="#L585">585</span>
<span id="L586" rel="#L586">586</span>
<span id="L587" rel="#L587">587</span>
<span id="L588" rel="#L588">588</span>
<span id="L589" rel="#L589">589</span>
<span id="L590" rel="#L590">590</span>
<span id="L591" rel="#L591">591</span>
<span id="L592" rel="#L592">592</span>
<span id="L593" rel="#L593">593</span>
<span id="L594" rel="#L594">594</span>
<span id="L595" rel="#L595">595</span>
<span id="L596" rel="#L596">596</span>
<span id="L597" rel="#L597">597</span>
<span id="L598" rel="#L598">598</span>
<span id="L599" rel="#L599">599</span>
<span id="L600" rel="#L600">600</span>
<span id="L601" rel="#L601">601</span>
<span id="L602" rel="#L602">602</span>
<span id="L603" rel="#L603">603</span>
<span id="L604" rel="#L604">604</span>
<span id="L605" rel="#L605">605</span>
<span id="L606" rel="#L606">606</span>
<span id="L607" rel="#L607">607</span>
<span id="L608" rel="#L608">608</span>
<span id="L609" rel="#L609">609</span>
<span id="L610" rel="#L610">610</span>
<span id="L611" rel="#L611">611</span>
<span id="L612" rel="#L612">612</span>
<span id="L613" rel="#L613">613</span>
<span id="L614" rel="#L614">614</span>
</pre>
          </td>
          <td width="100%">
            
              
                <div class="highlight"><pre><div class='line' id='LC1'><span class="c1">;;; coffee-mode.el --- Major mode to edit CoffeeScript files in Emacs</span></div><div class='line' id='LC2'><br/></div><div class='line' id='LC3'><span class="c1">;; Copyright (C) 2010 Chris Wanstrath</span></div><div class='line' id='LC4'><br/></div><div class='line' id='LC5'><span class="c1">;; Version 0.3.0</span></div><div class='line' id='LC6'><span class="c1">;; Keywords: CoffeeScript major mode</span></div><div class='line' id='LC7'><span class="c1">;; Author: Chris Wanstrath &lt;chris@ozmm.org&gt;</span></div><div class='line' id='LC8'><span class="c1">;; URL: http://github.com/defunkt/coffee-script</span></div><div class='line' id='LC9'><br/></div><div class='line' id='LC10'><span class="c1">;; This file is not part of GNU Emacs.</span></div><div class='line' id='LC11'><br/></div><div class='line' id='LC12'><span class="c1">;; This program is free software; you can redistribute it and/or modify</span></div><div class='line' id='LC13'><span class="c1">;; it under the terms of the GNU General Public License as published by</span></div><div class='line' id='LC14'><span class="c1">;; the Free Software Foundation; either version 2, or (at your option)</span></div><div class='line' id='LC15'><span class="c1">;; any later version.</span></div><div class='line' id='LC16'><br/></div><div class='line' id='LC17'><span class="c1">;; This program is distributed in the hope that it will be useful,</span></div><div class='line' id='LC18'><span class="c1">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span></div><div class='line' id='LC19'><span class="c1">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span></div><div class='line' id='LC20'><span class="c1">;; GNU General Public License for more details.</span></div><div class='line' id='LC21'><br/></div><div class='line' id='LC22'><span class="c1">;; You should have received a copy of the GNU General Public License</span></div><div class='line' id='LC23'><span class="c1">;; along with this program; if not, write to the Free Software</span></div><div class='line' id='LC24'><span class="c1">;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.</span></div><div class='line' id='LC25'><br/></div><div class='line' id='LC26'><span class="c1">;;; Commentary</span></div><div class='line' id='LC27'><br/></div><div class='line' id='LC28'><span class="c1">;; For commentary please see the README.md or</span></div><div class='line' id='LC29'><span class="c1">;; http://github.com/defunkt/coffee-mode#readme</span></div><div class='line' id='LC30'><br/></div><div class='line' id='LC31'><span class="c1">;;; Installation</span></div><div class='line' id='LC32'><br/></div><div class='line' id='LC33'><span class="c1">;; In your shell:</span></div><div class='line' id='LC34'><br/></div><div class='line' id='LC35'><span class="c1">;;     $ cd ~/.emacs.d/vendor</span></div><div class='line' id='LC36'><span class="c1">;;     $ git clone git://github.com/defunkt/coffee-mode.git</span></div><div class='line' id='LC37'><br/></div><div class='line' id='LC38'><span class="c1">;; In your emacs config:</span></div><div class='line' id='LC39'><br/></div><div class='line' id='LC40'><span class="c1">;;     (add-to-list &#39;load-path &quot;~/.emacs.d/vendor/coffee-mode&quot;)</span></div><div class='line' id='LC41'><span class="c1">;;     (require &#39;coffee-mode)</span></div><div class='line' id='LC42'><br/></div><div class='line' id='LC43'><span class="c1">;;; Thanks</span></div><div class='line' id='LC44'><br/></div><div class='line' id='LC45'><span class="c1">;; Major thanks to http://xahlee.org/emacs/elisp_syntax_coloring.html</span></div><div class='line' id='LC46'><span class="c1">;; the instructions.</span></div><div class='line' id='LC47'><br/></div><div class='line' id='LC48'><span class="c1">;; Also thanks to Jason Blevins&#39;s markdown-mode.el and Steve Yegge&#39;s</span></div><div class='line' id='LC49'><span class="c1">;; js2-mode for guidance.</span></div><div class='line' id='LC50'><br/></div><div class='line' id='LC51'><span class="c1">;; TODO:</span></div><div class='line' id='LC52'><span class="c1">;; - Execute {buffer,region,line} and show output in new buffer</span></div><div class='line' id='LC53'><span class="c1">;; - Make prototype accessor assignments like `String::length: -&gt; 10` pretty.</span></div><div class='line' id='LC54'><span class="c1">;; - mirror-mode - close brackets and parens automatically</span></div><div class='line' id='LC55'><br/></div><div class='line' id='LC56'><span class="c1">;;; Code:</span></div><div class='line' id='LC57'><br/></div><div class='line' id='LC58'><span class="p">(</span><span class="nf">require</span> <span class="ss">&#39;comint</span><span class="p">)</span></div><div class='line' id='LC59'><span class="p">(</span><span class="nf">require</span> <span class="ss">&#39;easymenu</span><span class="p">)</span></div><div class='line' id='LC60'><span class="p">(</span><span class="nf">require</span> <span class="ss">&#39;font-lock</span><span class="p">)</span></div><div class='line' id='LC61'><br/></div><div class='line' id='LC62'><span class="p">(</span><span class="nf">eval-when-compile</span></div><div class='line' id='LC63'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">require</span> <span class="ss">&#39;cl</span><span class="p">))</span></div><div class='line' id='LC64'><br/></div><div class='line' id='LC65'><span class="c1">;;</span></div><div class='line' id='LC66'><span class="c1">;; Customizable Variables</span></div><div class='line' id='LC67'><span class="c1">;;</span></div><div class='line' id='LC68'><br/></div><div class='line' id='LC69'><span class="p">(</span><span class="nf">defconst</span> <span class="nv">coffee-mode-version</span> <span class="s">&quot;0.3.0&quot;</span></div><div class='line' id='LC70'>&nbsp;&nbsp;<span class="s">&quot;The version of this `coffee-mode&#39;.&quot;</span><span class="p">)</span></div><div class='line' id='LC71'><br/></div><div class='line' id='LC72'><span class="p">(</span><span class="nf">defgroup</span> <span class="nv">coffee</span> <span class="nv">nil</span></div><div class='line' id='LC73'>&nbsp;&nbsp;<span class="s">&quot;A CoffeeScript major mode.&quot;</span></div><div class='line' id='LC74'>&nbsp;&nbsp;<span class="nv">:group</span> <span class="ss">&#39;languages</span><span class="p">)</span></div><div class='line' id='LC75'><br/></div><div class='line' id='LC76'><span class="p">(</span><span class="nf">defcustom</span> <span class="nv">coffee-debug-mode</span> <span class="nv">nil</span></div><div class='line' id='LC77'>&nbsp;&nbsp;<span class="s">&quot;Whether to run in debug mode or not. Logs to `*Messages*&#39;.&quot;</span></div><div class='line' id='LC78'>&nbsp;&nbsp;<span class="nv">:type</span> <span class="ss">&#39;boolean</span></div><div class='line' id='LC79'>&nbsp;&nbsp;<span class="nv">:group</span> <span class="ss">&#39;coffee-mode</span><span class="p">)</span></div><div class='line' id='LC80'><br/></div><div class='line' id='LC81'><span class="p">(</span><span class="nf">defcustom</span> <span class="nv">coffee-js-mode</span> <span class="ss">&#39;js2-mode</span></div><div class='line' id='LC82'>&nbsp;&nbsp;<span class="s">&quot;The mode to use when viewing compiled JavaScript.&quot;</span></div><div class='line' id='LC83'>&nbsp;&nbsp;<span class="nv">:type</span> <span class="ss">&#39;string</span></div><div class='line' id='LC84'>&nbsp;&nbsp;<span class="nv">:group</span> <span class="ss">&#39;coffee</span><span class="p">)</span></div><div class='line' id='LC85'><br/></div><div class='line' id='LC86'><span class="p">(</span><span class="nf">defcustom</span> <span class="nv">coffee-cleanup-whitespace</span> <span class="nv">t</span></div><div class='line' id='LC87'>&nbsp;&nbsp;<span class="s">&quot;Should we `delete-trailing-whitespace&#39; on save? Probably.&quot;</span></div><div class='line' id='LC88'>&nbsp;&nbsp;<span class="nv">:type</span> <span class="ss">&#39;boolean</span></div><div class='line' id='LC89'>&nbsp;&nbsp;<span class="nv">:group</span> <span class="ss">&#39;coffee</span><span class="p">)</span></div><div class='line' id='LC90'><br/></div><div class='line' id='LC91'><span class="p">(</span><span class="nf">defcustom</span> <span class="nv">coffee-tab-width</span> <span class="nv">tab-width</span></div><div class='line' id='LC92'>&nbsp;&nbsp;<span class="s">&quot;The tab width to use when indenting.&quot;</span></div><div class='line' id='LC93'>&nbsp;&nbsp;<span class="nv">:type</span> <span class="ss">&#39;integer</span></div><div class='line' id='LC94'>&nbsp;&nbsp;<span class="nv">:group</span> <span class="ss">&#39;coffee</span><span class="p">)</span></div><div class='line' id='LC95'><br/></div><div class='line' id='LC96'><span class="p">(</span><span class="nf">defcustom</span> <span class="nv">coffee-command</span> <span class="s">&quot;coffee&quot;</span></div><div class='line' id='LC97'>&nbsp;&nbsp;<span class="s">&quot;The CoffeeScript command used for evaluating code. Must be in your</span></div><div class='line' id='LC98'><span class="s">path.&quot;</span></div><div class='line' id='LC99'>&nbsp;&nbsp;<span class="nv">:type</span> <span class="ss">&#39;string</span></div><div class='line' id='LC100'>&nbsp;&nbsp;<span class="nv">:group</span> <span class="ss">&#39;coffee</span><span class="p">)</span></div><div class='line' id='LC101'><br/></div><div class='line' id='LC102'><span class="p">(</span><span class="nf">defcustom</span> <span class="nv">coffee-args-repl</span> <span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;-i&quot;</span><span class="p">)</span></div><div class='line' id='LC103'>&nbsp;&nbsp;<span class="s">&quot;The command line arguments to pass to `coffee-command&#39; to start a REPL.&quot;</span></div><div class='line' id='LC104'>&nbsp;&nbsp;<span class="nv">:type</span> <span class="ss">&#39;list</span></div><div class='line' id='LC105'>&nbsp;&nbsp;<span class="nv">:group</span> <span class="ss">&#39;coffee</span><span class="p">)</span></div><div class='line' id='LC106'><br/></div><div class='line' id='LC107'><span class="p">(</span><span class="nf">defcustom</span> <span class="nv">coffee-args-compile</span> <span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;-c&quot;</span><span class="p">)</span></div><div class='line' id='LC108'>&nbsp;&nbsp;<span class="s">&quot;The command line arguments to pass to `coffee-command&#39; when compiling a file.&quot;</span></div><div class='line' id='LC109'>&nbsp;&nbsp;<span class="nv">:type</span> <span class="ss">&#39;list</span></div><div class='line' id='LC110'>&nbsp;&nbsp;<span class="nv">:group</span> <span class="ss">&#39;coffee</span><span class="p">)</span></div><div class='line' id='LC111'><br/></div><div class='line' id='LC112'><span class="p">(</span><span class="nf">defcustom</span> <span class="nv">coffee-compiled-buffer-name</span> <span class="s">&quot;*coffee-compiled*&quot;</span></div><div class='line' id='LC113'>&nbsp;&nbsp;<span class="s">&quot;The name of the scratch buffer used when compiling CoffeeScript.&quot;</span></div><div class='line' id='LC114'>&nbsp;&nbsp;<span class="nv">:type</span> <span class="ss">&#39;string</span></div><div class='line' id='LC115'>&nbsp;&nbsp;<span class="nv">:group</span> <span class="ss">&#39;coffee</span><span class="p">)</span></div><div class='line' id='LC116'><br/></div><div class='line' id='LC117'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-mode-hook</span> <span class="nv">nil</span></div><div class='line' id='LC118'>&nbsp;&nbsp;<span class="s">&quot;A hook for you to run your own code when the mode is loaded.&quot;</span><span class="p">)</span></div><div class='line' id='LC119'><br/></div><div class='line' id='LC120'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-mode-map</span> <span class="p">(</span><span class="nf">make-keymap</span><span class="p">)</span></div><div class='line' id='LC121'>&nbsp;&nbsp;<span class="s">&quot;Keymap for CoffeeScript major mode.&quot;</span><span class="p">)</span></div><div class='line' id='LC122'><br/></div><div class='line' id='LC123'><span class="c1">;;</span></div><div class='line' id='LC124'><span class="c1">;; Macros</span></div><div class='line' id='LC125'><span class="c1">;;</span></div><div class='line' id='LC126'><br/></div><div class='line' id='LC127'><span class="p">(</span><span class="nf">defmacro</span> <span class="nv">setd</span> <span class="p">(</span><span class="nf">var</span> <span class="nv">val</span><span class="p">)</span></div><div class='line' id='LC128'>&nbsp;&nbsp;<span class="s">&quot;Like setq but optionally logs the variable&#39;s value using `coffee-debug&#39;.&quot;</span></div><div class='line' id='LC129'>&nbsp;&nbsp;<span class="p">(</span><span class="k">if </span><span class="p">(</span><span class="k">and </span><span class="p">(</span><span class="nf">boundp</span> <span class="ss">&#39;coffee-debug-mode</span><span class="p">)</span> <span class="nv">coffee-debug-mode</span><span class="p">)</span></div><div class='line' id='LC130'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="o">`</span><span class="p">(</span><span class="nf">progn</span></div><div class='line' id='LC131'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">coffee-debug</span> <span class="s">&quot;%s: %s&quot;</span> <span class="ss">&#39;,var</span> <span class="o">,</span><span class="nv">val</span><span class="p">)</span></div><div class='line' id='LC132'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="o">,</span><span class="nv">var</span> <span class="o">,</span><span class="nv">val</span><span class="p">))</span></div><div class='line' id='LC133'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="o">`</span><span class="p">(</span><span class="nf">setq</span> <span class="o">,</span><span class="nv">var</span> <span class="o">,</span><span class="nv">val</span><span class="p">)))</span></div><div class='line' id='LC134'><br/></div><div class='line' id='LC135'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-debug</span> <span class="p">(</span><span class="nb">string </span><span class="nv">&amp;rest</span> <span class="nv">args</span><span class="p">)</span></div><div class='line' id='LC136'>&nbsp;&nbsp;<span class="s">&quot;Print a message when in debug mode.&quot;</span></div><div class='line' id='LC137'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="nv">coffee-debug-mode</span></div><div class='line' id='LC138'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nb">apply </span><span class="ss">&#39;message</span> <span class="p">(</span><span class="nb">append </span><span class="p">(</span><span class="nb">list </span><span class="nv">string</span><span class="p">)</span> <span class="nv">args</span><span class="p">))))</span></div><div class='line' id='LC139'><br/></div><div class='line' id='LC140'><span class="p">(</span><span class="nf">defmacro</span> <span class="nv">coffee-line-as-string</span> <span class="p">()</span></div><div class='line' id='LC141'>&nbsp;&nbsp;<span class="s">&quot;Returns the current line as a string.&quot;</span></div><div class='line' id='LC142'>&nbsp;&nbsp;<span class="o">`</span><span class="p">(</span><span class="nf">buffer-substring</span> <span class="p">(</span><span class="nf">point-at-bol</span><span class="p">)</span> <span class="p">(</span><span class="nf">point-at-eol</span><span class="p">)))</span></div><div class='line' id='LC143'><br/></div><div class='line' id='LC144'><span class="c1">;;</span></div><div class='line' id='LC145'><span class="c1">;; Commands</span></div><div class='line' id='LC146'><span class="c1">;;</span></div><div class='line' id='LC147'><br/></div><div class='line' id='LC148'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-repl</span> <span class="p">()</span></div><div class='line' id='LC149'>&nbsp;&nbsp;<span class="s">&quot;Launch a CoffeeScript REPL using `coffee-command&#39; as an inferior mode.&quot;</span></div><div class='line' id='LC150'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC151'><br/></div><div class='line' id='LC152'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">unless</span> <span class="p">(</span><span class="nf">comint-check-proc</span> <span class="s">&quot;*CoffeeREPL*&quot;</span><span class="p">)</span></div><div class='line' id='LC153'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">set-buffer</span></div><div class='line' id='LC154'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nb">apply </span><span class="ss">&#39;make-comint</span> <span class="s">&quot;CoffeeREPL&quot;</span></div><div class='line' id='LC155'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">coffee-command</span> <span class="nv">nil</span> <span class="nv">coffee-args-repl</span><span class="p">)))</span></div><div class='line' id='LC156'><br/></div><div class='line' id='LC157'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">pop-to-buffer</span> <span class="s">&quot;*CoffeeREPL*&quot;</span><span class="p">))</span></div><div class='line' id='LC158'><br/></div><div class='line' id='LC159'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-compile-file</span> <span class="p">()</span></div><div class='line' id='LC160'>&nbsp;&nbsp;<span class="s">&quot;Compiles and saves the current file to disk. Doesn&#39;t open in a buffer..&quot;</span></div><div class='line' id='LC161'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC162'>&nbsp;&nbsp;<span class="p">(</span><span class="k">let </span><span class="p">((</span><span class="nf">compiler-output</span> <span class="p">(</span><span class="nf">shell-command-to-string</span> <span class="p">(</span><span class="nf">coffee-command-compile</span> <span class="p">(</span><span class="nf">buffer-file-name</span><span class="p">)))))</span></div><div class='line' id='LC163'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="k">if </span><span class="p">(</span><span class="nf">string=</span> <span class="nv">compiler-output</span> <span class="s">&quot;&quot;</span><span class="p">)</span></div><div class='line' id='LC164'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">message</span> <span class="s">&quot;Compiled and saved %s&quot;</span> <span class="p">(</span><span class="nf">concat</span> <span class="p">(</span><span class="nb">substring </span><span class="p">(</span><span class="nf">buffer-file-name</span><span class="p">)</span> <span class="mi">0</span> <span class="mi">-6</span><span class="p">)</span> <span class="s">&quot;js&quot;</span><span class="p">))</span></div><div class='line' id='LC165'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">message</span> <span class="p">(</span><span class="nb">car </span><span class="p">(</span><span class="nf">split-string</span> <span class="nv">compiler-output</span> <span class="s">&quot;[\n\r]+&quot;</span><span class="p">))))))</span></div><div class='line' id='LC166'><br/></div><div class='line' id='LC167'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-compile-buffer</span> <span class="p">()</span></div><div class='line' id='LC168'>&nbsp;&nbsp;<span class="s">&quot;Compiles the current buffer and displays the JS in another buffer.&quot;</span></div><div class='line' id='LC169'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC170'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">save-excursion</span></div><div class='line' id='LC171'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">coffee-compile-region</span> <span class="p">(</span><span class="nf">point-min</span><span class="p">)</span> <span class="p">(</span><span class="nf">point-max</span><span class="p">))))</span></div><div class='line' id='LC172'><br/></div><div class='line' id='LC173'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-compile-region</span> <span class="p">(</span><span class="nf">start</span> <span class="nv">end</span><span class="p">)</span></div><div class='line' id='LC174'>&nbsp;&nbsp;<span class="s">&quot;Compiles a region and displays the JS in another buffer.&quot;</span></div><div class='line' id='LC175'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span> <span class="s">&quot;r&quot;</span><span class="p">)</span></div><div class='line' id='LC176'><br/></div><div class='line' id='LC177'>&nbsp;&nbsp;<span class="p">(</span><span class="k">let </span><span class="p">((</span><span class="nf">buffer</span> <span class="p">(</span><span class="nf">get-buffer</span> <span class="nv">coffee-compiled-buffer-name</span><span class="p">)))</span></div><div class='line' id='LC178'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="nv">buffer</span></div><div class='line' id='LC179'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">kill-buffer</span> <span class="nv">buffer</span><span class="p">)))</span></div><div class='line' id='LC180'><br/></div><div class='line' id='LC181'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">call-process-region</span> <span class="nv">start</span> <span class="nv">end</span> <span class="nv">coffee-command</span> <span class="nv">nil</span></div><div class='line' id='LC182'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">get-buffer-create</span> <span class="nv">coffee-compiled-buffer-name</span><span class="p">)</span></div><div class='line' id='LC183'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">nil</span></div><div class='line' id='LC184'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;-s&quot;</span> <span class="s">&quot;-p&quot;</span> <span class="s">&quot;--bare&quot;</span><span class="p">)</span></div><div class='line' id='LC185'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">switch-to-buffer</span> <span class="p">(</span><span class="nf">get-buffer</span> <span class="nv">coffee-compiled-buffer-name</span><span class="p">))</span></div><div class='line' id='LC186'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">funcall</span> <span class="nv">coffee-js-mode</span><span class="p">)</span></div><div class='line' id='LC187'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">goto-char</span> <span class="p">(</span><span class="nf">point-min</span><span class="p">)))</span></div><div class='line' id='LC188'><br/></div><div class='line' id='LC189'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-show-version</span> <span class="p">()</span></div><div class='line' id='LC190'>&nbsp;&nbsp;<span class="s">&quot;Prints the `coffee-mode&#39; version.&quot;</span></div><div class='line' id='LC191'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC192'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">message</span> <span class="p">(</span><span class="nf">concat</span> <span class="s">&quot;coffee-mode v&quot;</span> <span class="nv">coffee-mode-version</span><span class="p">)))</span></div><div class='line' id='LC193'><br/></div><div class='line' id='LC194'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-open-reference</span> <span class="p">()</span></div><div class='line' id='LC195'>&nbsp;&nbsp;<span class="s">&quot;Open browser to CoffeeScript reference.&quot;</span></div><div class='line' id='LC196'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC197'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">browse-url</span> <span class="s">&quot;http://jashkenas.github.com/coffee-script/&quot;</span><span class="p">))</span></div><div class='line' id='LC198'><br/></div><div class='line' id='LC199'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-open-node-reference</span> <span class="p">()</span></div><div class='line' id='LC200'>&nbsp;&nbsp;<span class="s">&quot;Open browser to node.js documentation.&quot;</span></div><div class='line' id='LC201'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC202'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">browse-url</span> <span class="s">&quot;http://nodejs.org/docs/&quot;</span><span class="p">))</span></div><div class='line' id='LC203'><br/></div><div class='line' id='LC204'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-open-github</span> <span class="p">()</span></div><div class='line' id='LC205'>&nbsp;&nbsp;<span class="s">&quot;Open browser to `coffee-mode&#39; project on GithHub.&quot;</span></div><div class='line' id='LC206'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC207'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">browse-url</span> <span class="s">&quot;http://github.com/defunkt/coffee-mode&quot;</span><span class="p">))</span></div><div class='line' id='LC208'><br/></div><div class='line' id='LC209'><span class="c1">;;</span></div><div class='line' id='LC210'><span class="c1">;; Menubar</span></div><div class='line' id='LC211'><span class="c1">;;</span></div><div class='line' id='LC212'><br/></div><div class='line' id='LC213'><span class="p">(</span><span class="nf">easy-menu-define</span> <span class="nv">coffee-mode-menu</span> <span class="nv">coffee-mode-map</span></div><div class='line' id='LC214'>&nbsp;&nbsp;<span class="s">&quot;Menu for CoffeeScript mode&quot;</span></div><div class='line' id='LC215'>&nbsp;&nbsp;<span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;CoffeeScript&quot;</span></div><div class='line' id='LC216'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="err">[</span><span class="s">&quot;Compile File&quot;</span> <span class="nv">coffee-compile-file</span><span class="err">]</span></div><div class='line' id='LC217'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="err">[</span><span class="s">&quot;Compile Buffer&quot;</span> <span class="nv">coffee-compile-buffer</span><span class="err">]</span></div><div class='line' id='LC218'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="err">[</span><span class="s">&quot;Compile Region&quot;</span> <span class="nv">coffee-compile-region</span><span class="err">]</span></div><div class='line' id='LC219'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="err">[</span><span class="s">&quot;REPL&quot;</span> <span class="nv">coffee-repl</span><span class="err">]</span></div><div class='line' id='LC220'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;---&quot;</span></div><div class='line' id='LC221'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="err">[</span><span class="s">&quot;CoffeeScript Reference&quot;</span> <span class="nv">coffee-open-reference</span><span class="err">]</span></div><div class='line' id='LC222'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="err">[</span><span class="s">&quot;node.js Reference&quot;</span> <span class="nv">coffee-open-node-reference</span><span class="err">]</span></div><div class='line' id='LC223'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="err">[</span><span class="s">&quot;coffee-mode on GitHub&quot;</span> <span class="nv">coffee-open-github</span><span class="err">]</span></div><div class='line' id='LC224'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="err">[</span><span class="s">&quot;Version&quot;</span> <span class="nv">coffee-show-version</span><span class="err">]</span></div><div class='line' id='LC225'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">))</span></div><div class='line' id='LC226'><br/></div><div class='line' id='LC227'><span class="c1">;;</span></div><div class='line' id='LC228'><span class="c1">;; Define Language Syntax</span></div><div class='line' id='LC229'><span class="c1">;;</span></div><div class='line' id='LC230'><br/></div><div class='line' id='LC231'><span class="c1">;; String literals</span></div><div class='line' id='LC232'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-string-regexp</span> <span class="s">&quot;\&quot;\\([^\\]\\|\\\\.\\)*?\&quot;\\|&#39;\\([^\\]\\|\\\\.\\)*?&#39;&quot;</span><span class="p">)</span></div><div class='line' id='LC233'><br/></div><div class='line' id='LC234'><span class="c1">;; Instance variables (implicit this)</span></div><div class='line' id='LC235'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-this-regexp</span> <span class="s">&quot;@\\(\\w\\|_\\)*\\|this&quot;</span><span class="p">)</span></div><div class='line' id='LC236'><br/></div><div class='line' id='LC237'><span class="c1">;; Prototype::access</span></div><div class='line' id='LC238'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-prototype-regexp</span> <span class="s">&quot;\\(\\(\\w\\|\\.\\|_\\| \\|$\\)+?\\)::\\(\\(\\w\\|\\.\\|_\\| \\|$\\)+?\\):&quot;</span><span class="p">)</span></div><div class='line' id='LC239'><br/></div><div class='line' id='LC240'><span class="c1">;; Assignment</span></div><div class='line' id='LC241'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-assign-regexp</span> <span class="s">&quot;\\(\\(\\w\\|\\.\\|_\\| \\|$\\)+?\\):&quot;</span><span class="p">)</span></div><div class='line' id='LC242'><br/></div><div class='line' id='LC243'><span class="c1">;; Lambda</span></div><div class='line' id='LC244'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-lambda-regexp</span> <span class="s">&quot;\\((.+)\\)?\\s *\\(-&gt;\\|=&gt;\\)&quot;</span><span class="p">)</span></div><div class='line' id='LC245'><br/></div><div class='line' id='LC246'><span class="c1">;; Namespaces</span></div><div class='line' id='LC247'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-namespace-regexp</span> <span class="s">&quot;\\b\\(class\\s +\\(\\S +\\)\\)\\b&quot;</span><span class="p">)</span></div><div class='line' id='LC248'><br/></div><div class='line' id='LC249'><span class="c1">;; Booleans</span></div><div class='line' id='LC250'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-boolean-regexp</span> <span class="s">&quot;\\b\\(true\\|false\\|yes\\|no\\|on\\|off\\|null\\)\\b&quot;</span><span class="p">)</span></div><div class='line' id='LC251'><br/></div><div class='line' id='LC252'><span class="c1">;; Regular Expressions</span></div><div class='line' id='LC253'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-regexp-regexp</span> <span class="s">&quot;\\/\\(\\\\.\\|\\[\\(\\\\.\\|.\\)+?\\]\\|[^/]\\)+?\\/&quot;</span><span class="p">)</span></div><div class='line' id='LC254'><br/></div><div class='line' id='LC255'><span class="c1">;; JavaScript Keywords</span></div><div class='line' id='LC256'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-js-keywords</span></div><div class='line' id='LC257'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;if&quot;</span> <span class="s">&quot;else&quot;</span> <span class="s">&quot;new&quot;</span> <span class="s">&quot;return&quot;</span> <span class="s">&quot;try&quot;</span> <span class="s">&quot;catch&quot;</span></div><div class='line' id='LC258'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;finally&quot;</span> <span class="s">&quot;throw&quot;</span> <span class="s">&quot;break&quot;</span> <span class="s">&quot;continue&quot;</span> <span class="s">&quot;for&quot;</span> <span class="s">&quot;in&quot;</span> <span class="s">&quot;while&quot;</span></div><div class='line' id='LC259'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;delete&quot;</span> <span class="s">&quot;instanceof&quot;</span> <span class="s">&quot;typeof&quot;</span> <span class="s">&quot;switch&quot;</span> <span class="s">&quot;super&quot;</span> <span class="s">&quot;extends&quot;</span></div><div class='line' id='LC260'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;class&quot;</span> <span class="s">&quot;until&quot;</span> <span class="s">&quot;loop&quot;</span><span class="p">))</span></div><div class='line' id='LC261'><br/></div><div class='line' id='LC262'><span class="c1">;; Reserved keywords either by JS or CS.</span></div><div class='line' id='LC263'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-js-reserved</span></div><div class='line' id='LC264'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;case&quot;</span> <span class="s">&quot;default&quot;</span> <span class="s">&quot;do&quot;</span> <span class="s">&quot;function&quot;</span> <span class="s">&quot;var&quot;</span> <span class="s">&quot;void&quot;</span> <span class="s">&quot;with&quot;</span></div><div class='line' id='LC265'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;const&quot;</span> <span class="s">&quot;let&quot;</span> <span class="s">&quot;debugger&quot;</span> <span class="s">&quot;enum&quot;</span> <span class="s">&quot;export&quot;</span> <span class="s">&quot;import&quot;</span> <span class="s">&quot;native&quot;</span></div><div class='line' id='LC266'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;__extends&quot;</span> <span class="s">&quot;__hasProp&quot;</span><span class="p">))</span></div><div class='line' id='LC267'><br/></div><div class='line' id='LC268'><span class="c1">;; CoffeeScript keywords.</span></div><div class='line' id='LC269'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-cs-keywords</span></div><div class='line' id='LC270'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;then&quot;</span> <span class="s">&quot;unless&quot;</span> <span class="s">&quot;and&quot;</span> <span class="s">&quot;or&quot;</span> <span class="s">&quot;is&quot;</span></div><div class='line' id='LC271'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;isnt&quot;</span> <span class="s">&quot;not&quot;</span> <span class="s">&quot;of&quot;</span> <span class="s">&quot;by&quot;</span> <span class="s">&quot;where&quot;</span> <span class="s">&quot;when&quot;</span><span class="p">))</span></div><div class='line' id='LC272'><br/></div><div class='line' id='LC273'><span class="c1">;; Regular expression combining the above three lists.</span></div><div class='line' id='LC274'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-keywords-regexp</span> <span class="p">(</span><span class="nf">regexp-opt</span></div><div class='line' id='LC275'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">append</span></div><div class='line' id='LC276'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">coffee-js-reserved</span></div><div class='line' id='LC277'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">coffee-js-keywords</span></div><div class='line' id='LC278'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">coffee-cs-keywords</span><span class="p">)</span> <span class="ss">&#39;words</span><span class="p">))</span></div><div class='line' id='LC279'><br/></div><div class='line' id='LC280'><br/></div><div class='line' id='LC281'><span class="c1">;; Create the list for font-lock. Each class of keyword is given a</span></div><div class='line' id='LC282'><span class="c1">;; particular face.</span></div><div class='line' id='LC283'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-font-lock-keywords</span></div><div class='line' id='LC284'>&nbsp;&nbsp;<span class="c1">;; *Note*: order below matters. `coffee-keywords-regexp&#39; goes last</span></div><div class='line' id='LC285'>&nbsp;&nbsp;<span class="c1">;; because otherwise the keyword &quot;state&quot; in the function</span></div><div class='line' id='LC286'>&nbsp;&nbsp;<span class="c1">;; &quot;state_entry&quot; would be highlighted.</span></div><div class='line' id='LC287'>&nbsp;&nbsp;<span class="o">`</span><span class="p">((</span><span class="o">,</span><span class="nv">coffee-string-regexp</span> <span class="o">.</span> <span class="nv">font-lock-string-face</span><span class="p">)</span></div><div class='line' id='LC288'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="o">,</span><span class="nv">coffee-this-regexp</span> <span class="o">.</span> <span class="nv">font-lock-variable-name-face</span><span class="p">)</span></div><div class='line' id='LC289'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="o">,</span><span class="nv">coffee-prototype-regexp</span> <span class="o">.</span> <span class="nv">font-lock-variable-name-face</span><span class="p">)</span></div><div class='line' id='LC290'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="o">,</span><span class="nv">coffee-assign-regexp</span> <span class="o">.</span> <span class="nv">font-lock-type-face</span><span class="p">)</span></div><div class='line' id='LC291'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="o">,</span><span class="nv">coffee-regexp-regexp</span> <span class="o">.</span> <span class="nv">font-lock-constant-face</span><span class="p">)</span></div><div class='line' id='LC292'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="o">,</span><span class="nv">coffee-boolean-regexp</span> <span class="o">.</span> <span class="nv">font-lock-constant-face</span><span class="p">)</span></div><div class='line' id='LC293'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="o">,</span><span class="nv">coffee-keywords-regexp</span> <span class="o">.</span> <span class="nv">font-lock-keyword-face</span><span class="p">)))</span></div><div class='line' id='LC294'><br/></div><div class='line' id='LC295'><span class="c1">;;</span></div><div class='line' id='LC296'><span class="c1">;; Helper Functions</span></div><div class='line' id='LC297'><span class="c1">;;</span></div><div class='line' id='LC298'><br/></div><div class='line' id='LC299'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-before-save</span> <span class="p">()</span></div><div class='line' id='LC300'>&nbsp;&nbsp;<span class="s">&quot;Hook run before file is saved. Deletes whitespace if</span></div><div class='line' id='LC301'><span class="s">`coffee-cleanup-whitespace&#39; is non-nil.&quot;</span></div><div class='line' id='LC302'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="nv">coffee-cleanup-whitespace</span></div><div class='line' id='LC303'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">delete-trailing-whitespace</span><span class="p">)))</span></div><div class='line' id='LC304'><br/></div><div class='line' id='LC305'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-comment-dwim</span> <span class="p">(</span><span class="nf">arg</span><span class="p">)</span></div><div class='line' id='LC306'>&nbsp;&nbsp;<span class="s">&quot;Comment or uncomment current line or region in a smart way.</span></div><div class='line' id='LC307'><span class="s">For detail, see `comment-dwim&#39;.&quot;</span></div><div class='line' id='LC308'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span> <span class="s">&quot;*P&quot;</span><span class="p">)</span></div><div class='line' id='LC309'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">require</span> <span class="ss">&#39;newcomment</span><span class="p">)</span></div><div class='line' id='LC310'>&nbsp;&nbsp;<span class="p">(</span><span class="k">let </span><span class="p">((</span><span class="nf">deactivate-mark</span> <span class="nv">nil</span><span class="p">)</span> <span class="p">(</span><span class="nf">comment-start</span> <span class="s">&quot;#&quot;</span><span class="p">)</span> <span class="p">(</span><span class="nf">comment-end</span> <span class="s">&quot;&quot;</span><span class="p">))</span></div><div class='line' id='LC311'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">comment-dwim</span> <span class="nv">arg</span><span class="p">)))</span></div><div class='line' id='LC312'><br/></div><div class='line' id='LC313'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-command-compile</span> <span class="p">(</span><span class="nf">file-name</span><span class="p">)</span></div><div class='line' id='LC314'>&nbsp;&nbsp;<span class="s">&quot;The `coffee-command&#39; with args to compile a file.&quot;</span></div><div class='line' id='LC315'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">mapconcat</span> <span class="ss">&#39;identity</span> <span class="p">(</span><span class="nb">append </span><span class="p">(</span><span class="nb">list </span><span class="nv">coffee-command</span><span class="p">)</span> <span class="nv">coffee-args-compile</span> <span class="p">(</span><span class="nb">list </span><span class="nv">file-name</span><span class="p">))</span> <span class="s">&quot; &quot;</span><span class="p">))</span></div><div class='line' id='LC316'><br/></div><div class='line' id='LC317'><span class="c1">;;</span></div><div class='line' id='LC318'><span class="c1">;; imenu support</span></div><div class='line' id='LC319'><span class="c1">;;</span></div><div class='line' id='LC320'><br/></div><div class='line' id='LC321'><span class="c1">;; This is a pretty naive but workable way of doing it. First we look</span></div><div class='line' id='LC322'><span class="c1">;; for any lines that starting with `coffee-assign-regexp&#39; that include</span></div><div class='line' id='LC323'><span class="c1">;; `coffee-lambda-regexp&#39; then add those tokens to the list.</span></div><div class='line' id='LC324'><span class="c1">;;</span></div><div class='line' id='LC325'><span class="c1">;; Should cover cases like these:</span></div><div class='line' id='LC326'><span class="c1">;;</span></div><div class='line' id='LC327'><span class="c1">;; minus: (x, y) -&gt; x - y</span></div><div class='line' id='LC328'><span class="c1">;; String::length: -&gt; 10</span></div><div class='line' id='LC329'><span class="c1">;; block: -&gt;</span></div><div class='line' id='LC330'><span class="c1">;;   print(&#39;potion&#39;)</span></div><div class='line' id='LC331'><span class="c1">;;</span></div><div class='line' id='LC332'><span class="c1">;; Next we look for any line that starts with `class&#39; or</span></div><div class='line' id='LC333'><span class="c1">;; `coffee-assign-regexp&#39; followed by `{` and drop into a</span></div><div class='line' id='LC334'><span class="c1">;; namespace. This means we search one indentation level deeper for</span></div><div class='line' id='LC335'><span class="c1">;; more assignments and add them to the alist prefixed with the</span></div><div class='line' id='LC336'><span class="c1">;; namespace name.</span></div><div class='line' id='LC337'><span class="c1">;;</span></div><div class='line' id='LC338'><span class="c1">;; Should cover cases like these:</span></div><div class='line' id='LC339'><span class="c1">;;</span></div><div class='line' id='LC340'><span class="c1">;; class Person</span></div><div class='line' id='LC341'><span class="c1">;;   print: -&gt;</span></div><div class='line' id='LC342'><span class="c1">;;     print &#39;My name is &#39; + this.name + &#39;.&#39;</span></div><div class='line' id='LC343'><span class="c1">;;</span></div><div class='line' id='LC344'><span class="c1">;; class Policeman extends Person</span></div><div class='line' id='LC345'><span class="c1">;;   constructor: (rank) -&gt;</span></div><div class='line' id='LC346'><span class="c1">;;     @rank: rank</span></div><div class='line' id='LC347'><span class="c1">;;   print: -&gt;</span></div><div class='line' id='LC348'><span class="c1">;;     print &#39;My name is &#39; + this.name + &quot; and I&#39;m a &quot; + this.rank + &#39;.&#39;</span></div><div class='line' id='LC349'><span class="c1">;;</span></div><div class='line' id='LC350'><span class="c1">;; TODO:</span></div><div class='line' id='LC351'><span class="c1">;; app = {</span></div><div class='line' id='LC352'><span class="c1">;;   window:  {width: 200, height: 200}</span></div><div class='line' id='LC353'><span class="c1">;;   para:    -&gt; &#39;Welcome.&#39;</span></div><div class='line' id='LC354'><span class="c1">;;   button:  -&gt; &#39;OK&#39;</span></div><div class='line' id='LC355'><span class="c1">;; }</span></div><div class='line' id='LC356'><br/></div><div class='line' id='LC357'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-imenu-create-index</span> <span class="p">()</span></div><div class='line' id='LC358'>&nbsp;&nbsp;<span class="s">&quot;Create an imenu index of all methods in the buffer.&quot;</span></div><div class='line' id='LC359'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC360'><br/></div><div class='line' id='LC361'>&nbsp;&nbsp;<span class="c1">;; This function is called within a `save-excursion&#39; so we&#39;re safe.</span></div><div class='line' id='LC362'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">goto-char</span> <span class="p">(</span><span class="nf">point-min</span><span class="p">))</span></div><div class='line' id='LC363'><br/></div><div class='line' id='LC364'>&nbsp;&nbsp;<span class="p">(</span><span class="k">let </span><span class="p">((</span><span class="nf">index-alist</span> <span class="o">&#39;</span><span class="p">())</span> <span class="nv">assign</span> <span class="nv">pos</span> <span class="nv">indent</span> <span class="nv">ns-name</span> <span class="nv">ns-indent</span><span class="p">)</span></div><div class='line' id='LC365'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Go through every assignment that includes -&gt; or =&gt; on the same</span></div><div class='line' id='LC366'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; line or starts with `class&#39;.</span></div><div class='line' id='LC367'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">while</span> <span class="p">(</span><span class="nf">re-search-forward</span></div><div class='line' id='LC368'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">concat</span> <span class="s">&quot;^\\(\\s *\\)&quot;</span></div><div class='line' id='LC369'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;\\(&quot;</span></div><div class='line' id='LC370'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">coffee-assign-regexp</span></div><div class='line' id='LC371'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;.+?&quot;</span></div><div class='line' id='LC372'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">coffee-lambda-regexp</span></div><div class='line' id='LC373'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;\\|&quot;</span></div><div class='line' id='LC374'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">coffee-namespace-regexp</span></div><div class='line' id='LC375'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s">&quot;\\)&quot;</span><span class="p">)</span></div><div class='line' id='LC376'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">point-max</span><span class="p">)</span></div><div class='line' id='LC377'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">t</span><span class="p">)</span></div><div class='line' id='LC378'><br/></div><div class='line' id='LC379'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">coffee-debug</span> <span class="s">&quot;Match: %s&quot;</span> <span class="p">(</span><span class="nf">match-string</span> <span class="mi">0</span><span class="p">))</span></div><div class='line' id='LC380'><br/></div><div class='line' id='LC381'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; If this is the start of a new namespace, save the namespace&#39;s</span></div><div class='line' id='LC382'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; indentation level and name.</span></div><div class='line' id='LC383'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="nf">match-string</span> <span class="mi">8</span><span class="p">)</span></div><div class='line' id='LC384'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Set the name.</span></div><div class='line' id='LC385'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">ns-name</span> <span class="p">(</span><span class="nf">match-string</span> <span class="mi">8</span><span class="p">))</span></div><div class='line' id='LC386'><br/></div><div class='line' id='LC387'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; If this is a class declaration, add :: to the namespace.</span></div><div class='line' id='LC388'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">ns-name</span> <span class="p">(</span><span class="nf">concat</span> <span class="nv">ns-name</span> <span class="s">&quot;::&quot;</span><span class="p">))</span></div><div class='line' id='LC389'><br/></div><div class='line' id='LC390'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Save the indentation level.</span></div><div class='line' id='LC391'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">ns-indent</span> <span class="p">(</span><span class="nb">length </span><span class="p">(</span><span class="nf">match-string</span> <span class="mi">1</span><span class="p">)))</span></div><div class='line' id='LC392'><br/></div><div class='line' id='LC393'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Debug</span></div><div class='line' id='LC394'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">coffee-debug</span> <span class="s">&quot;ns: Found %s with indent %s&quot;</span> <span class="nv">ns-name</span> <span class="nv">ns-indent</span><span class="p">))</span></div><div class='line' id='LC395'><br/></div><div class='line' id='LC396'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; If this is an assignment, save the token being</span></div><div class='line' id='LC397'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; assigned. `Please.print:` will be `Please.print`, `block:`</span></div><div class='line' id='LC398'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; will be `block`, etc.</span></div><div class='line' id='LC399'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="nf">setq</span> <span class="nv">assign</span> <span class="p">(</span><span class="nf">match-string</span> <span class="mi">3</span><span class="p">))</span></div><div class='line' id='LC400'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; The position of the match in the buffer.</span></div><div class='line' id='LC401'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">pos</span> <span class="p">(</span><span class="nf">match-beginning</span> <span class="mi">3</span><span class="p">))</span></div><div class='line' id='LC402'><br/></div><div class='line' id='LC403'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; The indent level of this match</span></div><div class='line' id='LC404'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">indent</span> <span class="p">(</span><span class="nb">length </span><span class="p">(</span><span class="nf">match-string</span> <span class="mi">1</span><span class="p">)))</span></div><div class='line' id='LC405'><br/></div><div class='line' id='LC406'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; If we&#39;re within the context of a namespace, add that to the</span></div><div class='line' id='LC407'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; front of the assign, e.g.</span></div><div class='line' id='LC408'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; constructor: =&gt; Policeman::constructor</span></div><div class='line' id='LC409'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="k">and </span><span class="nv">ns-name</span> <span class="p">(</span><span class="nb">&gt; </span><span class="nv">indent</span> <span class="nv">ns-indent</span><span class="p">))</span></div><div class='line' id='LC410'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">assign</span> <span class="p">(</span><span class="nf">concat</span> <span class="nv">ns-name</span> <span class="nv">assign</span><span class="p">)))</span></div><div class='line' id='LC411'><br/></div><div class='line' id='LC412'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">coffee-debug</span> <span class="s">&quot;=: Found %s with indent %s&quot;</span> <span class="nv">assign</span> <span class="nv">indent</span><span class="p">)</span></div><div class='line' id='LC413'><br/></div><div class='line' id='LC414'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Clear the namespace if we&#39;re no longer indented deeper</span></div><div class='line' id='LC415'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; than it.</span></div><div class='line' id='LC416'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="k">and </span><span class="nv">ns-name</span> <span class="p">(</span><span class="nb">&lt;= </span><span class="nv">indent</span> <span class="nv">ns-indent</span><span class="p">))</span></div><div class='line' id='LC417'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">coffee-debug</span> <span class="s">&quot;ns: Clearing %s&quot;</span> <span class="nv">ns-name</span><span class="p">)</span></div><div class='line' id='LC418'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">ns-name</span> <span class="nv">nil</span><span class="p">)</span></div><div class='line' id='LC419'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">ns-indent</span> <span class="nv">nil</span><span class="p">))</span></div><div class='line' id='LC420'><br/></div><div class='line' id='LC421'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Add this to the alist. Done.</span></div><div class='line' id='LC422'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">push</span> <span class="p">(</span><span class="nb">cons </span><span class="nv">assign</span> <span class="nv">pos</span><span class="p">)</span> <span class="nv">index-alist</span><span class="p">)))</span></div><div class='line' id='LC423'><br/></div><div class='line' id='LC424'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Return the alist.</span></div><div class='line' id='LC425'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">index-alist</span><span class="p">))</span></div><div class='line' id='LC426'><br/></div><div class='line' id='LC427'><span class="c1">;;</span></div><div class='line' id='LC428'><span class="c1">;; Indentation</span></div><div class='line' id='LC429'><span class="c1">;;</span></div><div class='line' id='LC430'><br/></div><div class='line' id='LC431'><span class="c1">;;; The theory is explained in the README.</span></div><div class='line' id='LC432'><br/></div><div class='line' id='LC433'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-indent-line</span> <span class="p">()</span></div><div class='line' id='LC434'>&nbsp;&nbsp;<span class="s">&quot;Indent current line as CoffeeScript.&quot;</span></div><div class='line' id='LC435'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC436'><br/></div><div class='line' id='LC437'>&nbsp;&nbsp;<span class="p">(</span><span class="k">if </span><span class="p">(</span><span class="nb">= </span><span class="p">(</span><span class="nf">point</span><span class="p">)</span> <span class="p">(</span><span class="nf">point-at-bol</span><span class="p">))</span></div><div class='line' id='LC438'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">insert-tab</span><span class="p">)</span></div><div class='line' id='LC439'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">save-excursion</span></div><div class='line' id='LC440'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="k">let </span><span class="p">((</span><span class="nf">prev-indent</span> <span class="mi">0</span><span class="p">)</span> <span class="p">(</span><span class="nf">cur-indent</span> <span class="mi">0</span><span class="p">))</span></div><div class='line' id='LC441'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Figure out the indentation of the previous line</span></div><div class='line' id='LC442'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setd</span> <span class="nv">prev-indent</span> <span class="p">(</span><span class="nf">coffee-previous-indent</span><span class="p">))</span></div><div class='line' id='LC443'><br/></div><div class='line' id='LC444'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Figure out the current line&#39;s indentation</span></div><div class='line' id='LC445'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setd</span> <span class="nv">cur-indent</span> <span class="p">(</span><span class="nf">current-indentation</span><span class="p">))</span></div><div class='line' id='LC446'><br/></div><div class='line' id='LC447'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Shift one column to the left</span></div><div class='line' id='LC448'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">beginning-of-line</span><span class="p">)</span></div><div class='line' id='LC449'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">insert-tab</span><span class="p">)</span></div><div class='line' id='LC450'><br/></div><div class='line' id='LC451'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">coffee-debug</span> <span class="s">&quot;point: %s&quot;</span> <span class="p">(</span><span class="nf">point</span><span class="p">))</span></div><div class='line' id='LC452'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">coffee-debug</span> <span class="s">&quot;point-at-bol: %s&quot;</span> <span class="p">(</span><span class="nf">point-at-bol</span><span class="p">))</span></div><div class='line' id='LC453'><br/></div><div class='line' id='LC454'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="nb">= </span><span class="p">(</span><span class="nf">point-at-bol</span><span class="p">)</span> <span class="p">(</span><span class="nf">point</span><span class="p">))</span></div><div class='line' id='LC455'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">forward-char</span> <span class="nv">coffee-tab-width</span><span class="p">))</span></div><div class='line' id='LC456'><br/></div><div class='line' id='LC457'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">coffee-debug</span> <span class="s">&quot;New indent: %s&quot;</span> <span class="p">(</span><span class="nf">current-indentation</span><span class="p">))</span></div><div class='line' id='LC458'><br/></div><div class='line' id='LC459'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; We&#39;re too far, remove all indentation.</span></div><div class='line' id='LC460'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="nb">&gt; </span><span class="p">(</span><span class="nb">- </span><span class="p">(</span><span class="nf">current-indentation</span><span class="p">)</span> <span class="nv">prev-indent</span><span class="p">)</span> <span class="nv">coffee-tab-width</span><span class="p">)</span></div><div class='line' id='LC461'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">backward-to-indentation</span> <span class="mi">0</span><span class="p">)</span></div><div class='line' id='LC462'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">delete-region</span> <span class="p">(</span><span class="nf">point-at-bol</span><span class="p">)</span> <span class="p">(</span><span class="nf">point</span><span class="p">)))))))</span></div><div class='line' id='LC463'><br/></div><div class='line' id='LC464'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-previous-indent</span> <span class="p">()</span></div><div class='line' id='LC465'>&nbsp;&nbsp;<span class="s">&quot;Return the indentation level of the previous non-blank line.&quot;</span></div><div class='line' id='LC466'><br/></div><div class='line' id='LC467'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">save-excursion</span></div><div class='line' id='LC468'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">forward-line</span> <span class="mi">-1</span><span class="p">)</span></div><div class='line' id='LC469'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="k">if </span><span class="p">(</span><span class="nf">bobp</span><span class="p">)</span></div><div class='line' id='LC470'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="mi">0</span></div><div class='line' id='LC471'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">progn</span></div><div class='line' id='LC472'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">while</span> <span class="p">(</span><span class="k">and </span><span class="p">(</span><span class="nf">coffee-line-empty-p</span><span class="p">)</span> <span class="p">(</span><span class="nb">not </span><span class="p">(</span><span class="nf">bobp</span><span class="p">)))</span> <span class="p">(</span><span class="nf">forward-line</span> <span class="mi">-1</span><span class="p">))</span></div><div class='line' id='LC473'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">current-indentation</span><span class="p">)))))</span></div><div class='line' id='LC474'><br/></div><div class='line' id='LC475'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-line-empty-p</span> <span class="p">()</span></div><div class='line' id='LC476'>&nbsp;&nbsp;<span class="s">&quot;Is this line empty? Returns non-nil if so, nil if not.&quot;</span></div><div class='line' id='LC477'>&nbsp;&nbsp;<span class="p">(</span><span class="k">or </span><span class="p">(</span><span class="nf">bobp</span><span class="p">)</span></div><div class='line' id='LC478'>&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">string-match</span> <span class="s">&quot;^\\s *$&quot;</span> <span class="p">(</span><span class="nf">coffee-line-as-string</span><span class="p">))))</span></div><div class='line' id='LC479'><br/></div><div class='line' id='LC480'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-newline-and-indent</span> <span class="p">()</span></div><div class='line' id='LC481'>&nbsp;&nbsp;<span class="s">&quot;Inserts a newline and indents it to the same level as the previous line.&quot;</span></div><div class='line' id='LC482'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC483'><br/></div><div class='line' id='LC484'>&nbsp;&nbsp;<span class="c1">;; Remember the current line indentation level,</span></div><div class='line' id='LC485'>&nbsp;&nbsp;<span class="c1">;; insert a newline, and indent the newline to the same</span></div><div class='line' id='LC486'>&nbsp;&nbsp;<span class="c1">;; level as the previous line.</span></div><div class='line' id='LC487'>&nbsp;&nbsp;<span class="p">(</span><span class="k">let </span><span class="p">((</span><span class="nf">prev-indent</span> <span class="p">(</span><span class="nf">current-indentation</span><span class="p">))</span> <span class="p">(</span><span class="nf">indent-next</span> <span class="nv">nil</span><span class="p">))</span></div><div class='line' id='LC488'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">newline</span><span class="p">)</span></div><div class='line' id='LC489'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">insert-tab</span> <span class="p">(</span><span class="nb">/ </span><span class="nv">prev-indent</span> <span class="nv">coffee-tab-width</span><span class="p">))</span></div><div class='line' id='LC490'><br/></div><div class='line' id='LC491'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; We need to insert an additional tab because the last line was special.</span></div><div class='line' id='LC492'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="nf">coffee-line-wants-indent</span><span class="p">)</span></div><div class='line' id='LC493'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">insert-tab</span><span class="p">)))</span></div><div class='line' id='LC494'><br/></div><div class='line' id='LC495'>&nbsp;&nbsp;<span class="c1">;; Last line was a comment so this one should probably be,</span></div><div class='line' id='LC496'>&nbsp;&nbsp;<span class="c1">;; too. Makes it easy to write multi-line comments (like the one I&#39;m</span></div><div class='line' id='LC497'>&nbsp;&nbsp;<span class="c1">;; writing right now).</span></div><div class='line' id='LC498'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="nf">coffee-previous-line-is-comment</span><span class="p">)</span></div><div class='line' id='LC499'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">insert</span> <span class="s">&quot;# &quot;</span><span class="p">)))</span></div><div class='line' id='LC500'><br/></div><div class='line' id='LC501'><span class="c1">;; Indenters help determine whether the current line should be</span></div><div class='line' id='LC502'><span class="c1">;; indented further based on the content of the previous line. If a</span></div><div class='line' id='LC503'><span class="c1">;; line starts with `class&#39;, for instance, you&#39;re probably going to</span></div><div class='line' id='LC504'><span class="c1">;; want to indent the next line.</span></div><div class='line' id='LC505'><br/></div><div class='line' id='LC506'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-indenters-bol</span> <span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;class&quot;</span> <span class="s">&quot;for&quot;</span> <span class="s">&quot;if&quot;</span> <span class="s">&quot;try&quot;</span><span class="p">)</span></div><div class='line' id='LC507'>&nbsp;&nbsp;<span class="s">&quot;Keywords or syntax whose presence at the start of a line means the</span></div><div class='line' id='LC508'><span class="s">next line should probably be indented.&quot;</span><span class="p">)</span></div><div class='line' id='LC509'><br/></div><div class='line' id='LC510'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-indenters-bol-regexp</span> <span class="p">()</span></div><div class='line' id='LC511'>&nbsp;&nbsp;<span class="s">&quot;Builds a regexp out of `coffee-indenters-bol&#39; words.&quot;</span></div><div class='line' id='LC512'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">concat</span> <span class="s">&quot;^&quot;</span> <span class="p">(</span><span class="nf">regexp-opt</span> <span class="nv">coffee-indenters-bol</span> <span class="ss">&#39;words</span><span class="p">)))</span></div><div class='line' id='LC513'><br/></div><div class='line' id='LC514'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">coffee-indenters-eol</span> <span class="o">&#39;</span><span class="p">(</span><span class="nv">?&gt;</span> <span class="nv">?</span><span class="err">{</span> <span class="nv">?</span><span class="err">\[</span><span class="p">)</span></div><div class='line' id='LC515'>&nbsp;&nbsp;<span class="s">&quot;Single characters at the end of a line that mean the next line</span></div><div class='line' id='LC516'><span class="s">should probably be indented.&quot;</span><span class="p">)</span></div><div class='line' id='LC517'><br/></div><div class='line' id='LC518'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-line-wants-indent</span> <span class="p">()</span></div><div class='line' id='LC519'>&nbsp;&nbsp;<span class="s">&quot;Does the current line want to be indented deeper than the previous</span></div><div class='line' id='LC520'><span class="s">line? Returns `t&#39; or `nil&#39;. See the README for more details.&quot;</span></div><div class='line' id='LC521'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span><span class="p">)</span></div><div class='line' id='LC522'><br/></div><div class='line' id='LC523'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">save-excursion</span></div><div class='line' id='LC524'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="k">let </span><span class="p">((</span><span class="nf">indenter-at-bol</span><span class="p">)</span> <span class="p">(</span><span class="nf">indenter-at-eol</span><span class="p">))</span></div><div class='line' id='LC525'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Go back a line and to the first character.</span></div><div class='line' id='LC526'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">forward-line</span> <span class="mi">-1</span><span class="p">)</span></div><div class='line' id='LC527'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">backward-to-indentation</span> <span class="mi">0</span><span class="p">)</span></div><div class='line' id='LC528'><br/></div><div class='line' id='LC529'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; If the next few characters match one of our magic indenter</span></div><div class='line' id='LC530'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; keywords, we want to indent the line we were on originally.</span></div><div class='line' id='LC531'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="nf">looking-at</span> <span class="p">(</span><span class="nf">coffee-indenters-bol-regexp</span><span class="p">))</span></div><div class='line' id='LC532'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setd</span> <span class="nv">indenter-at-bol</span> <span class="nv">t</span><span class="p">))</span></div><div class='line' id='LC533'><br/></div><div class='line' id='LC534'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; If that didn&#39;t match, go to the back of the line and check to</span></div><div class='line' id='LC535'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; see if the last character matches one of our indenter</span></div><div class='line' id='LC536'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; characters.</span></div><div class='line' id='LC537'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="nb">not </span><span class="nv">indenter-at-bol</span><span class="p">)</span></div><div class='line' id='LC538'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">end-of-line</span><span class="p">)</span></div><div class='line' id='LC539'><br/></div><div class='line' id='LC540'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; Optimized for speed - checks only the last character.</span></div><div class='line' id='LC541'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">when</span> <span class="p">(</span><span class="nf">some</span> <span class="p">(</span><span class="k">lambda </span><span class="p">(</span><span class="nf">char</span><span class="p">)</span></div><div class='line' id='LC542'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nb">= </span><span class="p">(</span><span class="nf">char-before</span><span class="p">)</span> <span class="nv">char</span><span class="p">))</span></div><div class='line' id='LC543'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">coffee-indenters-eol</span><span class="p">)</span></div><div class='line' id='LC544'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">setd</span> <span class="nv">indenter-at-eol</span> <span class="nv">t</span><span class="p">)))</span></div><div class='line' id='LC545'><br/></div><div class='line' id='LC546'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">;; If we found an indenter, return `t&#39;.</span></div><div class='line' id='LC547'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="k">or </span><span class="nv">indenter-at-bol</span> <span class="nv">indenter-at-eol</span><span class="p">))))</span></div><div class='line' id='LC548'><br/></div><div class='line' id='LC549'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-previous-line-is-comment</span> <span class="p">()</span></div><div class='line' id='LC550'>&nbsp;&nbsp;<span class="s">&quot;Returns `t&#39; if the previous line is a CoffeeScript comment.&quot;</span></div><div class='line' id='LC551'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">save-excursion</span></div><div class='line' id='LC552'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">forward-line</span> <span class="mi">-1</span><span class="p">)</span></div><div class='line' id='LC553'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">coffee-line-is-comment</span><span class="p">)))</span></div><div class='line' id='LC554'><br/></div><div class='line' id='LC555'><span class="p">(</span><span class="nf">defun</span> <span class="nv">coffee-line-is-comment</span> <span class="p">()</span></div><div class='line' id='LC556'>&nbsp;&nbsp;<span class="s">&quot;Returns `t&#39; if the current line is a CoffeeScript comment.&quot;</span></div><div class='line' id='LC557'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">save-excursion</span></div><div class='line' id='LC558'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">backward-to-indentation</span> <span class="mi">0</span><span class="p">)</span></div><div class='line' id='LC559'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nb">= </span><span class="p">(</span><span class="nf">char-after</span><span class="p">)</span> <span class="p">(</span><span class="nf">string-to-char</span> <span class="s">&quot;#&quot;</span><span class="p">))))</span></div><div class='line' id='LC560'><br/></div><div class='line' id='LC561'><span class="c1">;;</span></div><div class='line' id='LC562'><span class="c1">;; Define Major Mode</span></div><div class='line' id='LC563'><span class="c1">;;</span></div><div class='line' id='LC564'><br/></div><div class='line' id='LC565'><span class="c1">;;;###autoload</span></div><div class='line' id='LC566'><span class="p">(</span><span class="nf">define-derived-mode</span> <span class="nv">coffee-mode</span> <span class="nv">fundamental-mode</span></div><div class='line' id='LC567'>&nbsp;&nbsp;<span class="s">&quot;coffee-mode&quot;</span></div><div class='line' id='LC568'>&nbsp;&nbsp;<span class="s">&quot;Major mode for editing CoffeeScript...&quot;</span></div><div class='line' id='LC569'><br/></div><div class='line' id='LC570'>&nbsp;&nbsp;<span class="c1">;; key bindings</span></div><div class='line' id='LC571'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">coffee-mode-map</span> <span class="p">(</span><span class="nf">kbd</span> <span class="s">&quot;A-r&quot;</span><span class="p">)</span> <span class="ss">&#39;coffee-compile-buffer</span><span class="p">)</span></div><div class='line' id='LC572'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">coffee-mode-map</span> <span class="p">(</span><span class="nf">kbd</span> <span class="s">&quot;A-R&quot;</span><span class="p">)</span> <span class="ss">&#39;coffee-compile-region</span><span class="p">)</span></div><div class='line' id='LC573'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">coffee-mode-map</span> <span class="p">(</span><span class="nf">kbd</span> <span class="s">&quot;A-M-r&quot;</span><span class="p">)</span> <span class="ss">&#39;coffee-repl</span><span class="p">)</span></div><div class='line' id='LC574'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">coffee-mode-map</span> <span class="err">[</span><span class="nv">remap</span> <span class="nv">comment-dwim</span><span class="err">]</span> <span class="ss">&#39;coffee-comment-dwim</span><span class="p">)</span></div><div class='line' id='LC575'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">coffee-mode-map</span> <span class="s">&quot;\C-m&quot;</span> <span class="ss">&#39;coffee-newline-and-indent</span><span class="p">)</span></div><div class='line' id='LC576'><br/></div><div class='line' id='LC577'>&nbsp;&nbsp;<span class="c1">;; code for syntax highlighting</span></div><div class='line' id='LC578'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">font-lock-defaults</span> <span class="o">&#39;</span><span class="p">((</span><span class="nf">coffee-font-lock-keywords</span><span class="p">)))</span></div><div class='line' id='LC579'><br/></div><div class='line' id='LC580'>&nbsp;&nbsp;<span class="c1">;; perl style comment: &quot;# ...&quot;</span></div><div class='line' id='LC581'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">modify-syntax-entry</span> <span class="nv">?</span><span class="o">#</span> <span class="s">&quot;&lt; b&quot;</span> <span class="nv">coffee-mode-syntax-table</span><span class="p">)</span></div><div class='line' id='LC582'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">modify-syntax-entry</span> <span class="nv">?</span><span class="err">\</span><span class="nv">n</span> <span class="s">&quot;&gt; b&quot;</span> <span class="nv">coffee-mode-syntax-table</span><span class="p">)</span></div><div class='line' id='LC583'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">make-local-variable</span> <span class="ss">&#39;comment-start</span><span class="p">)</span></div><div class='line' id='LC584'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">comment-start</span> <span class="s">&quot;#&quot;</span><span class="p">)</span></div><div class='line' id='LC585'><br/></div><div class='line' id='LC586'>&nbsp;&nbsp;<span class="c1">;; single quote strings</span></div><div class='line' id='LC587'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">modify-syntax-entry</span> <span class="nv">?</span><span class="o">&#39;</span> <span class="s">&quot;\&quot;&quot;</span> <span class="nv">coffee-mode-syntax-table</span><span class="p">)</span></div><div class='line' id='LC588'><br/></div><div class='line' id='LC589'>&nbsp;&nbsp;<span class="c1">;; indentation</span></div><div class='line' id='LC590'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">make-local-variable</span> <span class="ss">&#39;indent-line-function</span><span class="p">)</span></div><div class='line' id='LC591'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">indent-line-function</span> <span class="ss">&#39;coffee-indent-line</span><span class="p">)</span></div><div class='line' id='LC592'><br/></div><div class='line' id='LC593'>&nbsp;&nbsp;<span class="c1">;; imenu</span></div><div class='line' id='LC594'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">make-local-variable</span> <span class="ss">&#39;imenu-create-index-function</span><span class="p">)</span></div><div class='line' id='LC595'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">imenu-create-index-function</span> <span class="ss">&#39;coffee-imenu-create-index</span><span class="p">)</span></div><div class='line' id='LC596'><br/></div><div class='line' id='LC597'>&nbsp;&nbsp;<span class="c1">;; no tabs</span></div><div class='line' id='LC598'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">indent-tabs-mode</span> <span class="nv">nil</span><span class="p">)</span></div><div class='line' id='LC599'><br/></div><div class='line' id='LC600'>&nbsp;&nbsp;<span class="c1">;; hooks</span></div><div class='line' id='LC601'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">set</span> <span class="p">(</span><span class="nf">make-local-variable</span> <span class="ss">&#39;before-save-hook</span><span class="p">)</span> <span class="ss">&#39;coffee-before-save</span><span class="p">))</span></div><div class='line' id='LC602'><br/></div><div class='line' id='LC603'><span class="p">(</span><span class="nf">provide</span> <span class="ss">&#39;coffee-mode</span><span class="p">)</span></div><div class='line' id='LC604'><br/></div><div class='line' id='LC605'><span class="c1">;;</span></div><div class='line' id='LC606'><span class="c1">;; On Load</span></div><div class='line' id='LC607'><span class="c1">;;</span></div><div class='line' id='LC608'><br/></div><div class='line' id='LC609'><span class="c1">;; Run coffee-mode for files ending in .coffee.</span></div><div class='line' id='LC610'><span class="c1">;;;###autoload</span></div><div class='line' id='LC611'><span class="p">(</span><span class="nf">add-to-list</span> <span class="ss">&#39;auto-mode-alist</span> <span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;\\.coffee$&quot;</span> <span class="o">.</span> <span class="nv">coffee-mode</span><span class="p">))</span></div><div class='line' id='LC612'><span class="c1">;;;###autoload</span></div><div class='line' id='LC613'><span class="p">(</span><span class="nf">add-to-list</span> <span class="ss">&#39;auto-mode-alist</span> <span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;Cakefile&quot;</span> <span class="o">.</span> <span class="nv">coffee-mode</span><span class="p">))</span></div><div class='line' id='LC614'><br/></div></pre></div>
              
            
          </td>
        </tr>
      </table>
    
  </div>


          </div>
        </div>
      </div>
    </div>
  

  </div>


<div class="frame frame-loading" style="display:none;">
  <img src="https://d3nwyuy0nl342s.cloudfront.net/images/modules/ajax/big_spinner_336699.gif" height="32" width="32">
</div>

    </div>
  
      
    </div>

    <div id="footer" class="clearfix">
      <div class="site">
        <div class="sponsor">
          <a href="http://www.rackspace.com" class="logo">
            <img alt="Dedicated Server" height="36" src="https://d3nwyuy0nl342s.cloudfront.net/images/modules/footer/rackspace_logo.png?v2" width="38" />
          </a>
          Powered by the <a href="http://www.rackspace.com ">Dedicated
          Servers</a> and<br/> <a href="http://www.rackspacecloud.com">Cloud
          Computing</a> of Rackspace Hosting<span>&reg;</span>
        </div>

        <ul class="links">
          <li class="blog"><a href="https://github.com/blog">Blog</a></li>
          <li><a href="/login/multipass?to=http%3A%2F%2Fsupport.github.com">Support</a></li>
          <li><a href="https://github.com/training">Training</a></li>
          <li><a href="http://jobs.github.com">Job Board</a></li>
          <li><a href="http://shop.github.com">Shop</a></li>
          <li><a href="https://github.com/contact">Contact</a></li>
          <li><a href="http://develop.github.com">API</a></li>
          <li><a href="http://status.github.com">Status</a></li>
        </ul>
        <ul class="sosueme">
          <li class="main">&copy; 2011 <span id="_rrt" title="0.08473s from fe4.rs.github.com">GitHub</span> Inc. All rights reserved.</li>
          <li><a href="/site/terms">Terms of Service</a></li>
          <li><a href="/site/privacy">Privacy</a></li>
          <li><a href="https://github.com/security">Security</a></li>
        </ul>
      </div>
    </div><!-- /#footer -->

    
      
      
        <!-- current locale:  -->
        <div class="locales instapaper_ignore readability-footer">
          <div class="site">

            <ul class="choices clearfix limited-locales">
              <li><span class="current">English</span></li>
              
                  <li><a rel="nofollow" href="?locale=de">Deutsch</a></li>
              
                  <li><a rel="nofollow" href="?locale=fr">Français</a></li>
              
                  <li><a rel="nofollow" href="?locale=ja">日本語</a></li>
              
                  <li><a rel="nofollow" href="?locale=pt-BR">Português (BR)</a></li>
              
                  <li><a rel="nofollow" href="?locale=ru">Русский</a></li>
              
                  <li><a rel="nofollow" href="?locale=zh">中文</a></li>
              
              <li class="all"><a href="#" class="minibutton btn-forward js-all-locales"><span><span class="icon"></span>See all available languages</span></a></li>
            </ul>

            <div class="all-locales clearfix">
              <h3>Your current locale selection: <strong>English</strong>. Choose another?</h3>
              
              
                <ul class="choices">
                  
                      <li><a rel="nofollow" href="?locale=en">English</a></li>
                  
                      <li><a rel="nofollow" href="?locale=af">Afrikaans</a></li>
                  
                      <li><a rel="nofollow" href="?locale=be">Беларуская</a></li>
                  
                      <li><a rel="nofollow" href="?locale=ca">Català</a></li>
                  
                      <li><a rel="nofollow" href="?locale=cs">Čeština</a></li>
                  
                </ul>
              
                <ul class="choices">
                  
                      <li><a rel="nofollow" href="?locale=de">Deutsch</a></li>
                  
                      <li><a rel="nofollow" href="?locale=es">Español</a></li>
                  
                      <li><a rel="nofollow" href="?locale=fr">Français</a></li>
                  
                      <li><a rel="nofollow" href="?locale=hr">Hrvatski</a></li>
                  
                      <li><a rel="nofollow" href="?locale=hu">Magyar</a></li>
                  
                </ul>
              
                <ul class="choices">
                  
                      <li><a rel="nofollow" href="?locale=id">Indonesia</a></li>
                  
                      <li><a rel="nofollow" href="?locale=it">Italiano</a></li>
                  
                      <li><a rel="nofollow" href="?locale=ja">日本語</a></li>
                  
                      <li><a rel="nofollow" href="?locale=nl">Nederlands</a></li>
                  
                      <li><a rel="nofollow" href="?locale=no">Norsk</a></li>
                  
                </ul>
              
                <ul class="choices">
                  
                      <li><a rel="nofollow" href="?locale=pl">Polski</a></li>
                  
                      <li><a rel="nofollow" href="?locale=pt-BR">Português (BR)</a></li>
                  
                      <li><a rel="nofollow" href="?locale=ru">Русский</a></li>
                  
                      <li><a rel="nofollow" href="?locale=sr">Српски</a></li>
                  
                      <li><a rel="nofollow" href="?locale=sv">Svenska</a></li>
                  
                </ul>
              
                <ul class="choices">
                  
                      <li><a rel="nofollow" href="?locale=zh">中文</a></li>
                  
                </ul>
              
            </div>

          </div>
          <div class="fade"></div>
        </div>
      
    

    <script>window._auth_token = "438524a0d6ec9020f1996f6750218beb7488a9a1"</script>
    

<div id="keyboard_shortcuts_pane" class="instapaper_ignore readability-extra" style="display:none">
  <h2>Keyboard Shortcuts <small><a href="#" class="js-see-all-keyboard-shortcuts">(see all)</a></small></h2>

  <div class="columns threecols">
    <div class="column first">
      <h3>Site wide shortcuts</h3>
      <dl class="keyboard-mappings">
        <dt>s</dt>
        <dd>Focus site search</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>?</dt>
        <dd>Bring up this help dialog</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column middle" style='display:none'>
      <h3>Commit list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selected down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selected up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>t</dt>
        <dd>Open tree</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>p</dt>
        <dd>Open parent</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>c <em>or</em> o <em>or</em> enter</dt>
        <dd>Open commit</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column last" style='display:none'>
      <h3>Pull request list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selected down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selected up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>o <em>or</em> enter</dt>
        <dd>Open issue</dd>
      </dl>
    </div><!-- /.columns.last -->

  </div><!-- /.columns.equacols -->

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Issues</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selected down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selected up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>x</dt>
          <dd>Toggle select target</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open issue</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column middle">
        <dl class="keyboard-mappings">
          <dt>I</dt>
          <dd>Mark selected as read</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>U</dt>
          <dd>Mark selected as unread</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>e</dt>
          <dd>Close selected</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>y</dt>
          <dd>Remove selected from view</dd>
        </dl>
      </div><!-- /.column.middle -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>c</dt>
          <dd>Create issue</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Create label</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>i</dt>
          <dd>Back to inbox</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>u</dt>
          <dd>Back to issues</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>/</dt>
          <dd>Focus issues search</dd>
        </dl>
      </div>
    </div>
  </div>

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Network Graph</h3>
    <div class="columns equacols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt><span class="badmono">←</span> <em>or</em> h</dt>
          <dd>Scroll left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">→</span> <em>or</em> l</dt>
          <dd>Scroll right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↑</span> <em>or</em> k</dt>
          <dd>Scroll up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↓</span> <em>or</em> j</dt>
          <dd>Scroll down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Toggle visibility of head labels</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">←</span> <em>or</em> shift h</dt>
          <dd>Scroll all the way left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">→</span> <em>or</em> shift l</dt>
          <dd>Scroll all the way right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↑</span> <em>or</em> shift k</dt>
          <dd>Scroll all the way up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↓</span> <em>or</em> shift j</dt>
          <dd>Scroll all the way down</dd>
        </dl>
      </div><!-- /.column.last -->
    </div>
  </div>

  <div >
    <div class="rule"></div>

    <h3>Source Code Browsing</h3>
    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Activates the file finder</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Jump to line</dd>
        </dl>
      </div>
    </div>
  </div>

</div>
    

    <!--[if IE 8]>
    <script type="text/javascript" charset="utf-8">
      $(document.body).addClass("ie8")
    </script>
    <![endif]-->

    <!--[if IE 7]>
    <script type="text/javascript" charset="utf-8">
      $(document.body).addClass("ie7")
    </script>
    <![endif]-->

    
    <script type='text/javascript'></script>
    
  </body>
</html>

