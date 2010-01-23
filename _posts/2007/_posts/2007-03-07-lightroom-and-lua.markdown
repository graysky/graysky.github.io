--- 
wordpress_id: 144
title: Lightroom and Lua
wordpress_url: http://208.75.86.216/?p=144
layout: post
---
While reading this <a href="http://since1968.com/article/190/mark-hamburg-interview-adobe-photoshop-lightroom-part-2-of-2">interview with Adobe's Mark Hamburg</a> about <a href="http://www.adobe.com/products/photoshoplightroom/">Lightroom</a>, he mentions that 40% of it is written in <a href="http://www.lua.org/">Lua</a>, including the UI and much of the application logic before calling C/C++ to talk to the database (which is <a href="http://www.sqlite.org/">SQLite</a>), to the OS and to perform image processing. I'd wondered what the "lrtemplates" (used to define keyword sets, export presets, etc.) were written in. They look similar to JSON, but must be Lua. Before Lightroom, the only other large app I'd heard used it was World of Warcraft (there are <a href="http://www.lua.org/uses.html">actually quite a few</a>).

Lua has been on my list (maybe it is really a stack?) of languages to learn, and this is a <a href="http://www.lua.org/pil/">good excuse to read up</a>.
