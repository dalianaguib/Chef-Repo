file '/etc/token' do
 owner 'devops'
 group 'devops'
 mode '0644'
 action  :create

end


ruby_block "ex_command" do
   vcloudip = node['nodeip']
   vcloudusername = node['username']
   vcloudpass = node['nodepassword']
   block do
     Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
     command = "curl -i -k -H Accept:application/*+xml;version=5.6 -u #{vcloudusername}:#{vcloudpass} -X POST  https://#{vcloudip}/api/sessions | grep x-vcloud-authorization |  cut -d' ' -f2"
     #command = "echo #{vcloudusername} #{vcloudpass}"
     command_out = shell_out(command)
     node.default['vcloudtoken'] = command_out.stdout
     node.default['mystr'] = 'ayy kalam'
   end
   action :create
end

template '/etc/test.conf' do
 source 'TestTemp.txt.erb'
 owner 'root'
 group 'root'
 variables(
     nodeip: node['nodeip'],
     username: node['username'],
     nodepassword: node['nodepassword'],
     vcloudtoken: node['vcloudtoken'],
     mystr: node['mystr']
          
 )

end



bash 'create new group' do
  user "devops"
  group "devops"
  code <<-EOH
           #! /bin/bash
           vCloudIP = #{node['nodeip']}     
           vCloud_Admin = #{node['username']}
           vCloud_Password = #{node['nodepassword']}
           vcloud_token = "curl -i -k -H "Accept:application/*+xml;version=5.6" -u "$vCloud_Admin:$vCloud_Password" -X POST  https://$vCloudIP/api/sessions"

            echo  #{node['vCloud_Password']} > /etc/token



EOH
end


