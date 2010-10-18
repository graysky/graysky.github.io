// Collection of helpers

var allVersion = navigator.appVersion.split("MSIE")
var ieVersion = parseFloat(allVersion[1])
// PNG fix for IE that stops the flashing during loading. Used explicitly on the noticable PNGs.
// http://homepage.ntlworld.com/bobosola/pnginfo.htm#trouble
function fixPNG(myImage) 
{
        if ((ieVersion >= 5.5) && (ieVersion < 7) && (document.body.filters)) 
    {
                var imgID = (myImage.id) ? "id='" + myImage.id + "' " : "";
                var imgClass = (myImage.className) ? "class='" + myImage.className + "' " : "";
                var imgTitle = (myImage.title) ? 
                             "title='" + myImage.title  + "' " : "title='" + myImage.alt + "' ";
                var imgStyle = "display:inline-block;" + myImage.style.cssText
                var strNewHTML = "<span " + imgID + imgClass + imgTitle
                  + " style=\"" + "width:" + myImage.width 
                  + "px; height:" + myImage.height 
                  + "px;" + imgStyle + ";"
                  + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
                  + "(src=\'" + myImage.src + "\', sizingMethod='image');\"></span>" // MGC: changed from "scale"
                myImage.outerHTML = strNewHTML    
    }
}

// Write out contact line
function get_contact_sig() {
  document.write(get_contact_email() );
}

// Hide email address a bit
function get_contact_email() {
   var a = "mike";
   var b = "graysky";
   var c = ".org";
   return "<a href=mailto:"+a+"@"+b+c+">"+a+"@"+b+c+"</a>";
}

// Hide email address a bit
function get_contact_email_link() {
   var a = "mike";
   var b = "graysky";
   var c = ".org";
   return "<a href=mailto:"+a+"@"+b+c+">";
}

// Pic a random picture
function pic_thumbnail() {
	var pics = new Array();
	pics[0] = "/images/thumbnails/charles_t.jpg";
	pics[1] = "/images/thumbnails/mit_dorm.jpg";
	pics[2] = "/images/thumbnails/macallen_building.jpg";
	var choice = Math.floor(Math.random() * pics.length);
	var img_tag = "<img src=" + pics[choice] + " style='border: 1px solid black;'>";
	document.write(img_tag);
}

// pass in the 'created_at' string returned from twitter
// stamp arrives formatted as Tue Apr 07 22:52:51 +0000 2009
// http://www.quietless.com/kitchen/format-twitter-created_at-date-with-javascript/
function parseTwitterDate(stamp) {		
	var newtext = stamp.replace(/(\+\S+) (.*)/, '$2 $1');
	var date = new Date(Date.parse(newtext)).toLocaleDateString();
	var time = new Date(Date.parse(newtext)).toLocaleTimeString();
	return date + ' ' + time;
}

function twitterCallback2(twitters) {
  var statusHTML = [];
  for (var i=0; i<twitters.length; i++){
    var username = twitters[i].user.screen_name;
    var status = twitters[i].text.replace(/((https?|s?ftp|ssh)\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g, function(url) {
      return '<a href="'+url+'">'+url+'</a>';
    }).replace(/\B@([_a-z0-9]+)/ig, function(reply) {
      return  reply.charAt(0)+'<a href="http://twitter.com/'+reply.substring(1)+'">'+reply.substring(1)+'</a>';
    });
    statusHTML.push('<li><span style="font-size: 97%;">'+status+'</span> <br /><a style="font-size:85%" href="http://twitter.com/'+username+'/statuses/'+twitters[i].id+'">'+relative_time(twitters[i].created_at)+'</a></li>');
  }
  document.getElementById('twitter_update_list').innerHTML = statusHTML.join('');
}

function relative_time(time_value) {
  var values = time_value.split(" ");
  time_value = values[1] + " " + values[2] + ", " + values[5] + " " + values[3];
  var parsed_date = Date.parse(time_value);
  var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
  var delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
  delta = delta + (relative_to.getTimezoneOffset() * 60);

  if (delta < 60) {
    return 'less than a minute ago';
  } else if(delta < 120) {
    return 'about a minute ago';
  } else if(delta < (60*60)) {
    return (parseInt(delta / 60)).toString() + ' minutes ago';
  } else if(delta < (120*60)) {
    return 'about an hour ago';
  } else if(delta < (24*60*60)) {
    return 'about ' + (parseInt(delta / 3600)).toString() + ' hours ago';
  } else if(delta < (48*60*60)) {
    return '1 day ago';
  } else {
    return (parseInt(delta / 86400)).toString() + ' days ago';
  }
}