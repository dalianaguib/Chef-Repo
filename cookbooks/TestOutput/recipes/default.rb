#
# Cookbook:: TestOutput
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
template '/etc/test.conf'
	source 'test.txt.erb'
	owner 'root'
	group 'root'
	variables(
        my_id: node['greeting']
        )
end
