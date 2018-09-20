template "/var/www/html/custom2.html" do
  source "custom2.html.erb"
  variables({
    :samplerecipevariable => node['sampleattributevariable'],
  })
end 

