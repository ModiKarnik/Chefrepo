#This is a Chef recipe file. It can be used to specify resources which will
#apply configuration to a server.

log "Welcome to Chef, #{node["starter_name"]}!" do
  level :info
end

execute "apt update"

#log "Welcome to Chef, Karnik" do
#  level :info
#end

file "/tmp/file1" do
  action :create
  content "Hello Canada"
end

package "ntp"
service "ntp" do
  action :start
end

package "lynx"



# For more information, see the documentation: https://docs.chef.io/essentials_cookbook_recipes.html
