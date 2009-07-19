--- 
wordpress_id: 304
title: Greasemonkey Tips
wordpress_url: http://graysky.org/2008/02/greasemonkey-tips/
layout: post
---
I've been working on a little <a href="http://www.greasespot.net/">Greasemonkey</a> hack recently and learned a few things I wish I knew at the outset:

<ul>

<li><a href="http://www.oreillynet.com/lpt/a/6257">Avoiding common Greasemonkey pitfalls</a> is worth reading. Pitfalls #3 and #4 are helpful reminders that DOM elements like <code>document</code> are wrapped in <code>XPCNativeWrapper</code> objects for Greasemonkey and need to be accessed differently than typical in Javascript code.

<li>With ECMAScript for XML (E4X) you <a href="http://mook.wordpress.com/2005/10/30/multi-line-strings-in-javascript/">can simulate HEREDOC in Javascript</a> which is great when blasting HTML or CSS. Having to escape strings and join multi-line strings is tedious.

<pre>
var s = (&lt;r&gt;&lt;![CDATA[
            #foo p { color: red; }
            #bar h1 { margin: 0px; }
            ]]&gt;&lt;/r&gt;).toString();

</pre>

FireFox 2 supports it, so who cares about IE? And that right there -- developing for a single, sane browser -- is the most fun part of GM scripting compared to most JS coding.

<li>My script displays some HTML regardless of the site it is run on. Unless you want to allow the underlying site's CSS to apply to your HTML, the best way is to use an <a href="http://wiki.greasespot.net/HTML_injection_tips">iframe to inject HTML</a>. That way when you <a href="http://diveintogreasemonkey.org/patterns/add-css.html">add CSS rules</a>, those will be the only ones affecting the layout.

One trick in conjunction with that is using the <a href="http://wiki.greasespot.net/Code_snippets#Waiting_for_something">"wait" function</a> to make sure the iframe has been truly loaded before manipulating the new iframe.

<li>Greasemonkey will run when the <a href="http://wiki.greasespot.net/DOMContentLoaded">DOMContentLoaded event</a> fires. On some AJAX heavy sites like Gmail or ones that include ads via javascript-created iframes like Digg, this can make it seem like your script is being called more than once for a visited URL. The original page can be distinguished from the iframe using:

<pre>
// Don't run on iframes
if(top != self) return;
</pre>

<li>Oh, and the <a href="http://www.squarefree.com/shell/">Javascript Shell</a> is fantastic for interactively inspecting the DOM (if launched from the FF bookmarklet). Great way to test your code dynamically.

<li>Lastly, the forthcoming <a href="http://groups.google.com/group/greasemonkey-users/browse_thread/thread/06e6d0eeefcbfb7d/cbde5d3a750430fb">Greasemonkey 0.8</a> has at least one killer feature -- "resources". Greasemonkey resources provide the ability to reference external images, css or javascript. I'm sure they must have heard this request a million times. And being able to easily include a JS library like <a href="http://jquery.com/">jQuery</a> or images will make GM scripting that much more enjoyable (although <a href="http://diveintogreasemonkey.org/patterns/add-image.html">data URIs are still cool</a>).

</ul>
