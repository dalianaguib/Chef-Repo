#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


cookbook_file "/home/devops/deploy/main.sh" do
  source "main.sh"
  mode 0755
end

template '/home/devops/tmp/Token' do
 source 'Login.erb'
 owner 'root'
 group 'root'
 variables lazy { {TOKEN: shell_out!('bash /home/devops/deploy/main.sh').stdout} }
end


