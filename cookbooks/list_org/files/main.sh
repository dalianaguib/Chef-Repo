 #!/bin/bash

vcloud_ip="172.16.15.18"
vcloud_user="administrator@System"
vcloud_pass="R@ya1000"
curl -i -k -H "Accept:application/*+xml;version=5.6" -u "$vcloud_user:$vcloud_pass" -X POST https://$vcloud_ip/api/sessions | grep "x-vcloud-authorization"
