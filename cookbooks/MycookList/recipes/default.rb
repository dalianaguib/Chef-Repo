#
# Cookbook:: MycookList
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

script "list_org" do
  interpreter "bash"
  user "root"
  group "root"
  cwd "/tmp"
  code <<-EOH

Token="$(cat /etc/myconf.conf)"
Output=$(curl -b -I -k -H 'Accept:application/*+xml;version=5.6' -H 'Content-Type:application/vnd.vmware.admin.organization+xml' -H '$Token' -X GET https://172.16.15.18/api/org)
org="$(echo $Output | grep name | cut -d " " -f 7 | sed 's/.*=//' | cut -d '"' -f2)"
echo $org > /home/devops/tmp/list
EOH
end
