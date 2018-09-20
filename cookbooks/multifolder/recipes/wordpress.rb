#wordpress

remote_file "wordpress_latest" do
  source "http://wordpress.org/latest.tar.gz"
  path "/tmp/latest.tar.gz"
end

execute "extract" do
  cwd "/tmp"
  command "tar -xvzf latest.tar.gz"
  not_if {File.exists?("/tmp/wordpress/wp-cron.php")}
end

execute "copy" do
  command "cp -r /tmp/wordpress/* /var/www/html/"
  not_if {File.exists?("/var/www/html/wp-cron.php")}
end

cookbook_file "/var/www/html/wp-config.php" do
  source "wp-config.php"
end

file "/var/www/html/index.html" do
  action :delete
end


