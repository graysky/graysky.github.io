--- 
title: Rails Downtime Postmortem
layout: post
---

Since joining oneforty last summer lots of things have gone well, but the mistakes we've made are usually more educational. The following is an attempt to capture the events that led to a brief site outage and some lessons learned.

A few weeks ago we rolled out an alpha version of our ecommerce platform, and the site was featured on a few sites like TechCrunch. At the roughly the same time there were alerts about the amount of swap space on one or more of our instances. The alerts would typically flap between a warning and returning to normal levels. I figured the two events were related and that the alerts were due to increased traffic, but not a serious problem. 

Later in the evening as the alerts continued I investigated the situation. The site is built on Rails, running in Passenger and hosted on Engine Yard's EC2 cloud offering. Running <code>passenger-memory-stats</code> on our "application master" instance showed that there were about twice as many Rails processes as there should be, and there was a discrepancy between what <code>passenger-memory-stats</code> showed (total rails processes) and <code>passenger-status</code> revealed (those that Passenger is actively using). There was less than 15MB of free memory and little swap left due to the stale processes. That's not good.

I ended up being the straw that broke the camel's back. While trying to kill some of the stale processes, the machine locked up when it ran out of swap space. The Engine Yard configuration has the "app master" node double as both an application server and the load balancer, through haproxy, to the other application instances. This means that when that instance became unresponsive, the whole site was down. So now the clock is ticking (and I'm swearing to myself). 

Engine Yard's service noticed within 60 seconds that the app master was unresponsive. It automatically killed the existing app master instance, promoted one of the other app clones to be the master and started a fresh app instance to replace the clone. This worked almost flawlessly, except for two issues. When a new instance is brought up it is added to the load balancer <em>before</em> our gem installation is started, so there is a window of time when it will throw 500s. I don't like the EY model of defining gems as part of the app in the EY web interface (and <a href="https://cloud-support.engineyard.com/discussions/suggestions/42-make-deployments-programmable">it appears this might change</a>), but still this our app so it is our issue. Not wanting to wait the ~15 minutes for all our gems to be installed, I killed the new instance. 

Once the new app master was promoted, the site was back alive. The second problem was that EY doesn't automatically update the memcached config on each app server when an instance is terminated (<a href="https://cloud-support.engineyard.com/discussions/known-issues/4-memcachedyml-not-updated-when-an-app-instance-is-terminated">also a known issue</a>), so we were suffering increased cache misses that made the site very slow. I fixed the memcached config issue manually and the site was back to full functionality. Total damage was about 10 of downtime, and another 10 minutes of slow-to-unusable site performance.

<h2>Lessons Learned</h2>

I'm a fan of the <a href="http://www.startuplessonslearned.com/2008/11/five-whys.html">idea of proportional investment</a> when reacting to problems like this. The first instinct of most engineers, myself included, is that we need to build a sophisticated monitoring system, remove all SPoFs and have the site autonomically failover. Those are good goals, and maybe you eventually get there, but not until that level of investment is truly called. 

- look up date of launch / TC link

- lessons learned
-- better notifications
-- hack to kill rogue processes
-- vanity
-- 



Couple observations / thoughts, but we can discuss tomorrow when I'm
not blurry-eyed.

1) The monitor.us message came about 10 minutes into the downtime. Now
that we are handling money, API requests, etc., it probably makes
sense to shell out for something more robust. Services like Pingdom
will email, SMS, and I think some call when there are issues. First
step is to know when stuff breaks, and we all sleep for like 1/3 of
the day.

2) Would like something automated in place to weed out stale Rails
processes. I'm not sure how they lived on, and before I tipped the
scales doing an nginx nor passenger restart helped. Need to kill the
zombies.

3) As a general rule, and (god I've said this before) need to take
seriously the warnings / errors that EY stuff produces. The app master
had been flapping all day toward running low on memory / swap. Early
detection and treating those as real issues & not false-positives is
usually a good move.