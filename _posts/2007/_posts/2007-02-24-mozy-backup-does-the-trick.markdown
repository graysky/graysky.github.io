--- 
wordpress_id: 137
title: Mozy Backup Does The Trick
wordpress_url: http://208.75.86.216/?p=137
layout: post
categories: [tech]
---
Recently I put an end to my waking up in a cold sweat muttering, "my music! my photos! my documents!", by signing up with the <a href="http://mozy.com/">online backup service Mozy</a>. Having better backups seems to always fall to the bottom of my todo list. I'd been thinking of building a local RAID server or maybe using <a href="http://www.opensolaris.org/os/community/zfs/">ZFS</a>, but this never seemed to happen (and still wouldn't protect against a fire.) Instead, for $55 bucks per year Mozy offers unlimited secure backups and a simple front end to configure it (currently Windows only, with an OSX client soon). I looked at several <a href="http://www.amazon.com/gp/browse.html?node=16427261">Amazon S3-backed</a> services, but didn't see one looked both simple, inexpensive and mature enough that I would trust all my precious data to it. The <a href="http://www.nytimes.com/2007/01/04/technology/04pogue.html">NYTimes David Pogue's positive review</a> pushed me to finally signup. Here's my impression after 6 weeks of using it:

<ul>

<li>The price seems right. $55 / year / computer for unlimited space seems fair, and a good deal compared to services like <a href="http://www.jungledisk.com/">JungleDisk</a> that charge for both the amount stored and transferred. They provide a web restore to recover destroyed files, or a FedEx option where they mail you a DVD.

<li>It looks secure enough to be trusted, using 448-bit Blowfish encryption over SSL. You can provide your own key or let them autogenerate one.

<li>The Windows UI is pretty easy to use. The preconfigured backup rules didn't capture quite what I wanted, but it is easy enough to erase those and create new ones. Also it was simple to schedule the backups to take place at night, which I prefer to run continuously. I know that I'm lazy with these things, so I wanted to set it up once and then forget about it. One nit is that when Mozy is "suspended", the taskbar icon doesn't change, which confused me when I was trying to figure out why a scheduled backup didn't run. It would be better to have a different overlay that made it more obvious.

<li>The initial backup of my 30+ GB of data took several days. The <a href="http://mozy.com/support/faq">Mozy FAQ states</a>:

<blockquote>
For a typical system, on a typical broadband line, Mozy backs up data at about 2-4 GB per day - but if left undisturbed on fast connection, you can backup over 9GB in a single day.</blockquote>

If the backup is run without any throttling, I typically get ~360Kb/sec. upload speed. This is pretty close to the <a href="http://www.speakeasy.net/speedtest/">maximum upload speed</a> I get from RCN, so Mozy isn't slowing things down much. This caused some problems with my <a href="http://www.vonage.com">Vonage</a> phone service, since Mozy was filling the outbound pipe. Mozy lets you throttle how much bandwidth to use, which can help the problem but lengthen the backup. During the initial backup I hit a few "connection errors" which required the backup to be restarted (more on this later). After the initial backup, further backups are incremental and have run successfully. 

<li>I'm a little concerned because they are a young company. Will they be around in 5 years? At least the guys running it appear to be a <a href="http://www.enterpriseitplanet.com/storage/features/article.php/3611481">sharp crew from this article</a>.

<li>Around the time I signed up they were getting good press, like this <a href="http://ptech.wsj.com/archive/ptech-20061214.html">plug from Walt Mossberg</a>, and struggled to keep up with the demand. Many new users like myself were causing some of the connection problems I'd hit. To their credit, they sent an email explaining the situation, apologizing for the problems, describing what they had done to improve the network glitches and customer support slowness, and offered 1, 2 or 3 months of free service. I took the extra service and was relatively pleased with their response to the issue.

</ul>
