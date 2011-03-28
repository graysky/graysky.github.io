--- 
wordpress_id: 286
title: Styling Feeds for Feed Readers
wordpress_url: http://graysky.org/2008/02/styling-atom-feeds-css/
layout: post
categories: [code]
---
Perhaps there is a reasonable way to style feeds so that text with images doesn't look terrible in feed readers. And by reasonable I don't include writing a <a href="http://www.ibm.com/developerworks/web/library/x-wxxm37.html">boatload of XSL</a> to transform an Atom feed. I checked out this site's feed in <a href="http://www.bloglines.com">Bloglines</a> and was disappointed to see an ugly, blue 1px border around my images. (Oh, remember the times we had together Bloglines? You taught me about feed reading, and then I left you for Google Reader v2. We'll always have <a href="http://scripting.com/">Scripting News</a>.) Of course, putting all CSS styling inline is a non-starter. There should be a simple way to float some images around text, and pretty up how many people interact with websites in these modern times. That's not too much to ask, right?

The best I've found so far is a Wordpress plugin called <a href="http://www.devlounge.net/extras/feed-styler">Feed Styler</a> that takes some CSS rules (put into WP, not a css file) and <a href="http://www.raproject.com/articles/from-the-perspective-of-a-feed-reader/">inserts them inline</a> into the WP feed. Does the trick, even if it isn't a general solution.
