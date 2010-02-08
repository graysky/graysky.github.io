--- 
title: Downtime Postmortem
layout: post
---

Since joining <a href="http://oneforty.com">oneforty</a> last summer lots of things have gone well, but the mistakes we've made are usually more educational. The following is an attempt to capture the events that led to a brief site outage and some lessons learned.

A few weeks ago we <a href="http://www.techcrunch.com/2010/01/14/oneforty-rolls-out-premium-twitter-app-marketplace-raises-1-9-million/">rolled out an alpha version of our ecommerce platform</a> and the news was covered on a few blogs, including TechCrunch. At roughly the same time (it seemed) there were alerts about the amount of swap space on one or more of our servers. The alerts would typically flap between a warning and then return to normal levels. I figured the two events were related and that the alerts were due to increased traffic, but not a serious issue. 

Later in the evening as the alerts continued I investigated the situation. The site is built on Rails, running in Passenger and hosted on <a href="http://www.engineyard.com/">Engine Yard's EC2-based cloud service</a>. Running <code>passenger-memory-stats</code> on our "application master" instance showed that there were about twice as many Rails processes as there should be, and there was a discrepancy between what <code>passenger-memory-stats</code> showed (total rails processes) and what <code>passenger-status</code> revealed (those that Passenger is actively using). There was less than 15MB of free memory and little swap left due to the stale processes. Not good.

Then I put on the straw that broke the camel's back. While trying to kill one of the stale processes, the machine locked up when it ran out of swap space. The Engine Yard configuration has the "app master" server double as both an application server and the load balancer, through haproxy, to the other application instances. This means that when that instance became unresponsive, the whole site went down. So now the clock is ticking (and I'm swearing to myself).

Engine Yard's service noticed within 60 seconds that the app master was unresponsive. It automatically killed the existing app master instance, promoted one of the other app clones to be the master and created a fresh app instance to replace the clone. This worked smoothly, except for two issues. When a new instance is created it is added to the load balancer <em>before</em> our gem installation is run, so there is a window of time when it would throw 500 errors. The EY flow of specifying required gems is through their web interface, instead of in our application's git repository. This is less than ideal (and <a href="https://cloud-support.engineyard.com/discussions/suggestions/42-make-deployments-programmable">it appears it might change soon</a>), and we hadn't yet invested in a better workaround. Not wanting to wait for the gems to be installed, I terminated the newly booted clone.

Once the new app master was promoted, the site was back alive. The second problem was that EY doesn't automatically update the memcached config on each app server when an instance is terminated (<a href="https://cloud-support.engineyard.com/discussions/known-issues/4-memcachedyml-not-updated-when-an-app-instance-is-terminated">also a known issue</a>), so we were suffering increased cache misses that made the site very slow. I fixed the memcached config issue manually and the site was back to full functionality. Total damage was about 10 of downtime, and another 10 minutes of slow-to-unusable site performance.

<h3>Lessons Learned</h3>

I'm a fan of the <a href="http://www.startuplessonslearned.com/2008/11/five-whys.html">idea of proportional investment</a> when reacting to problems like this. The first instinct of most engineers, myself included, is that we need to build a sophisticated monitoring system, remove all single points of failure and have the site failover to redundant systems. Those are good goals, and maybe you eventually get there, but not until that level of investment is truly called for. Instead, we've taken the following steps:

<ul>
<li>Signed up for a more robust uptime monitor, <a href="http://pingdom.com">Pingdom</a>, for better email/sms alerts.</li>

<li>Fixed the issues causing stale processes. Initially it wasn't clear what was causing them to hang around after a deploy. The first step was to write a quick
capistrano task that would kill any detected during deploys. This at least addressed the symptom. After
more research (and a helpful pointer from EY's <a href="http://twitter.com/ezmobius">Ezra</a>) it became clear that it was because of an interaction between <a href="http://vanity.labnotes.org/">A/B testing framework vanity's handling of redis connections</a> and Passenger's forking model. A <a href="http://gist.github.com/283171">patch to vanity</a> forced it to stop accidentally sharing a redis connection between processes to fix the underlying problem. (Passenger's model has real advantages but alters the "shared nothing" assumption many components make.)</li>

<li>Working to get to a point where alerts and notifications do not become background noise. When they do it is too easy to ignore them and miss real issues. I think this always sounds easier than it is. Webapps have a lot of moving parts and receive many odd requests that can trigger alerts from machines, exception trackers and performance monitoring tools. There will be ongoing work to find the right thresholds and to address issues as they crop up.</li>

</ul>