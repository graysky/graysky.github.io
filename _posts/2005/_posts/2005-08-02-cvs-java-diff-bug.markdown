--- 
wordpress_id: 108
title: CVS Java diff bug?
wordpress_url: http://208.75.86.216/?p=108
layout: post
---
I think there is a problem in the way CVS diffs Java source. I've seen this issue many times where CVS thinks I've inserted a method <em>within</em> an existing method's Javadoc starting comment. When, in fact, what happened was that an entirely new method was added above the existing method. The screenshot below (which comes from <a href="http://www.cenqua.com/fisheye/">Fisheye</a>) shows the resulting diff. It isn't a big deal for diff'ing, but it shows up during merges making it appear as though the original method was edited, when it really wasn't. In this example, <code>isNotEmptyString</code> is entirely new and should not appear intertwined with the existing method. (And I've seen this enough to know that it is not a case where I accidently start typing in the middle of the other method.) 

If I understand it correctly, it seems like the <code>/**</code> of the original Javadoc comment leads CVS to believe that that line didn't change, since it exists in the same spot in the ancestor and contributor. So it assumes that the rest of the new method is really an addition in between lines in the original method. I suppose one workaround would be to favor putting new methods at the bottom of the class.

<center><br />
<img src="/blog/pics/java_diff_issue.jpg" border="0"/><br />
</center>
