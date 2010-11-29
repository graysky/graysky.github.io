--- 
title: "Making Twitter an Information Network"
layout: post
---

<div class="flickr-frame" style="margin-bottom: 14px;"><img src="/images/wheat_chaff.png" class="flickr-photo" /></div>

Twitter is more recently being described as an <a href="http://www.nytimes.com/2010/10/31/technology/31ev.html?_r=1&pagewanted=print">"information network"</a> as opposed to a social network or "fun-like-ice-cream" novelty. That seems accurate but the challenge is that it is currently designed like a social network. Even with it's innovative asymmetrical following relationships what you follow on Twitter are accounts <a href="#accounts"><small><sup>[1]</sup></small></a> not "interests". This leads to problems when trying to <strong>consume information effectively</strong> and when <strong>tweeting for disparate audiences</strong>. Changing how Twitter surfaces the most interesting conversations would make it more valuable. 

<h3>Separating Wheat From Chaff</h3>

The primary problem in trying to follow "interests" on Twitter is the signal-to-noise ratio of following people is often low, increasing the amount of manual filtering needed to find the gems. Twitter has made strides in suggesting appropriate people to follow which has certainly helped the initial user experience (and is a <a href="/2010/11/flowtown-acquires-who-should-i-follow/">problem I've been invested in</a>), but it falls short.

A concrete example: I use Twitter to track developments in Ruby on Rails and so follow a lot of Rails hackers. While they certainly tweet about Rails many have digressions about the TSA, where they ate dinner, sports teams they follow, etc. Sometimes that leads to serendipitous discoveries but most often I just want to know the state of the art in Rails without the distractions.

<a href="http://www.christinacacioppo.com/blog/2010/11/08/low-costs/">Some argue that the follow cost is low</a> and that you can always unfollow someone. While that is true at the margin I think it misses that there is an opportunity to improve the situation in aggregate. Those low-value (to me) tweets compete for attention and crowd-out other content. Based on sample data of Twitter users the average engaged user follows around <strong>400 people</strong> <a href="#followingcount"><small><sup>[2]</sup></small></a>. Attention is a scarce and valuable resource.

There are several partial solutions to this problem:

<ul>
	<li><a href="http://proxlet.com/">Proxlet</a> - A clever app <a href="#rabois"><small><sup>[3]</sup></small></a> that acts as a proxy to filter your stream. It can block foursquare checkin notices, only show tweets with links or mute hashtags. It's biggest limitation is only certain clients (twitter.com, TweetDeck, Tweetie) support alternate API endpoints.</li>

	<li><a href="http://blog.twitter.com/2009/10/theres-list-for-that.html">Twitter Lists</a> - Twitter's feature to group people is useful for quickly browsing a community or finding people but because it is not content-based it is still very noisy. (And few clients, including twitter.com, make Lists prominent relative to your stream.) For example, I track the Twitter API team closely but <a href="http://twitter.com/twitterapi/team">reading their team list</a> it is rarely about the Twitter API.</li>
	
	<li><a href="http://oneforty.com/item/nutshellmail">Nutshellmail</a> - There are several digest tools that will highlight those tweets that are RT'd and favorited most. A useful tool for those who are time-pressed but don't want to miss anything big.</li>
	<li><a href="http://tweetmeme.com/">TweetMeme</a> - The most popular links on Twitter in high-level categories (Technology, Sports, Gaming, etc.). Browsing categories gives a good snapshot of what's hot, but isn't native to Twitter or personalized to my particular interests.</li>
</ul>

<h3>The Audience Problem</h3>

The other side of the same issue is not being able to target your audience when tweeting. It affects how people tweet. Some strategies are to "tweet like no one is watching" <a href="#powertips"><small><sup>[4]</sup></small></a>, have a semi-professional account or focus on an aspect of their persona. This presentation on the <a href="http://www.slideshare.net/padday/the-real-life-social-network-v2">"Real Life Social Network"</a> describes better than I could issues with having flat, homogenous network without context. For a quick example, look at someone's profile and the difference between their replies from their regular tweets.

A concrete example: I have a lot of interests -- technology, startups, music, photography, Boston stuff, etc -- and a set of followers that are likely only interested in one or two topics, if at all. As I've had more smart people follow me (in addition to the spam accounts) I prefer not to bore them <a href="#cdixon"><small><sup>[5]</sup></small></a>. (TODO? -- Recently I ran a <a href="http://twtpoll.com/r/w974s0">quick poll</a> to try to gauge what I should tweet about)

<h3>If I Was Twitter...</h3>

3 ideas that need more detail:

1) Give users more control over what content is shown from a particular user. There is currently a per-follow setting on whether their Retweets are seen. This should be expanded to include options to only shows tweets containing links or perhaps based on the content (following the Proxlet model). 

2) Marry "saved searches" with Lists to automatically create private lists to track interests. Only show the tweets from the list that match the topic (hand-waving on how), and allow filters to restrict to content that is particularly popular or meets other criteria.

3) Suggest these lists as related based on the contents of a user's tweets.

Maybe better to monetize too?

Show these tweets publicly?


<strong>Notes</strong>
- Suggested conversations / topics based on the content of my interests
- IR sucks. Postpost and others are helpful.

- Twitter audience problem
	- http://www.briansolis.com/2010/11/the-future-of-advertising-has-been-promoted/
  -	http://scripting.com/stories/2010/11/26/whatShouldTwittersVisionBe.html
	- http://techcrunch.com/2010/11/27/myth-serendipity/
  - http://blog.koehntopp.de/archives/2978-Die-unertraegliche-Lameness-des-Web-2.0.html#en
  

<div style="margin-top: 20px;">
	<a name="accounts"></a><small>[1] Of course accounts don't have to be people, they can be feeds, but you subscribe to all tweets from an account.</small>
	<br />
	<a name="followingcount"></a><small>[2] Sample data from Twitter uses on <a href="http://oneforty.com">oneforty</a>. It excludes those who follow &lt; 10 people to skip those who never engaged, and those who follow &gt; 5000 people who are likely unable to read their stream.</small>
	<br />
	<a name="rabois"></a><small>[3] Proxlet is dangerously close to solving my "Rabois Problem", named for <a href="http://twitter.com/rabois">Keith Rabois</a>. Keith is SF-based entrepreneur and angel investor who is at times very interesting, but he is also a Yankees fan. Being from Boston and a member of Red Sox Nation I'd like to scrub all pro-Yankees tweets from my stream (anti-Yankees tweets are encouraged). See also: <a href="http://twitter.com/bijan">Bijan Sabet</a></small>
	<br />
	<a name="powertips"></a><small>[4] For additional tips to become <a href="http://bajillionhits.biz/post/1424224931/50-power-twitter-tips-to-become-the-most-powerful">the most powerful Twitterer</a>.</small>
	<a name="powertips"></a><small>[5] This is likely all a reaction to having <a href="http://twitter.com/cdixon">Chris Dixon</a> briefly follow and then unfollow me.</small>
</div>