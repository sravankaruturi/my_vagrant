node.set["apache"]["user"]  = "vagrant"
node.set["apache"]["group"] = "vagrant"

node.set['mysql']['server_root_password'] = "root"
node.set['mysql']['server_debian_password'] = "root"
node.set['mysql']['server_repl_password'] = "root"

node.set['mysql']['bind_address'] = node[:app][:ip]
node.set['mysql']['allow_remote_root'] = true;

include_recipe "apt"

# Register PHP 5.4 PPA repository
# apt_repository "php54" do
#   uri "http://ppa.launchpad.net/ondrej/php5/ubuntu"
#   distribution node['lsb']['codename']
#   components ["main"]
#   keyserver "keyserver.ubuntu.com"
#   key "E5267A6C"
# end

# delete the default apache lock files
directory "/var/lock/apache2" do
  action :delete
end

include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_ssl"

include_recipe "php"
include_recipe "composer"

include_recipe "redisio"
include_recipe "redisio::install"
include_recipe "redisio::enable"

include_recipe "mysql::server"

package "git-core"
package "imagemagick"
package "sqlite"
package "vim"

package "php5-cli"
package "php5-curl"
package "php5-gd"
package "php5-mcrypt"
package "php5-mysql"
package "php5-imagick"
package "php5-sqlite"

gem_package "less"
gem_package "sass"
gem_package "compass"

template "/etc/php5/apache2/conf.d/custom_conf.ini" do
  source "php.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables({
    :php_timezone => node[:app][:php_timezone]
  })
end

template "/etc/php5/cli/conf.d/custom_conf.ini" do
  source "php.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables({
    :php_timezone => node[:app][:php_timezone]
  })
end

file "/etc/php5/apache2/conf.d/upload_path.ini" do
  owner "root"
  group "root"
  content "upload_tmp_dir = /tmp/web-app"
  action :create
end



apache_site "000-default" do
  enable false
end

web_app "localhost" do
  server_name node[:app][:server_name]
  server_aliases node[:app][:server_aliases]
  docroot node[:app][:docroot]
  php_timezone node[:app][:php_timezone]
end

group "vboxsf" do
  members 'vagrant'
  append true
end
