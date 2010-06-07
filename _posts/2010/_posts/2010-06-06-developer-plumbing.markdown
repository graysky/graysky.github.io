--- 
title: The Plumbing Revolution
layout: post
---

The best advance in my life as a software developer recently is having to spend less time building (and re-building) plumbing. Much has rightly been made of the move to cloud computing and the virtualization of computing/storage, but in the last year the trend has continued up the stack to include all sorts of services. The benefit to developers is spending more time focused on your product, and less on the myriad of necessary-but-ancillary aspects of building a webapp. This is a very good thing, and has only just begun.

In my thinking about this trend I'm making two assumptions. The first is that the scarce resource is developer time, not money. If you have zero dollars to spend then you have to scrounge. The second is that the goal is to optimize for iteration speed, instead of other goals like education or maintaining complete control. In the past I used to (perversely) enjoy learning about sendmail, ipchains and makefiles; now having to wade into those type of issues is a distraction from improving our site.

A few examples of what I'm talking about (disclosure: a couple are <a href="http://www.techstars.org/">TechStars</a> companies, as is <a href="http://oneforty.com">oneforty</a> where I work):

<ul>
	<li><a href="http://sendgrid.com/">SendGrid</a> - I hate the Yahoo! spam filter after how many emails my apps have sent that it has incorrectly flagged as spam. I just want emails to get into someone's inbox, not become an expert in <a href="http://en.wikipedia.org/wiki/Sender_Policy_Framework">SPF</a> & <a href="http://www.dkim.org/">DKIM</a>. The day after switching to SendGrid from <a href="http://www.authsmtp.com/">AuthSMTP</a> this wasn't a problem anymore. Love it.</li>
	
	<li><a href="http://chargify.com/">Charify</a> / <a href="http://recurly.com">Recurly</a> - Billing and subscription billing in particular is a drag. You just want to get paid but have to worry about merchant accounts, vaults, payment gateways, PCI compliance, oh my. Several companies are trying to simplify this process for developers.</li>
	
	<li><a href="http://mogotest.com">MogoTest</a> - the bane of web developer's lives is testing on the permutation of browsers & platforms that exist today. Firing up VMWare and manually testing pages is painful answer to know if your site works everywhere. We've been using the MogoTest beta and it has saved us hours of development time, and found things we would have missed. There is a direct correlation between fewer hours spent testing Internet Explorer and developer happiness.</li>
</ul>

In addition to those above many others have sprouted up: <a href="http://www.apigee.com">Apigee</a> for API analytics & debugging, <a href="http://www.simplegeo.com">SimpleGeo</a> for geodata storage & discovery, <a href="http://www.twilio.com">twilio</a> for voice/sms-enabled apps and <a href="http://zencoder.com/">Zencoder</a> for video encoding. And it is easy to see why: developer's time is expensive! For simplistic, round numbers let's say the average developer is paid $100K / year, or something like $50 / hour. Saving a few hours per developer adds up to real money pretty quickly. 

The biggest drawback is the loss of some amount of control and the danger of <a href="http://www.joelonsoftware.com/articles/LeakyAbstractions.html">leaky abstractions</a>. For example, let's say that our email begins to get treated as spam by Yahoo! Mail and SendGrid can't help us. There is a potentially difficult choice to roll it back in-house and now have to understand into the thorny world of email delivery. What had been an abstract utility is now a messy problem. This can be a real issue. I've seen it happen today to developers who had thought of their virtualized server as a black box until it hits a memory or disk i/o issue. It is a trade-off, and one that is best made when you're able to evaluate the reward versus the risk.

- TBD: Areas still ripe for doing
-- up the stack
-- SEO