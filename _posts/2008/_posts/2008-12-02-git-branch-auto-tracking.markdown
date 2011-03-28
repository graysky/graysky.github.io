--- 
wordpress_id: 472
title: Git Branch Auto-Tracking
wordpress_url: http://graysky.org/?p=472
layout: post
categories: [code]
---
Since happily subverting <a href="http://subversion.tigris.org/">Subversion</a> and switching to <a href="http://git.or.cz/">Git</a>, I've been looking for this tip: how to set up auto-tracking of a local branch that I pushed remotely (e.g. so that I can <code>git pull</code> without naming the remote branch). It is simple if you create your local branch <em>from an existing remote branch</em> (<code>git branch --track foo origin/foo</code>) and I assumed there must be a similar flag if I pushed my local branch to a remote (without creating a new branch or creating the remote first).

Well, Jamis Buck had the <a href="http://twitter.com/jamis/status/1023270069">same question</a> and Sam Stephenson <a href="http://twitter.com/sstephenson/status/1023295427">provided the answer</a>, <a href="http://gist.github.com/29070">reproduced</a> below. (Who says Twitter is a waste of time?) After adding this script and setting up the git alias, you can accomplish it via '<code>git push origin foo && git track</code>'.

<pre lang="bash">
#!/bin/sh
# git-track should be added to your path.
# Sets up auto-tracking of a remote branch with same base name.
# Can set up "git track" so it feels built-in:
# git config --global --add alias.track '!git-track'
#
branch=$(git branch 2>/dev/null | grep ^\*)
[ x$1 != x ] && tracking=$1 || tracking=${branch/* /}
 
git config branch.$tracking.remote origin
git config branch.$tracking.merge refs/heads/$tracking
echo "tracking origin/$tracking"
</pre>

And if you truly hate unnecessary typing install the slick <a href="http://blog.ericgoodwin.com/2008/4/10/auto-completion-with-git">git auto-completion script</a> and bask in the saved keystrokes. 
