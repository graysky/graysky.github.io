--- 
wordpress_id: 115
title: Semi-Generic Java Generics
wordpress_url: http://208.75.86.216/?p=115
layout: post
categories: [code]
---
Ugh. So I keep forgetting that Java generics aren't covariant (can't pass <code>List&lt;Square&gt;</code> where <code>List&lt;Shape&gt;</code> is expected). I understand why that's the case but maybe they should have come up with a different name, something that captures how they mostly do what you want, <a href="http://www-128.ibm.com/developerworks/java/library/j-jtp01255.html">until they surprise you.</a> While I like them for clarifying API design and documentation, they seem to be fixing a type safety problem I rarely encountered.

