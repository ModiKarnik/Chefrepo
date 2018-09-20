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


