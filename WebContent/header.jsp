<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->

<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

<head>
    <meta charset="utf-8">

    <link rel="dns-prefetch" href="http://fonts.googleapis.com" />
    <link rel="dns-prefetch" href="http://themes.googleusercontent.com" />

    <link rel="dns-prefetch" href="http://ajax.googleapis.com" />
    <link rel="dns-prefetch" href="http://cdnjs.cloudflare.com" />
    <link rel="dns-prefetch" href="http://agorbatchev.typepad.com" />

    <!-- Use the .htaccess and remove these lines to avoid edge case issues.
       More info: h5bp.com/b/378 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>LMS Admin Panel</title>
    <meta name="description" content="slick and responsive Admin Template build with modern techniques like HTML5 and CSS3 to be used for backend solutions of any size.">
    
    <!-- Mobile viewport optimized: h5bp.com/viewport -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <!-- iPhone: Don't render numbers as call links -->
    <meta name="format-detection" content="telephone=no">

    <link rel="shortcut icon" href="favicon.ico" />
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory: mathiasbynens.be/notes/touch-icons -->
    <!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->

    <!-- The Styles -->
    <!-- ---------- -->

    <!-- Layout Styles -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/layout.css">

    <!-- Icon Styles -->
    <link rel="stylesheet" href="css/icons.css">
    <link rel="stylesheet" href="css/fonts/font-awesome.css">
    <!--[if IE 8]><link rel="stylesheet" href="css/fonts/font-awesome-ie7.css"><![endif]-->

    <!-- External Styles -->
    <link rel="stylesheet" href="css/external/jquery-ui-1.9.1.custom.css">
    <link rel="stylesheet" href="css/external/jquery.chosen.css">
    <link rel="stylesheet" href="css/external/jquery.cleditor.css">
    <link rel="stylesheet" href="css/external/jquery.colorpicker.css">
    <link rel="stylesheet" href="css/external/jquery.elfinder.css">
    <link rel="stylesheet" href="css/external/jquery.fancybox.css">
    <link rel="stylesheet" href="css/external/jquery.jgrowl.css">
    <link rel="stylesheet" href="css/external/jquery.plupload.queue.css">
    <link rel="stylesheet" href="css/external/syntaxhighlighter/shCore.css" />
    <link rel="stylesheet" href="css/external/syntaxhighlighter/shThemeDefault.css" />

    <!-- Elements -->
    <link rel="stylesheet" href="css/elements.css">
    <link rel="stylesheet" href="css/forms.css">

    <!-- OPTIONAL: Print Stylesheet for Invoice -->
    <link rel="stylesheet" href="css/print-invoice.css">

    <!-- Typographics -->
    <link rel="stylesheet" href="css/typographics.css">

    <!-- Responsive Design -->
    <link rel="stylesheet" href="css/media-queries.css">

    <!-- Bad IE Styles -->
    <link rel="stylesheet" href="css/ie-fixes.css">

    <!-- The Scripts -->
    <!-- ----------- -->

    <!-- JavaScript at the top (will be cached by browser) -->


    <!-- Grab frameworks from CDNs -->
        <!-- Grab jQuery from a CDN; fall back to local if offline -->
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/libs/jquery-1.10.2.min.js"><\/script>')</script>

        <!-- Do the same with jquery-migrate -->
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/libs/jquery-migrate-1.2.1.min.js"><\/script>')</script>

        <!-- Do the same with jQuery UI -->
    <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.min.js"></script>
    <script>window.jQuery.ui || document.write('<script src="js/libs/jquery-ui-1.9.1.min.js"><\/script>')</script>

        <!-- Do the same with Lo-Dash.js -->
    <!--[if gt IE 8]><!-->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/lodash.js/0.8.2/lodash.min.js"></script>
    <script>window._ || document.write('<script src="js/libs/lo-dash.min.js"><\/script>')</script>
    <!--<![endif]-->
    <!-- IE8 doesn't like lodash -->
    <!--[if lt IE 9]><script src="http://documentcloud.github.com/underscore/underscore.js"></script><![endif]-->

    <!-- Do the same with require.js -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/require.js/2.0.6/require.min.js"></script>
    <script>window.require || document.write('<script src="js/libs/require-2.0.6.min.js"><\/script>')</script>


    <!-- Load Webfont loader -->
    <script type="text/javascript">
        window.WebFontConfig = {
            google: { families: [ 'PT Sans:400,700' ] },
            active: function(){ $(window).trigger('fontsloaded') }
        };
    </script>
    <script defer async src="https://ajax.googleapis.com/ajax/libs/webfont/1.0.28/webfont.js"></script>

    <!-- Essential polyfills -->
    <script src="js/mylibs/polyfills/modernizr-2.6.1.min.js"></script>
    <script src="js/mylibs/polyfills/respond.js"></script>
    <script src="js/mylibs/polyfills/matchmedia.js"></script>
    <!--[if lt IE 9]><script src="js/mylibs/polyfills/selectivizr.js"></script><![endif]-->
    <!--[if lt IE 10]><script src="js/mylibs/polyfills/excanvas.js"></script><![endif]-->
    <!--[if lt IE 10]><script src="js/mylibs/polyfills/classlist.js"></script><![endif]-->


    <!-- scripts concatenated and minified via build script -->

    <!-- Scripts required everywhere -->
    <script src="js/mylibs/jquery.hashchange.js"></script>
    <script src="js/mylibs/jquery.idle-timer.js"></script>
    <script src="js/mylibs/jquery.plusplus.js"></script>
    <script src="js/mylibs/jquery.scrollTo.js"></script>
    <script src="js/mylibs/jquery.ui.touch-punch.js"></script>
    <script src="js/mylibs/jquery.ui.multiaccordion.js"></script>
    <script src="js/mylibs/number-functions.js"></script>
    <script src="js/mylibs/fullstats/jquery.css-transform.js"></script>
    <script src="js/mylibs/fullstats/jquery.animate-css-rotate-scale.js"></script>
    <script src="js/mylibs/forms/jquery.validate.js"></script>

    <!-- Do not touch! -->
    <script src="js/mango.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/script.js"></script>

    <!-- Your custom JS goes here -->
    <script src="js/app.js"></script>
    <!-- end scripts -->

</head>

<body>

    <!-- ----------------- -->
    <!-- Some dialogs etc. -->

    <!-- The loading box -->
    <div id="loading-overlay"></div>
    <div id="loading">
        <span>Loading...</span>
    </div>
    <!-- End of loading box -->

    <!-- The lock screen -->
    <div id="lock-screen" title="Screen Locked">

        <a href="login.html" class="header right button grey flat">Logout</a>

        <p>Due to the inactivity of this session, your account was temporarily locked.</p>
        <p>To unlock your account, simply slide the button and enter your password.</p>

        <div class="actions">
            <div id="slide_to_unlock">
                <img src="img/elements/slide-unlock/lock-slider.png" alt="slide me">
                <span>slide to unlock</span>
            </div>
            <form action="#" method="GET">
                <input type="password" name="pwd" id="pwd" placeholder="Enter your password here..." autocorrect="off" autocapitalize="off"> <input type="submit" name=send value="Unlock" disabled> <input type="reset" value="X">
            </form>
        </div><!-- End of .actions -->

    </div><!-- End of lock screen -->

    <!--------------------------------->
    <!-- Now, the page itself begins -->
    <!--------------------------------->

    <!-- The toolbar at the top -->
    <section id="toolbar">
        <div class="container_12">

            <!-- Left side -->
            <div class="left">
                <ul class="breadcrumb">
                    <li></li>
                </ul>
            </div>
            <!-- End of .left -->

            <!-- Right side -->
            <div class="right">
                <ul>

                    <li><a href=""><span class="icon i14_admin-user"></span>Profile</a></li>
                    <li>
                        <a href="#"><span>3</span>Messages</a>

                        <!-- Mail popup -->
                        <div class="popup">
                            <h3>New Messages</h3>

                            <!-- Button bar -->
                            <a class="button flat left grey" onclick="$(this).parent().fadeToggle($$.config.fxSpeed)">Close</a>
                            <a class="button flat right" href="tables_dynamic.html">Inbox</a>
                        </div><!-- End of .popup -->
                    </li><!-- End of li -->

                    <li class="space"></li>

                    <li><a href="javascript:void(0);" id="btn-lock"><span>--:--</span>Lock screen</a></li>

                    <li class="red"><a href="login.html">Logout</a></li>

                </ul>
            </div><!-- End of .right -->

            <!-- Phone only items -->
            <div class="phone">

                <!-- User Link -->
                <li><a href=""><span class="icon icon-user"></span></a></li>
                <!-- Navigation -->
                <li><a class="navigation" href="#"><span class="icon icon-list"></span></a></li>

            </div><!-- End of phone items -->

        </div><!-- End of .container_12 -->
    </section><!-- End of #toolbar -->

    <!-- The header containing the logo -->
    <header class="container_12">

        <!-- Your logos -->
        <a href="dashboard.html"><img src="img/logo-light.png" alt="" width="191" height="60"></a>
        <a class="phone-title" href="dashboard.html"><img src="img/logo-light.png" alt="" height="22" width="70" /></a>

        <div class="buttons">
            <a href="">
                <span class="icon icon-sitemap"></span>
                Sitemap
            </a>
			<a href="">
                <span class="icon icon-sitemap"></span>
                Help
            </a>
        </div><!-- End of .buttons -->
    </header><!-- End of header -->

    <!-- The container of the sidebar and content box -->
    <div role="main" id="main" class="container_12 clearfix">

        <!-- The blue toolbar stripe -->
        <section class="toolbar">
            <div class="user">
                <div class="avatar">
                    <img src="img/layout/content/toolbar/user/avatar.png">
                    <span>3</span>
                </div>
                <span>Administrator</span>
                <ul>
                    <li><a href="javascript:$$.settings();">Settings</a></li>
                    <li><a href="">Profile</a></li>
                    <li class="line"></li>
                    <li><a href="login.html">Logout</a></li>
                </ul>
            </div>
            <input type="search" data-source="extras/search.php" placeholder="Search..." autocomplete="off" class="tooltip" title="e.g. Peach" data-gravity=s>
        </section><!-- End of .toolbar-->
