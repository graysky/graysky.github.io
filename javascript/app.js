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
  document.write("Email: " + get_contact_email() );
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
