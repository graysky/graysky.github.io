--- 
wordpress_id: 66
title: Jess In Action
wordpress_url: http://208.75.86.216/?p=66
layout: post
categories: [code]
---
Besides the Cinemax-like title, <a href="http://www.manning.com/friedman-hill/">Jess In Action</a> is a solid book. <a href="http://herzberg.ca.sandia.gov/jess/">Jess is Java-based rules engine</a> for building expert systems. Jess is also the reference implementation for the <a href="http://www.jcp.org/en/jsr/detail?id=094">javax.rules JSR94</a>. The book provides a good introduction to the LISP-like Jess language, how its rules engine works, several in-depth examples and how to bridge between Java code and Jess. The Jess Java API has some holes, namely the inability to define rules as true Java objects the way you can with templates and facts. Instead you can write them in a seperate file and load them, or deal with the fun of string concenating all your rules in Java (like you often have to with SQL queries). Jess makes up for this with the handy feature of being able to reference Bean-like Java objects inside Jess rules tranparently. The objects can be treated like regular facts with slots translating to method calls and Jess doing the appropriate type conversion. The book is definitely worth picking up if you're using Jess and is a helpful source on an implementation of a rules engine. This book in combination with the next major release, that will include a <a href="http://www.devx.com/Java/Article/17651/0/page/2">full Eclipse plugin</a>, should make the task of getting started <i>much</i> easier than it has been.
