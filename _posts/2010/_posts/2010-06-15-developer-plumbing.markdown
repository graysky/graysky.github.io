--- 
title: "The Plumbing Revolution: Developers' Improving Toolbox"
layout: post
---

<div class="flickr-frame"><img src="/images/mario_pipe.jpg" class="flickr-photo" /></div>

The best advance in my life as a software developer recently is having to spend less time building (and re-building) plumbing. Much has rightly been made of the move to cloud computing and the virtualization of computing/storage, but in the last year the trend has continued up the stack to include all sorts of services. The benefit to developers is spending more time focused on your product, and less on the myriad of necessary-but-ancillary aspects of building a webapp. 

In my thinking about this trend, I'm making two assumptions. The first is that the scarce resource is developer time, not money. If you have zero dollars to spend then you have to scrounge. The second is that the goal is to optimize for iteration speed, instead of other goals like education or maintaining complete control. In the past I used to (perversely) enjoy learning about sendmail, ipchains and makefiles; now having to wade into those type of issues is a distraction from improving our site.

A few examples of what I'm thinking about:

<ul>
	<li><a href="http://sendgrid.com/">SendGrid</a> - I hate the Yahoo! spam filter after how many emails my apps have sent that it has incorrectly flagged as spam. I just want emails to get into someone's inbox, not become an expert in <a href="http://en.wikipedia.org/wiki/Sender_Policy_Framework">SPF</a> & <a href="http://www.dkim.org/">DKIM</a>. The day after switching to SendGrid from <a href="http://www.authsmtp.com/">AuthSMTP</a> this wasn't a problem anymore. Love it.</li>
	
	<li><a href="http://chargify.com/">Charify</a> / <a href="http://recurly.com">Recurly</a> - Billing and subscription billing in particular is a huge pain. You just want to get paid but have to worry about merchant accounts, vaults, payment gateways, PCI compliance, etc. Oh, joy. Several companies are trying to simplify this process for developers (which Sachin covers well in his <a href="http://blog.meatinthesky.com/introduction-to-online-payments-tldr-its-a-to">Intro to Online Payments</a> post).</li>
	
	<li><a href="http://mogotest.com">MogoTest</a> - the bane of web developer's lives is testing all the permutations of browsers & platforms that exist today. Firing up VMWare and manually testing pages is painful answer to know if your site works everywhere. We've been using the MogoTest beta and it has saved us hours of development time, and found things we would have otherwise missed. There is a direct correlation between fewer hours spent testing Internet Explorer and developer happiness. While this might not seem like <em>plumbing</em> exactly, having to ensure browser compatibility is a painful tax on creativity.</li>
	
	<li><a href="http://www.apigee.com">Apigee</a> - the web has seen an explosion of RESTful APIs in the last ~5 years. Many are simple to consume with tools like <a href="http://api.rubyonrails.org/classes/ActiveResource/Base.html">ActiveResource</a> but anyone who built on other's APIs knows you can spend a lot of time dealing with error conditions, latency, analytics, downtime, etc. Apigee is building a way to consume APIs by using their smart pipe between you and the the 3rd party.</li>
	
	<li>Many more than I can cover: <a href="http://www.simplegeo.com">SimpleGeo</a> for geodata storage & discovery, <a href="http://www.twilio.com">twilio</a> for voice/sms-enabled apps, <a href="http://zencoder.com/">Zencoder</a> for video encoding, <a href="http://hunch.com">Hunch</a> for a recommendation service or <a href="http://www.bigdoor.com">BigDoor</a> for adding game mechanics.</li>	
</ul>

And it is easy to see why: developer's time is expensive and limited. The biggest danger for developers choosing to rely on other's platforms is that <a href="http://www.joelonsoftware.com/articles/LeakyAbstractions.html">abstractions leak</a>. Suddenly what had been a simple blackbox requires understanding the inner workings of these domains if something goes wrong or you outgrow the service. Still, for startups it is a smart move to trade some money to buy more time to focus on your core business and customers. 

I think there are a number of areas ripe for significant improvements in infrastructure and how developers spend their time:

<ul>
	<li><strong>SEO</strong> - Having developers spend much time attempting to deeply understand Google is a net waste. And yet, Google <em>is</em> how <a href="http://cdixon.org/2009/12/02/seo/">normal people find things on the web</a>, so it is too important to ignore. And the mantra of just "build good content" can be simplistic in practice. It is a difficult problem to solve but there is some <a href="http://media.venturebeat.com/2010/06/14/brightedge-seo/">recent activity in this space with companies like BrightEdge</a>.</li>
		
	<li><strong>Understanding user behavior</strong> - Collecting <em>actionable</em> data on your users is challenging. Who are your most engaged and what motivates them? What was missing for those that visited and never returned? Tools like Google Analytics aren't auditable, and feedback services like <a href="http://uservoice.com/">UserVoice</a> may miss apathetic visitors. There are several startups attacking various aspects of the problem such as <a href="http://kissinsights.com/">KISSinsights</a> gathering better surveys (<a href="http://hitenshah.name/">Hiten</a> is the man in this area), <a href="http://www.performable.com/">Performable</a> A/B testing behavior on landing pages or <a href="http://www.usermojo.com/">UserMojo</a> trying to analyze user emotion.

	<li><strong>Debugging and responding to issues</strong> - One of the most difficult aspects to web programming is the number of moving parts. While it is a good goal to get to a state of zero errors there is often a steady mix of real issues (ones affecting real people), and those due to strange circumstances (badly formed requests, bots). We use <a href="http://hoptoadapp.com">Hoptoad</a> and <a href="http://www.newrelic.com/">New Relic</a> that are both valuable but neither completely solve the issue of discerning signal from noise. It can challenging to quickly know if a real problem that requires attention immediately, or if it is just background noise. Services like these could monitor constantly but only notify when levels have changed significantly. In addition to diagnosis based on data trends, it would be great to react to future exceptional conditions automatically (perhaps notifying subsequent users).

	<li><strong>Hiring</strong> - While not plumbing per se the recruiting & hiring process can be a huge time sink for small development teams. While it is enormously important to build a great team it can be a serious distraction from customer learning and building the product. The existing models of recruiting and typical job boards both fail to provide enough screening for employers nor sufficient information for job seekers. Especially when you consider that most of the people that your company wants to hire are currently employed elsewhere.</li>
</ul>