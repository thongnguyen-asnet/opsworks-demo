#
# Cookbook Name:: redis
# Recipe:: config
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Create redis config folder
directory '/etc/redis' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# Update Redis config
template "#{node[:redis][:conf_dir]}/redis.conf" do
  source        "default.conf.erb"
  owner         "root"
  group         "root"
  mode          "0755"
  variables     :redis => node[:redis], :redis_server => node[:redis][:server]
end
