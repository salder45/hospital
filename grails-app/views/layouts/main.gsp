<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>


    <title>Hospital</title>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript" charset="utf-8"></script>


    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'index.css')}" type="text/css">
    <script type="text/javascript" charset="utf-8">
    $(function(){
            $('#menu li a').click(function(event){
                    var elem = $(this).next();
                    if(elem.is('ul')){
                            event.preventDefault();
                            $('#menu ul:visible').not(elem).slideUp();
                            elem.slideToggle();
                    }
            });
    });
    </script>
    <style type="text/css" media="screen">
      #menu{
        border:195px;
        border:195px;
        border:195px;
        box:190px 190px 59px #888;
        box:190px 190px 59px #888;
      }
      #menu li{border-bottom:1px solid #FFF;}
      #menu ul li, #menu li:last-child{border:none}	
      a{
        display:block;
        color:#FFF;
        text-decoration:none;
        font-family:'Helvetica', Arial, sans-serif;
        font-size:17px;
        padding:3px 5px;
        text-shadow:1px 1px 1px #325179;
      }
      #menu a:hover{
        color:#F9B855;
        -webkit-transition: color 0.2s linear;
      }
      #menu ul a{background-color:#6594D1;}
      #menu ul a:hover{
        background-color:#FFF;
        color:#2961A9;
        text-shadow:none;
        -webkit-transition: color, background-color 0.2s linear;
      }
      ul{
        display:block;
        background-color:#2961A9;
        margin:0;
        padding:0;
        width:199px;
        list-style:none;
      }
      #menu ul{background-color:#6594D1;}
      #menu li ul {display:none;}
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <r:layoutResources/>
  <g:layoutHead/>
</head>
<body>
  <div id="mast_container">
    <div id="masthead">

    </div>
    <!--Top Container begins here-->
    <div class="top_container">

      <div id="top_left_col">

        <div id="header">
          <g:render template="/common/header"/>  
        </div>

      </div>
      <div id="top_page_content">

        
        <div align ="center">

          <div id="page-body" role="main">
            <div id="wrapper">

              <g:layoutBody/>


            </div>
</div>
<!--Top Container ends here-->

<!--Bottom Container begins here-->
<div class="bot_container">
<div id="bot_left_col">



</div>
<!--Bottom Container ends here-->

<!--Footer begins here-->
<div id="footer">

<hr id="bluehr"/>
<div id="credit">

</div>
</div>
<!--Footer ends here-->
</div>
<!--Master container for the page ends here-->




<br>  
<br>  
<br>




<r:layoutResources/>
<g:javascript library="application"/>
</body>
</html>
