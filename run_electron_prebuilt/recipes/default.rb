#
# Cookbook Name:: nodejs-setup
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_package [
  'xvfb',
  'libgtk2.0-0',
  'libgdk-pixbuf2.0-0',
  'libfontconfig1',
  'libxrender1',
  'libx11-6',
  'libglib2.0-0',
  'libxft2',
  'libfreetype6',
  'libc6',
  'zlib1g',
  'libpng12-0',
  'libstdc++6-4.8-dbg-arm64-cross',
  'libgcc1',
  'libgconf2-4',
  'libnss3-1d',
  'libxss1',
  'libxtst6',
  'libasound2'
] do
  action :install
end
