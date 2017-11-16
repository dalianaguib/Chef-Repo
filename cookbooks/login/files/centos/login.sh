#! /bin/bash
vCloudIP="172.16.15.18"
vCloud_Admin="administrator@System"
vCloud_Password="R@ya1000"

output="$(curl -I -k -H "Accept:application/*+xml;version=5.6" -u "$vCloud_Admin:$vCloud_Password" -X POST https://172.16.15.18/api/sessions)"
Status="$(echo "${output}" | awk '/^HTTP/{print $2}')"
Token="$(echo "${output}" | awk '/^x-vcloud-authorization/{print $2}')"
echo $Token > /home/devops/tmp/token
echo $Status > /home/devops/tmp/stat



#end
