--- 
wordpress_id: 946
title: TextMate Project Tree Refresh
wordpress_url: http://graysky.org/?p=946
layout: post
---
One small annoyance of using <a href="http://macromates.com/">TextMate</a> is how it refreshes the project tree when it regains focus. If you have a large source tree this can lead to waiting for many seconds while TextMate is frozen or showing the dreaded <a href="http://en.wikipedia.org/wiki/Spinning_wait_cursor">beach ball</a>. Normally switching back from another application to TextMate has about a half second delay, but when the directory contents are changed it can be considerably longer when the project is large (presumably stat info is cached in the first case.) Our current project setup contains about 150MB of source code (including plugins and vendor'd rails) and a data directory that can be ~1GB, leading to some frustrating wait times.

Until the mythic <a href="http://blog.macromates.com/2009/working-on-it/">TextMate 2 is released</a> and fixes <a href="http://fixedbytm2.com/">each and every TextMate issue</a>, here are a few workarounds:

<ol>
<li><strong>Change Project Structure</strong> - Move that huge data directory out from under the project hierarchy. For some projects this might be harder than others, especially for those projects with very large source trees.</li>

<li><strong>ReMate</strong> - There are 2 version of ReMate, a plugin that disables the automatic refreshing of the project tree. The <a href="http://ciaranwal.sh/remate/">original version</a> adds a menu item to <em>Disable Refresh on Regaining Focus</em>. This makes TextMate instantly responsive during app switching, but I can't get the option to remain enabled between TextMate sessions. And, obviously, changes made in the filesystem are not reflected in the TextMate project drawer and the manual <em>Refresh All Projects</em> menu item is broken as well. (This might be due to an interaction with <a href="http://ciaranwal.sh/2008/08/05/textmate-plug-in-projectplus">ProjectPlus</a> plugin.) 

<br /><p>The <a href="http://ciaranwal.sh/2007/11/07/remate-update">updated version of ReMate</a> will disable automatic refresh for specific mounted volumes and is designed for those editing files over networked filesystems like SFTP or WebDAV.</p>
</li>

<li><strong>Remove Folder Reference</strong> - Within TextMate a folder pattern can be removed from the tree. The advantage over ReMate is to remove the huge data directory but still have TextMate automatically pick up other filesystem changes. This will only stick if you have a TextMate Project (right click on the top level directory > <em>Show Information</em>) or make the change globally (<em>Preferences</em> > <em>Advanced</em> > <em>Folder References</em>). Within the dialog modify the <em>Folder Pattern</em> <a href="http://manual.macromates.com/en/regular_expressions">regular expression</a> to exclude the "big_data" directory like:

<br /><pre lang="bash">
!.*/(\.[^/]*|CVS|big_data|.*~\.nib|.*\.(xcode(proj)?))$
</pre>

After making this change TextMate should be much snappier when bouncing between TM and other applications. 
</ol>
