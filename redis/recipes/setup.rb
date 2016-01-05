#
# Cookbook Name:: redis
# Recipe:: setup
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install by platform
case node['platform_family']


when 'debian'
  log 'Installing Redis with debian'
  releaseUrlPrefix = node['redis']['release_url_prefix']
  version = node['redis']['version']
  extractFileSetup = ['redis-', version].join('')
  compressFileSetup = [extractFileSetup, '.tar.gz'].join('')
  releaseUrl = [releaseUrlPrefix, compressFileSetup].join('')

  bash "setup Redis" do
    code <<-EOH
      cd ~/
      wget #{releaseUrl}
      tar xzf #{compressFileSetup}
      cd #{extractFileSetup}
      make

      sudo cp src/redis-server /usr/local/bin/
      sudo cp src/redis-cli /usr/local/bin/
      sudo apt-get install redis-server -y
      sudo rm -rf ~/#{compressFileSetup}
      sudo rm -rf ~/#{extractFileSetup}
      EOH
  end

  apt_package 'redis-server'
else
  log 'Not supported yet!'
end
