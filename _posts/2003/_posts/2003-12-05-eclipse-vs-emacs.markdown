--- 
wordpress_id: 68
title: Eclipse Vs. Emacs
wordpress_url: http://208.75.86.216/?p=68
layout: post
categories: [code]
---
After spending the last couple days in an <a href="http://www-3.ibm.com/services/learning/MainServlet.wss?pageType=course_description&country=us&language=en&webLanguage=en&includeNotScheduled=y&courseCode=WSWB1">Eclipse Developers course</a>, a friend asked me what the advantages were to using Eclipse as an IDE over something like Emacs for writing Java. Prior to switching to using Eclipse, I'd primarily used Emacs <a href="http://jdee.sunsite.dk/">with the JDEE</a> and was pretty happy. But here are a few reasons I switched:

<ul>

<li><b>Refactoring</b> - Simply great refactoring support for all sorts of common operations like rename, move, override baseclass methods, and my recent favorite "Generate Delegate Methods" which saves a lot of typing.

<li><b>Content Assist</b> - Including but not limited to code completion, it just works smoothly. Half of what I type now is Ctrl-Space to complete the class/method/field/template name that I'm writing. I never type <code>import</code> statements anymore, and if you do it will help you complete those too. There are other editor goodies as well, like easily diving into method bodies, having compile errors take you straight to the offending line and countless others. 

<li><b>Compile-as-you-type</b> - This one is tough to truly appreciate until you use it. It takes the guess work out of whether your code will compile, since the built-in compiler transparently checks for you each step of the way. Forget a semicolon and you know right away. Combined with the handy quickfixes, a whole category of stupid bugs can be eliminated. And when you want to test your app, the code is always compiled and ready to go.

<li><b>SWT/Native look &amp; feel</b>- I'd tried other Java IDEs and found most to be slow and have a second-class feel to them. Eclipse on Windows, feels like Windows and on Linux looks like GTK. Perhaps Swing is to blame for other's problems, but none of them struck me the way Eclipse did. It <i>just</i> looks better (and it helps that it actually is).

<li><b>Plug-in Development Environment (PDE)</b> - If you are building a plugin or application on top of Eclipse, it's the only way to go. Provides a lot help in constructing, testing and deploying your code. And with the ever-growing services provided by the platform, including the exciting <a href="http://dev.eclipse.org/viewcvs/index.cgi/platform-ui-home/rcp-proposal/rich_client_platform_facilities.html?rev=HEAD">Rich Client Platform</a> work, there a lot of reasons to consider it.

<li><b>Better Debugger</b> - I just flat-out like a visual debugger better than using jdb. It's one of those things that I find really useful to have a graphical representation of, like diff/merge tools. This one is well-integrated with the product, supports hot-swapping code, remote debugging and other helpful features.

<li><b>Growing community</b> - Eclipse has spread like wildfire and has a huge community of users, developers, and corporate backers (<a href="http://news.com.com/2100-7344_3-5113128.html?tag=nefd_top">even without Sun</a>). And from its various members comes a <a href="http://www.eclipse.org/community/plugins.html">huge number of plugins</a> (free and commerical), articles &amp; books, courses, <a href="http://www.eclipsecon.org">conferences</a> and an even a programming competition. Lots of <a href="http://www.eclipse.org/eclipse/development/eclipse_project_plan_3_0.html">new features in 3.0</a>, including a solid visual designer for <a href="http://www.eclipse.org/vep/">SWT and Swing</a>.

<li><b>Equivalence with Emacs</b> - Emacs will always be my first real love with a text editor: oh, the staying up to learn Elisp, hacking my own functions and menus, arguing over Emacs vs. XEmacs! And I still use it, just not for Java. Because Eclipse is free, open-source and cross-platform.

</ul>

In the end, I can't say if or how much more productive it makes me. But there are so many <a href="http://www-140.ibm.com/developerworks/rational/library/1376.html">powerful capabilities</a> close at hand that it feels like my job is easier and not spent as much tripping over my development environment.
