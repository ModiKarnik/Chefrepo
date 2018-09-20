#Packages

packages = ['apache2', 'mysql-server', 'php', 'libapache2-mod-php', 'php-mcrypt', 'php-mysql']

packages.each do |pckg|
  apt_package pckg do
    action :install
  end
end
