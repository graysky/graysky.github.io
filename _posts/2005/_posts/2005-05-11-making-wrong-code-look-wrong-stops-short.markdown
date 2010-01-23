--- 
wordpress_id: 97
title: Making Wrong Code Look Wrong Stops Short
wordpress_url: http://208.75.86.216/?p=97
layout: post
---
Joel posted a new essay on using Apps Hungarian to make <a href="http://www.joelonsoftware.com/articles/Wrong.html">wrong code look wrong</a> by inspection. Now, while I'm certainly no Joel, but I'm tempted to say one should go one step further than just a naming convention and have the compiler tell you when it's wrong code. Through the wonder of data structures the compiler can prevent writing a string that is not properly encoded, in his example. If you have two integers that represent rows and columns and assignment should be prevented between them, then in not much more time then it does to prefix everything with "rw" and "cw", two simple classes would do the trick with far more compile-time safety. And Joel is certainly right that Systems Hungarian and prefixing the actual type (not just "kind") is the path to the dark side, and any modern editor should be able to tell you the declared type.
