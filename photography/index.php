<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <title>graysky | photography</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta http-equiv="imagetoolbar" content="false">
  <meta name="description" content="Phography portfolio of Mike Champion">
  <meta name="keywords" content="photography">
	<link href="galleria.css" rel="stylesheet" type="text/css" media="screen">
	<script type="text/javascript" src="jquery.min.js"></script>
	<script type="text/javascript" src="jquery.galleria.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		$('.portfolio_unstyled').addClass('portfolio'); // adds new class name to maintain degradability
		
		$('ul.portfolio').galleria({
			history   : true, // activates the history object for bookmarking, back-button etc.
			clickNext : true, // helper for making the image clickable
			insert    : '#main_image', // the containing selector for our main image
			onImage   : function(image, caption, thumb) {
			  
			  $('#loading').css('display', 'none');
			  
			  // Prevent double-flickering if image is already loaded
			  if ($.galleria.current === image.attr('src')) {
			    return;
			  }
			  
				// fade in the image & caption
				image.css('display','none').fadeIn(500);
				caption.css('display','none').fadeIn(500);
				
				// fetch the thumbnail container
				var _li = thumb.parents('li');
				
				// fade out inactive thumbnail
				_li.siblings().children('img.selected').fadeTo(500, 0.3);
				
				// fade in active thumbnail
				thumb.fadeTo('fast', 1).addClass('selected');
				
				// add a title for the clickable image
				image.attr('title','Next Image >>');
			},
			onThumb : function(thumb) { // thumbnail effects goes here
				
				// fetch the thumbnail container
				var _li = thumb.parents('li');
				
				// if thumbnail is active, fade all the way.
				var _fadeTo = _li.is('.active') ? '1' : '0.3';
				
				// fade in the thumbnail when finnished loading
				thumb.css({display:'none',opacity:_fadeTo}).fadeIn(500);
				
				// hover effects
				thumb.hover(
					function() { thumb.fadeTo('fast', 1); },
					function() { _li.not('.active').children('img').fadeTo('fast',0.3); } // don't fade out if the parent is active
				)
			}
		});
	});
	</script>
</head>
<body>
<h2><a href="/photography/">graysky | photography</a></h2>
<div class="container">
  <div id="loading"><p style="font-family: helvetica;">Loading...<br /<br /><img src="loading.gif"></p></div>
  <div id="main_image"></div>

  <p class="nav"><a href="#" onclick="$.galleria.prev(); return false;">&laquo; previous</a> | <a href="#" onclick="$.galleria.next(); return false;">next &raquo;</a></p>

  <ul class="portfolio_unstyled">
    <?php
       $active = " class='active'";
     
       // Read photo order from file.
       $handle = fopen("photo_order.txt", 'r');
     
       if ($handle) {
           $i = 0;
           while (!feof($handle)) {
               
               $pic_name = trim(fgets($handle));

               if (strlen($pic_name) > 0 && !strrchr($pic_name, "#")) {
                 $path = "/photography/images/$pic_name";
                 
                 // Hack for asset hosts
                 if ($_SERVER['SERVER_NAME'] == "graysky.org") {
                   $i = $i + 1;
                   $host = $i % 5;
                   $path = "http://files$host.graysky.org$path";
                 }
                 
                 echo "<li id='$pic_name' " . $active . "><img src='$path'></li>\n";
                 $active = "";
               }
           }
           fclose($handle);
       }
  ?>
  </ul>
  <p style="clear:both">&nbsp;</p>
</div>

<div class="info">
  <p>
    <a href="/">graysky.org</a> <span style="margin-left: 500px;">copyright - <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/">creative commons (by-nc-sa)</a></span>
  </p>
</div>

<!--  Google Analytics tracker -->
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-287373-2");
pageTracker._trackPageview();
} catch(err) {}</script>

</body>
</html>
