#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

cookbook_file "/home/devops/deploy/login.sh" do
  source "login.sh"
  mode 0755
end

execute "login" do
  command "sh /home/devops/deploy/login.sh"
end
