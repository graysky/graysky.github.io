--- 
title: Blog Redesign
layout: post
categories: [personal]
published: true
---

<div class="flickr-frame"><a href="http://www.flickr.com/photos/downtree/8746791846/"><img src="/images/eiffeltower.jpg" class="flickr-photo" /></a></div>

Last week I decided to update the design on this (rarely updated) blog for a few reasons:

<ol start="0">
<li>Changing the design is fun, and often easier than <em>actually writing</em>.</li>

<li>I wanted a mobile-friendly, single column layout. I read a lot on mobile/tablet and a lot of sites/blogs format poorly.</li>

<li>In the last couple years I've come to really like photos shown <strong>as large as possible</strong> regardless of medium. I think so many photo sites get this wrong. Recently <a href="http://bijansabet.com/post/58148517092/new-york-city">Bijan Sabet's photos</a> have been <a href="http://bijansabet.com/post/56416371167/reflections-of-gabriel-flores-new-york-city">particularly inspiring</a> to make this switch (as well as wanting to buy a Leica M240).
</ol>

To do that I overhauled my Jekyll-on-S3 blog (via <a href="http://iamnotaprogrammer.com/Jekyll-S3-Cloudfront-Aname-Root.html">this method</a>) to remove an old <a href="http://www.blueprintcss.org/">blueprint</a> grid system and replace it with a customized version of <a href="http://carlosbecker.com/posts/up-a-jekyll-theme/">"Up"</a>, a Bootstrap-based Jekyll theme. Overall it was 90% of what I wanted (clean, minimalist single column) although getting it just to my liking took some overriding of their built-in styles.

Specifically changed to a fluid layout with a max-width, and some padding on mobile/tablet (hat tip to <a href="http://jonathan-kim.com/">Jonathan</a>). I'm trusting the browser to scale the images (<code>max-width: 100%</code> ala <a href="http://stackoverflow.com/questions/4684304/how-can-i-resize-an-image-dynamically-with-css-as-the-browser-width-height-chang">this</a>) which seems to work well in relevant browsers. I took the above photo on a trip to Paris earlier this summer, and think it is much more interesting large. Then tested and tweaked it all using <a href="https://chrome.google.com/webstore/detail/responsiview/kcemonjjmilbiepahkhanlkddonpjlep">responsiView</a> to make sure it looked good on different resolutions.

Hopefully all of this will get me to actually finish more half-written drafts...