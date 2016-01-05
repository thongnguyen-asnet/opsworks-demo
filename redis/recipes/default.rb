#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Set up
include_recipe 'redis::setup'

include_recipe 'redis::config'

# Restart service
service "redis-server" do
  action [:reload, :stop, :start]
end
