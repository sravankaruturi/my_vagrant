#
# Cookbook Name:: mdot
# Recipe:: default
#
# Copyright 2014, MySmartPrice
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "nginx"
include_recipe "mysql::server"
include_recipe "php-fpm"


template "nginx-site.config" do
    path "#{node[:nginx][:dir]}/sites-available/default"
    source "nginx-site.config.erb"
    owner "root"
    group "root"
    mode 0644
    action :create
end

service "nginx" do
    action :restart
end
