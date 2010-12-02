--- 
title: "Making Twitter an Information Network"
layout: post
---

<div class="flickr-frame" style="margin-bottom: 14px;"><img src="/images/wheat_chaff.png" class="flickr-photo" /></div>

Twitter is increasingly being described as an <a href="http://www.nytimes.com/2010/10/31/technology/31ev.html?_r=1&pagewanted=print">"information network"</a> rather than a social network or "fun-like-ice-cream" novelty. That seems accurate, but the challenge is that Twitter is currently designed like a social network. Even with its innovative asymmetrical following relationships what you follow on Twitter are accounts <a href="#accounts"><small><sup>[1]</sup></small></a> not "interests". As a result, it is difficult to <strong>consume information effectively</strong> and to <strong>tweet for disparate audiences</strong>. Adding capabilities for how Twitter surfaces the most interesting conversations would make it more valuable. 

<h3>Separating Wheat From Chaff</h3>

The primary problem in trying to follow "interests" on Twitter is that signal-to-noise ratio of following people is often low, which increases the amount of manual filtering needed to find the gems. Twitter has made strides in suggesting appropriate people to follow which has certainly helped the initial user experience (and is a <a href="/2010/11/flowtown-acquires-who-should-i-follow/">problem I've been invested in</a>), but it falls short.

A concrete example: I use Twitter to track developments in Ruby on Rails and so follow a lot of Rails hackers. While they certainly tweet about Rails, many have digressions about the TSA, where they ate dinner, sports teams they follow, etc. Sometimes that leads to serendipitous discoveries, but most often I just want to know the state of the art in Rails <em>without the distractions</em>.

<a href="http://www.christinacacioppo.com/blog/2010/11/08/low-costs/">Some argue that the follow cost is low</a> and that you can always unfollow someone. While that is true at the margin I think it misses the fact that there is an opportunity to improve the situation in aggregate. Those low-value (to me) tweets compete for attention and crowd-out other more valuable content. Based on sample data of Twitter users the average engaged user follows around <strong>400 people</strong> <a href="#followingcount"><small><sup>[2]</sup></small></a>. Attention is a scarce resource that should be designed for.

There are several partial solutions to this problem today:

<ul>
	<li><a href="http://proxlet.com/">Proxlet</a> - A clever app <a href="#rabois"><small><sup>[3]</sup></small></a> that acts as a proxy to filter your stream. It can only show tweets with links, block annoying foursquare checkin notices, or mute hashtags during conferences. Its biggest limitation is only certain clients (twitter.com, TweetDeck, Tweetie) support alternate API endpoints.</li>

	<li><a href="http://blog.twitter.com/2009/10/theres-list-for-that.html">Twitter Lists</a> - Twitter's feature to group people can help in  browsing a community or finding people but because they are mostly manually created and not content-based the lists are still noisy. (And few clients, including twitter.com, make Lists prominent relative to your stream.) For example, I track the Twitter API team but <a href="http://twitter.com/twitterapi/team">reading their team list</a> it is rarely about the Twitter API.</li>
	
	<li><a href="http://oneforty.com/item/nutshellmail">Nutshellmail</a> - One of several digest tools that will highlight those tweets that are RT'd and favorited most. A useful tool for those who are time-pressed but don't want to miss anything big.</li>
	<li><a href="http://tweetmeme.com/">TweetMeme</a> - The most popular links on Twitter in high-level categories (Technology, Sports, Gaming, etc.). Browsing categories gives a good snapshot of what's hot, but isn't native to Twitter or personalized to my particular interests.</li>
</ul>

<h3>The Audience Problem</h3>

The other side of the same problem is not being able to target your audience when tweeting. <em>This affects how people tweet</em>. That sounds trivial but is important as Twitter is a gatekeeper to millions of conversations. Some strategies are to "tweet like no one is watching" <a href="#powertips"><small><sup>[4]</sup></small></a>, have a "professional" account or focus on an aspect of their persona. This presentation on the <a href="http://www.slideshare.net/padday/the-real-life-social-network-v2">"Real Life Social Network"</a> describes better than I could problems with having flat, homogenous network without context. For a quick example, look at someone's profile page and note the difference between their replies from their regular tweets.

A concrete example: I have a lot of interests -- technology, startups, music, photography, Boston stuff, etc. -- and a set of followers that are likely only interested in one or two topics, if at all. As I've had more smart people follow me I prefer not to bore them <a href="#cdixon"><small><sup>[5]</sup></small></a> with my random musings. So, I find I self-censor to manage my online identity in a way that I feel comfortable sharing with <em>everyone</em> from friends to investors.

<h3>If I Were Twitter...</h3>

There are gains to be made for the user experience and possibly for Twitter's monetization to more directly allow users to follow interests. Twitter is not a social network like Facebook, which is a <em>good thing</em>. Twitter has an opportunity to be an information network that directs relevant news to the right people in real-time. 

I think there are many ways to approach this challenge but here are a few ideas to make the interest graph <em>natively part of streams</em>:

<ol>
<li>Give users more control over what content is shown from a particular user. There is currently a per-follow setting on whether their Retweets are seen. This should be expanded to include options to only shows tweets containing links or those in certain categories based on the contents of their tweets. (Perhaps "annotations" would be useful to have clients add meta-data about tweets?)</li>

<li>Marry "saved searches" with Lists to automatically create private lists to track niche interests. Only show the tweets from the list that match the topic (not literal text matching), and allow filters to restrict to content that is particularly popular or meets other criteria. Provide subscription capabilities that insert these tweets directly into user stream.</li>

<li>Suggest people and "interests" to follow based on the content of my tweets, not just the social graph. This would be more a "what to follow" similar to "who to follow" (and an improvement on <a href="https://skitch.com/graysky/rnpx5/twitter-who-to-follow-interests" target="_blank">the currently flawed</a> "Browse Interests").</li>
</ol>

<div style="margin-top: 15px;">
<strong>Related Reading</strong>
<ul>
<li><a href="http://blog.koehntopp.de/archives/2978-Die-unertraegliche-Lameness-des-Web-2.0.html#en">"The unbearable lameness of web 2.0"</a> identifies several problems with current social networks. The "Auto-binning" idea is one I particularly agree with.</li>
<li><a href="http://www.briansolis.com/2010/11/the-future-of-advertising-has-been-promoted/">Brian Solis</a> predicts 2011 will be when Twitter becomes a "full-fledged interest graph". Brian <a href="http://twitter.com/#!/briansolis/status/7465592139292672">thinks</a>: "Twitter’s monetization strategy lies in the ability to reach interest graphs, not social graphs".</li>
<li><a href="http://techcrunch.com/2010/11/27/myth-serendipity/">"The Myth of Serendipity"</a> on the difficulty of "social serendipity" and pre-judging what users want to see</li>
<li>Dave Winer on <a href="http://scripting.com/stories/2010/11/26/whatShouldTwittersVisionBe.html#p3448">"What should Twitter's vision be?"</a> includes interesting tidbits around being a news system.</li>
<li>John Battelle on <a href="http://battellemedia.com/archives/2010/11/twitters_great_big_problem_is_its_massive_opportunity">"Twitter's Great Big Problem Is Its Massive Opportunity"</a> </li>
<li>Jeff Miller illustrates <a href="http://jeffmiller.github.com/2010/05/16/twitters-garbage-problem">"Twitter's Garbage Problem"</a> and proposed filtering improvements.</li>
</ul>
</div>

<div style="margin-top: 20px;">
	<strong>Notes</strong>
	<br />
	<a name="accounts"></a><small>[1] Of course accounts don't have to be people, they can be feeds, but you subscribe to all tweets from an account.</small>
	<br />
	<a name="followingcount"></a><small>[2] Sample data from Twitter uses on <a href="http://oneforty.com">oneforty</a>. It excludes those who follow &lt; 10 people to skip those who never engaged, and those who follow &gt; 5000 people who are likely unable to read their stream.</small>
	<br />
	<a name="rabois"></a><small>[3] Proxlet is dangerously close to solving my "Rabois Problem", named for <a href="http://twitter.com/rabois">Keith Rabois</a>. Keith is SF-based entrepreneur and angel investor who is at times very interesting, but he is also a Yankees fan. Being from Boston and a member of Red Sox Nation I'd like to scrub all pro-Yankees tweets from my stream (anti-Yankees tweets are encouraged). See also: <a href="http://twitter.com/bijan">Bijan Sabet</a></small>
	<br />
	<a name="powertips"></a><small>[4] For additional tips to become <a href="http://bajillionhits.biz/post/1424224931/50-power-twitter-tips-to-become-the-most-powerful">the most powerful Twitterer</a>.</small>
	<br />
	<a name="cdixon"></a><small>[5] This is likely all a reaction to having <a href="http://twitter.com/cdixon">Chris Dixon</a> briefly follow and then unfollow me. </small>
</div>