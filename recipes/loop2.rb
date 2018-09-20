packages = ['vim', 'git', 'curl']

packages.each do |xyz|
 apt_package xyz do
   action :install
 end
end
