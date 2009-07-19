--- 
wordpress_id: 803
title: Dynamically Loading Javascript
wordpress_url: http://graysky.org/?p=803
layout: post
---
Recently I added a few ads to <a href="http://whoshouldifollow.com">WhoShouldiFollow</a> to cover our hosting costs and ran into a Javascript issue I hadn't hit before. Specifically, trying to dynamically load a third party script that uses <tt>document.write</tt> to add HTML to the DOM was <b>erasing the whole page</b>! I found a (slightly-evil) solution after much hacking around and no luck finding anything similar in Google. Hopefully there is a cleaner solution out there, but thought I'd write up my fix.

The way that the ad network supplies the ad is for publishers to include a short snippet like this:

<pre lang="html">
&lt;script src="http://thirdparty.com/ad.js" type="text/javascript"&gt;&lt;/script&gt;
</pre>

Within the ad javascript it does something like this (simplified for this example):
<pre lang="javascript">
document.write("<b>Click on this ad!</b>");
</pre>

Nice and simple to drop in to HTML, but our results page is built dynamically from an AJAX call that fetches JSON. At first I thought I could just built a new script tag and append it to the div I wanted, but that resulted in a blank page with just the ad in the DOM. I'm assuming that without an enclosing context that the <tt>document.write</tt> is overwriting the root html node.

Instead what worked was to temporarily override <tt>document.write</tt> just before the ad is loaded and write the content of the ad into the DOM where I wanted. This works, but feels a bit evil. I'd be interested in finding a prettier solution than this.

<pre lang="javascript">
var original_write = document.write;

// Re-assign doc.write while the ad is loaded.
document.write = function(ad_html) {
  // Append the contents of the ad to a special div.
  $('#my_ad_row').append(ad_html);

  // restore original write
  document.write = original_write; 
}
  
// Create a script element in the DOM to load the ad.
var e = document.createElement("script");
e.src = "http://thirdparty.com/ad.js";
e.type="text/javascript";
document.getElementsByTagName("head")[0].appendChild(e);
</pre>
