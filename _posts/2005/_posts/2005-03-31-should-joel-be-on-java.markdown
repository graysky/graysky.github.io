--- 
wordpress_id: 96
title: Should Joel be on Java?
wordpress_url: http://208.75.86.216/?p=96
layout: post
categories: [code, tech]
---
I'm a fan of Joel's writing on software development but was struck by the series of technical hurdles he addressed in today's installment of the <a href="http://www.joelonsoftware.com/articles/FogBugzIII.html">Road to FogBugz 4.0</a> because they aren't the typical problems that need to be solved in Java-land. (I'm not trying to spark a language holy-war, I was just intrigued to see the time and effort that went into solving problems that I think are largely solved for Java-based web applications.)

Joel describes the process that he (with the help of a summer intern) went through to get their ASP-based web app to run on Unix. They chose to write a ASP to PHP compiler and Joel describes some other aspects of their development environment along the way. While it is always fun to read his articles, I think this one could have be obviated if they worked in Java. I'm sure there are compelling business and historical reasons why FogCreek used ASP, but bear with me:

<ul>

<li><em>ASP to PHP compiler</em> - Of course Java's cross-platform nature means something like this wouldn't be necessary when "porting" your web app to Unix. It does mean that you don't get to spend time writing fun tools like a custom compiler and maybe the intern would have been fetching coffee instead. (And should anything be read into their writing the compiler itself in Java?) Also, and this is not a knock against the intern's surely stellar work, but, all else being equal, I would prefer to have a single code base representing the application and not need to worry about the additional layer of potential problems.

</li><li><em>Hungarian notation</em> Joel writes about the value of "Apps Hungarian notation" for reading things like "psz" and instantly knowing it is a  "pointer to a null-terminated string, but no memory is allocated". Great! Even better is getting out of the business of deciding how strings should be terminated and (usually) who's responsibility it is to malloc/free memory. While some of this might not apply to ASP directly, I've never seen anyone write Hungarian notion in Java, and not because people don't write ugly-looking code. The language shields the programmer from many of those details and the several powerful, <a href="http://www.eclipse.org">free IDEs</a> out there help too.

</li><li><em>SQL code</em> In the section about the power of Hungarian notation, Joel writes how they use it to make their SQL easier to read, like "join Bar on Foo.ixBar = Bar.ixBar". And if you need to edit SQL directly, that's pretty readable. Thankfully the Java platform has freely available ORM tools like <a href="http://www.hibernate.org/">Hiberate</a> that can save you from writing  SQL at all (mostly).

</li><li><em>Porting ASP libraries/COM Objects</em> Finally they had to port several COM objects to PHP and re-implement ASP libraries using PHP and VBScript. Java's portability would have solved this, um, a little easier for the standard libraries and 3rd party components.

</li></ul>

I'm certainly familar with working in environments where the platform was chosen long ago and presents challenges where these types of hacks (evil or elegant) are necessary. But there is clearly a disconnect in the type of problems that needed to be solved for the Unix version of FogBugz and what that same intern would have been doing if FogCreek was a Java shop.
