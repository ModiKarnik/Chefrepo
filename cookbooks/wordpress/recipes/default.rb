#
# Cookbook:: wordpress
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Packages

packages = ['apache2', 'mysql-server', 'php', 'libapache2-mod-php', 'php-mcrypt', 'php-mysql']

packages.each do |pckg|
  apt_package pckg do
    action :install
  end
end

#Service

service "apache2" do
  action :start
end

service "mysql" do
  action :start
end

#DB

execute "mysqladmin" do
  command "mysqladmin -u root password 123@India && touch /tmp/test1"
  not_if {File.exists?("/tmp/test1")}
end

cookbook_file "/tmp/mysqlcommands" do
  source "mysqlcommands"
end

execute "mysqlroot" do
  command "mysql -uroot -p123@India < /tmp/mysqlcommands && touch /tmp/test2"
  not_if {File.exists?("/tmp/test2")}
end

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






 
