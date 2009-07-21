desc "deploy site to graysky.org"
task :deploy do
  require 'rubygems'
  require 'highline/import'
  require 'net/ssh'
 
  branch = "master"
 
  #username = ask("Username: ") { |q| q.echo = true }
  username = "champion"
  password = ask("Password: ") { |q| q.echo = "*" }
 
  Net::SSH.start('graysky.org', username, :port => 22, :password => password) do |ssh|
    commands = <<EOF
cd /var/www/graysky
git checkout #{branch}
git pull origin #{branch}
rm -rf _site
jekyll --no-auto
mv _rollback _rollback_old
mv _production _rollback
mv _site _production
rm -rf _rollback_old
echo "Deploy Complete"
exit
EOF
    commands = commands.gsub(/\n/, "; ")
    ssh.exec commands
  end
end