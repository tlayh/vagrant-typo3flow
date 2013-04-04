#
# Cookbook:: typo3-flow
# Recipe:: default.rb
#
# Copyright 2013, Thomas Layh
#
# Version 0.1
#
# Install a blank TYPO3Flow + Welcome Package + DevStuff


include_recipe "apache2"
['rewrite', 'deflate', 'php5', 'headers', 'expires', 'status', 'negotiation', 'setenvif'].each do |mod|
	include_recipe "apache2::mod_#{mod}"
end

include_recipe "php::package"
['apc', 'curl', 'gd', 'mysql', 'sqlite3'].each do |mod|
	include_recipe "php::module_#{mod}"
end

include_recipe "mysql::server"
include_recipe "git"
include_recipe "typo3-flow::basic"

# setup host
cookbook_file "/etc/apache2/sites-available/typo3.flow" do
	source "typo3.flow"
	mode 0755
end

# prepare php.ini config
cookbook_file "/etc/php5/conf.d/php_dateTimeZone.ini" do
	source "php_dateTimeZone.ini"
	mode 0655
end
execute "restart apache" do
	command "/etc/init.d/apache2 reload"
end

# enable host and disable default host
apache_site "000-default" do
	enable false
end
apache_site "typo3.flow" do
	enable true
end

# clone and install typo3flow
execute "clone typo3.flow base" do
	command "git clone git://git.typo3.org/FLOW3/Distributions/Base.git /var/www/typo3.flow"
	creates "/var/www/typo3.flow/"
end

execute "get composer" do
	command "curl -s https://getcomposer.org/installer | php"
	cwd "/var/www/typo3.flow"
end

execute "install TYPO3.Flow" do
	command "php composer.phar install --dev"
	cwd "/var/www/typo3.flow"
end

execute "fixing permissions" do
	command "Packages/Framework/TYPO3.Flow/Scripts/setfilepermissions.sh vagrant vagrant www-data"
	cwd "/var/www/typo3.flow/"
end