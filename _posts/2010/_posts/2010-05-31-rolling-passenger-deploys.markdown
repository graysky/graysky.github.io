--- 
title: Rolling Rails Deploys with Passenger
layout: post
categories: [tech]
---

We recently run into an issue where restarting Rails within <a href="http://www.modrails.com">Passenger</a> was starting to take longer and longer as the number of plugins and gems we use have grown. This led to 30-90 seconds where the site was unavailable as Passenger restarted the Rails application spawner across every machine. That's far too long if you like to deploy frequently, which we do.

If you can, the best answer might be to move to <a href="http://github.com/blog/517-unicorn">Unicorn</a>, the latest in a long line of Rails deployment options. It handles the process of migrating requests from old workers to new workers transparently. Awesome.

Our first thought was that Rails was just loading too slowly. Both <a href="http://freerobby.com">Robby</a> and I spent some time <a href="http://alexyoung.org/2009/07/03/rapid-rails-boot-up-time/">profiling Rails boot time</a> and there wasn't a single culprit. Instead there were many contributors from the 50+ gems and 30 plugins we use that made it difficult to radically improve.

Next we took a different approach to have capistrano remove instances from the <a href="http://haproxy.1wt.eu/">HAProxy</a> pool
and serially restart Passenger instances. To get this working there are a couple steps that I hadn't seen documented elsewhere (hat tip to Matt Conway's <a href="http://github.com/wr0ngway/rubber">rubber</a> for the serial task trick):

<ol>
	<li>Change haproxy.cfg to perform a file-based health check for each backend:
		<span class="codeblock"><code>option httpchk GET /haproxy.txt</code></span>
		
		In the rails app make sure that same file lives in the public directory so it will respond 200 in the normal case.
		
		Also, I needed to make nginx return a 404 when that file <strong>does not</strong> exist, since that is what HAProxy looks for to remove it 
		from the pool. So in the nginx config:
<pre lang="bash">
if (!-f $document_root/haproxy.txt) {
	return 404;
} 
</pre>
	</li>
	
	<li>Change the default "deploy:restart" capistrano task to do the restart serially. Capistrano usually executes the task
		on all matching hosts concurrently so it requires a little hack to force it to run serially.
<pre lang="ruby">
desc "Restart Passenger serially"
task :restart, :roles => :web do 
  haproxy_health_file = "#{current_path}/public/haproxy.txt"

  # Restart each passenger host serially
  self.roles[:web].each do |host|
    # 1. Take it out of the haproxy pool
    run "rm #{haproxy_health_file}", :hosts => host
    sleep(5)
    # 2. Restart passenger
    run "touch #{current_path}/tmp/restart.txt", :hosts => host
    # 3. Ping passenger to get it to warm up
    run "curl -s 'http://localhost:81/' &> /dev/null; exit 0", :hosts => host
    # 4. Re-add app to haproxy pool
    run "touch #{haproxy_health_file}", :hosts => host
  end
end
</pre>
		
	</li>
	<li>During deploys notice that haproxy will change the dashboard display to remove that instance and send requests to other instances. Be aware that
		  this does mean not all instances have the same code running at the exact same instant. So for database migrations or other scenarios it might 	
			require	putting up a maintenance page or coding defensively.
	</li>
</ol>