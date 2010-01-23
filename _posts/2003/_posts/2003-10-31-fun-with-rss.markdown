--- 
wordpress_id: 55
title: Fun with RSS
wordpress_url: http://208.75.86.216/?p=55
layout: post
---
It was pretty easy to create a specific RSS feed for <a href="http://www.javablogs.com">java.blogs</a> to syndicate entries on all things java. It just worked (like it should). I was pleased.

Then I went to <a href="http://feedvalidator.org">feed validator</a> and it whined about date formats and local URL references (fixed by adding an "http" before a "www"). It gets points for noticing that the date format looks like a MovableType problem and suggesting a solution. But now I have 5 templates that generate slightly different formats and I'm not sure which tools support which versions. For the moment things seem to be working, so I'm going to stop tweaking (even though the date formats do look weird for the current RSS it generates).
