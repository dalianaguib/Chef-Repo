#
# Cookbook:: Att
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

ENV['MY_VAR'] = node['Att']['myvar']

file '/etc/motd' do
	
	content "my variable is this: #{ENV['MY_VAR']}"

end


