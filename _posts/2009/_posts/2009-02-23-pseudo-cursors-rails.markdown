--- 
title: Pseudo Cursors in Rails
layout: post
categories: [code]
---
This morning <a href="http://twitter.com/d2h/status/1240490606">DHH twittered</a> about adding <a href=" http://github.com/rails/rails/blob/d13623ca46c82120c398f4634e206422fc3ad7ea/activerecord/lib/active_record/batches.rb">"batch find"</a> to ActiveRecord in 2.3. Mike Gunderloy has a <a href="http://afreshcup.com/2009/02/23/rails-23-batch-finding/">good explanation of how batch finding can be used</a>. Definitely a nice improvement, but there is perhaps a better alternative already out there.

Stepping back, one of the attractive aspects to Rails is the simple abstraction it wraps around the database. It works beautifully until the <a href="http://www.joelonsoftware.com/articles/LeakyAbstractions.html">abstraction leaks</a> and you're left wondering why your code is running slow and Mongrel is chewing up memory.  The problem is the same query that used to find 500 rows now find 50,000 and pulling in that many records will fill the available memory and slow everything down. So you hack up something with limits & offsets or borrow Jamis Buck's trick for <a href="http://weblog.jamisbuck.org/2007/4/6/faking-cursors-in-activerecord">fast MySQL "cursors"</a> to get things working again. (And hopefully think about whether it might be better moved to an <a href="http://axonflux.com/building-and-scaling-a-startup ">offline queue</a>.)

Another solution is the handy <a href="http://rubyforge.org/projects/pseudocursors/">pseudo cursors</a> plugin. It has been around a while but has never appeared to get much attention. It adds a single <tt>find_each</tt> method that behaves like the usual <tt>find</tt> except of returning an array it takes a block that yields for each record.  An example:

<pre lang="ruby">
User.find_each(:conditions => ["created_at > ?", 3.weeks.ago]) do |user|
  user.send_welcome_message!
end
</pre>

Under the hood it executes the query like normal, except that it only fetches the ids of the records. Even for a very large dataset having just the ids in memory is acceptable. Then in batches it requests the full state of the records and yields them. One advantage over the new "batch" methods is that pseudo cursors supports normal <tt>:order</tt> clause. And it can be easily chained with other scopes like <tt>BlogPost.recent.find_each(:conditions => "views > 100", :order => "created_at DESC", :include => [:comments])</tt>

A while back I pulled this plugin (which is stable but not actively developed) <a href="http://github.com/sml/pseudo_cursors/tree/master">to Github for easier hacking</a>. I made one enhancement to have it honor the <tt>:include</tt> option for eager loading associations.
