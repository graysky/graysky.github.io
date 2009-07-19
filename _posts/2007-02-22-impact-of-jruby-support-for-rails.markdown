--- 
wordpress_id: 136
title: Impact of JRuby Support for Rails
wordpress_url: http://208.75.86.216/?p=136
layout: post
---
From the <a href="http://headius.blogspot.com/2007/02/rails-support-status-update.html">blog of Charles Nutter</a> it looks like <a href="http://jruby.codehaus.org/">JRuby</a> is very close to supporting Rails, 

<blockquote>
I think the truth is that we could really announce support for Rails now. Almost all the visible, outstanding issues with actually *running* Rails apps have been resolved, and most apps and scripts work fine.</blockquote>

While this is very impressive, and full speed ahead gents, it opens the question of what will the response be when it is fully baked? Will the Rubyists starting invoking <code>System.out.println</code> and <code>require 'java'</code> (ouch!)? Will the Railers jump on the JVM? In the Rails community now until now, the word "Java" is usually a punchline (unless prefixed with "recovering"). And those who develop in it are only a half-step above <a href="http://www.pbfcomics.com/?cid=PBF211-Atlantis.jpg#201">child molesters</a>.

The <a href="http://weblog.rubyonrails.org/2007/2/1/jruby-enters-the-home-stretch-for-rails-support">RoR weblog has plugged the progress</a> of JRuby, and some are excited about Ruby on the JVM. JRuby could provide the catalyst for boatloads of Java developers to sneak Ruby into their shops, nay, "enterprises". But is the Rails community ready for unclean hordes who develop on Windows, don't use <a href="http://macromates.com/">TextMate</a> and aren't <a href="http://twitter.com/">Twitter</a> addicts?

We'll see <a href="http://tomayko.com/articles/2006/12/30/ruby-java-co-op">what 2007 brings</a>. There are cases now in Rails where the best alternative is in Java, <a href="http://blog.tourb.us/archives/searching-with-solr/">such as search</a>. <a href="http://ferret.davebalmain.com/trac">Ferret</a> is out there, but has issues running large deployments that are addressable with <a href="http://incubator.apache.org/solr/">SOLR</a>. (The pure could tell themselves that they weren't integrating Java, just calling a web service. Still clean!) Perhaps this will be like <a href="http://wiki.rubyonrails.org/rails/pages/ThroughAssociations">ThroughAssociations</a> before 1.1 or Mongrel all over again. (Very quickly it went from "FastCGI is fine" to "Mongrel is teh bomb".) Embracing change is good. So perhaps when there is a real alternative to the standard ruby interpreter there will be a considered evaluation at the possible future speed improvements and libraries in JRuby. Or maybe the diehards will move to OCaml and Haskell to keep their secret decoder rings. I'd suspect that JRuby's biggest impact will be to make Ruby/Rails more acceptable to corporate types and lower the barrier for Java heads to make the switch. Hopefully the natives <a href="http://poignantguide.net/ruby/">will be welcoming</a>.
