#
# Cookbook:: lamp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute "apt update"

package "apache2"
package "mysql-server"
package "php"

service "apache2" do
  action :start
end

service "mysql" do
  action :start
end

file "/var/www/html/index.html" do
  action :create
  content "Hello world"
end











