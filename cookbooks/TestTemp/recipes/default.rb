#
# Cookbook:: TestTemp
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
template '/etc/test.conf' do
 source 'TestTemp.txt.erb'
 owner 'root'
 group 'root'
 variables(
   greeting: node['greeting']
 )

end
