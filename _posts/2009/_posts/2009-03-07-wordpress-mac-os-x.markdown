--- 
title: Wordpress on OS X
layout: post
categories: [code]
---
This here blog just got a facelift. The design had been feeling too busy and I wanted something cleaner and simpler. It remains to be seen whether this change will lead to me <em>actually</em> posting more often. As part of creating a new theme I decided to setup a copy of my blog on my Mac for easier developing. The live version is hosted on an Ubuntu slice which makes it hard to easily edit, as well as <a href="http://wordpress.org/">Wordpress</a> only supporting one active theme at a time. And my blog has enough cruft that I wanted to test the new theme with real data, not just <em>lorem ipsum</em> filler. These are the steps I followed to get it working, including a few wrinkles to be worked around:
<ul>

<li>All the assets are stored in Git -- source control is your friend, after all. I cloned the git repo to <tt>~/Sites/graysky</tt> where the stock OS X version of Apache will pick it up. To have Apache process the <tt>.htaccess</tt> files that Wordpress typically uses I had to change 2 lines in <tt>httpd.conf</tt>. For both Directory "/" and "/Library/WebServer/Documents" the <tt>AllowOverride None</tt> option needs to be changed to <tt>AllowOverride All</tt>. Next, in the users folder I edited my personal conf file with an entry like this to set up my site to respond to requests for "graysky.test" (more on that next.)

<pre lang="bash">
<VirtualHost *:80>
  Options FollowSymLinks
  ServerName graysky.test 
  DocumentRoot /Users/mchampion/Sites/graysky
</VirtualHost>
</pre>

<li>Open <tt>/etc/hosts</tt> and a line to map 127.0.0.1 to "graysky.test". While it should work through using just an IP, I've found Wordpress works better if there is a true domain to match how it is configured. Make sure Apache is restarted through the command line or enabling "Web Sharing" in Preferences. Apache should now be ready to serve Wordpress locally.

<li>Next, on the production site I took a backup of the MySQL database using something like <tt>mysqldump --add-drop-table > blog.sql</tt> and stored the .sql file in git as well for save keeping. Before importing it, I opened it and did a blog replace of "graysky.org" with "graysky.test" for the local environment. While it should be possible to change the domain name from Wordpress itself, I found it was troublesome because it kept redirecting me to the actual "graysky.org" since that is what it thought it was serving. Finally import the sql file into MySQL after creating the correct database and appropriate user with privileges. 

The last hurdle was changing <tt>wp-config.php</tt> to handle a difference in where PHP-MySQL searches for the sock file.

<pre lang="php">
// For OSX (development)
if ('graysky.test' == $_SERVER['SERVER_NAME']) {
  define('DB_HOST', 'localhost:/var/run/mysqld/mysqld.sock');
}
else {
  // Normal linux install (production)
  define('DB_HOST', 'localhost');
}
</pre>

<li>After I tweaked fonts and color schemes, I checked in my new theme to git and it was just a matter of <tt>git push</tt> from my Mac, a <tt>git pull</tt> on Linux and activating the theme. And voilà, the blog has a new look!

</ul>
