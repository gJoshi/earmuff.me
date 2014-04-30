<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'sidenav.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Shadows+Into+Light' rel='stylesheet' type='text/css'>
        <g:javascript library="jquery" plugin="jquery"/>

        <g:layoutHead/>
        <r:layoutResources />
    </head>
    <body>
        <div class="container">
            <div id="sidebar">
                <ul>
                    <li><a>Sign Out</a></li>
                    <li><a>Trending</a></li>
                    <li><a href="#">Groups</a></li>
                    <li></li>
                </ul>
            </div>
            <div class="main-content">
                <div id="swipe-area">
                    <ul>
                        <li><a href="#" style="padding: 0px;"><img style="width: 50px; height: 50px; margin: 0px 0px 2px 0px; padding: 0px;" src="${resource(dir: 'images', file: 'profile.png')}"/></a></li>
                        <li><a href="#"><img src="${resource(dir: 'images', file: 'business32.png')}"/></a></li>
                        <li><a href="#"><img src="${resource(dir: 'images', file: 'group.png')}"/></a></li>
                        <li><a href="#" data-toggle=".container" id="sidebar-toggle"><img src="${resource(dir: 'images', file: 'share20.png')}"/></a> </li>
                    </ul>
                    <div class="logo">Earmuff.me</div>
                </div>
                <div class="content">
                    <g:layoutBody/>
                </div>
            </div>
        </div>

        <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
        <g:javascript library="application"/>
        <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js', file: 'swipe.min.js')}" type="text/javascript"></script>

        <script>
            $(document).ready(function() {
              $("[data-toggle]").click(function() {
                var toggle_el = $(this).data("toggle");
                $(toggle_el).toggleClass("open-sidebar");
              });

            });

            $("#swipe-area").swipe({
                swipeStatus:function(event, phase, direction, distance, duration, fingers)
                    {
                        if (phase=="move" && direction =="right") {
                             $(".container").addClass("open-sidebar");
                             return false;
                        }
                        if (phase=="move" && direction =="left") {
                             $(".container").removeClass("open-sidebar");
                             return false;
                        }
                    }
            });
        </script>
        <r:layoutResources />
    </body>
</html>
