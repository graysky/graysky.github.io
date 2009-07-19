--- 
wordpress_id: 145
title: Ugly vs. Pretty Permalink URLs
wordpress_url: http://208.75.86.216/?p=145
layout: post
---
At times SEO seems like a dark art, but some improvements are simple. When setting up this Wordpress blog, one of the first things I did was change the <a href="http://codex.wordpress.org/Using_Permalinks">permalink structure</a> from the default permalinks (like <code>/?p=123</code>) to include a slug in the URL (like <code>&lt;something&gt;/jruby-support-for-rails/</code>). Unfortunately for WordPress the more expressive URLs don't work in all environments, and so aren't the default. Search engines give a fair amount of weight to the words in URLs when deciding the relevance of the page. Sites that search engines drive traffic to <a href="http://www.tripadvisor.com/Hotel_Review-g60745-d321151-Reviews-Jurys_Boston_Hotel-Boston_Massachusetts.html">tend to have long URLs</a> that <a href="http://www.google.com/search?q=Jurys+Boston+Hotel">rank highly on Google</a>.  

Rails developers have <a href="http://weblog.rubyonrails.org/2007/2/4/how-to-get-more-literal-urls-and-still-use-ids">taken notice recently</a> and <a href="http://jroller.com/page/obie?entry=seo_optimization_of_urls_in">documented techniques</a> for how to <a href="http://www.seoonrails.com/even-better-looking-urls-with-permalink_fu">fit SEO-friendly URLs</a> into the existing routing mechanism. The more descriptive, "ugly", URL style leads to URLs that, while <a href="http://wiki.rubyonrails.org/rails/pages/PrettyURLs">stable and perhaps readable</a>, are not pronounceable nor easily memorable. So while <code>/blog/post/15</code> might look cleaner and "prettier", what does it matter if no one finds your site? I've fallen for this trap in the past, but now I get that being ugly sometimes has better <a href="http://www.jwz.org/doc/worse-is-better.html">survival characteristics</a> than being pretty.

