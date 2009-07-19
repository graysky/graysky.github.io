--- 
wordpress_id: 601
title: Proxying a Subdomain in Apache
wordpress_url: http://graysky.org/?p=601
layout: post
---
I recently moved a project to the latest & greatest in Rails deployment configurations, <a href="http://www.modrails.com">mod_rails</a>. Overall I've pleased with simplicity of the setup, the memory savings and tools like <code>passenger-memory-stats</code>, especially for a <a href="http://whoshouldifollow.com/">small project</a> on a not-too-beefy instance. With mod_rails comes Apache, which can do everything. But, perhaps for that exact reason, it can be more complicated to do the simple things than with <a href="http://www.lighttpd.net/">lighty</a> or <a href="http://wiki.codemongers.com/Main">nginx</a>. The answer is often to use <a href="http://httpd.apache.org/docs/2.0/mod/mod_rewrite.html">mod_rewrite</a> which is like a Swiss Army knife -- but have you ever tried to cut anything with the saw on that thing? Not so easy.

That is a long way of saying it took me longer than I thought it should have to figure out to proxy a certain request in Apache. I'm not an Apache expert, so maybe someone will point a better way of doing this (which would be great). Since it took me much googling and experimenting, I thought I'd post this for the next person to come along.

My setup has a main site running Rails on the primary domain, say "foo.com", and a subdomain, "sub.foo.com", that proxies to a backend server running Jetty. The responses from Jetty should go directly to the client. Here's the section from my httpd.conf that makes it happen:

<pre lang="bash">
<VirtualHost *:80>
  # usual setup for Rails ...
  ServerName foo.com
  ServerAlias www.foo.com
  DocumentRoot /var/www/foo/current/public
 
  # Proxy requests to sub.foo.com to Jetty running locally
  #
  # typically turned off for reverse proxy according to apache docs
  ProxyRequests Off
  # If turned off, url written in browser to "http://localhost:9091/blah"
  ProxyPreserveHost On
  
  <Proxy>
     Order deny,allow
     Allow from localhost
  </Proxy>

  RewriteEngine   on
  
  # Rewrite requests if domain matches. 
  RewriteCond %{HTTP_HOST} ^sub\.foo\.com$
  # Forward entire request URI to server. The "[P]" is for proxy!
  RewriteRule (.*) http://localhost:9091$1 [P]
</VirtualHost>
</pre>
