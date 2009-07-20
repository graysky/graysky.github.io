desc "deploy site to graysky.org"
task :deploy do
  require 'rubygems'
  require 'highline/import'
  require 'net/ssh'
 
  branch = "master"
 
  #username = ask("Username: ") { |q| q.echo = true }
  username = "champion"
  password = ask("Password: ") { |q| q.echo = "*" }
 
  Net::SSH.start('graysky.org', username, :port => 1337, :password => password) do |ssh|
    commands = <<EOF
cd /var/www/graysky
git checkout #{branch}
git pull origin #{branch}
git checkout -f
#rm -rf _site
jekyll --no-auto
#mv _site ../_#{branch}
#mv ../#{branch} _old
#mv ../_#{branch} ../#{branch}
#rm -rf _old
EOF
    commands = commands.gsub(/\n/, "; ")
    ssh.exec commands
  end
end