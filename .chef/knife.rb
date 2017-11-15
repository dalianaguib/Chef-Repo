# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "ahmed"
client_key               "#{current_dir}/ahmed.pem"
chef_server_url          "https://chef-server/organizations/rayaorg"
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:vsphere_host] = "vcenter.devops"
knife[:vsphere_user] = "administrator@vsphere.local" # Domain logins may need to be "user@domain.com"
knife[:vsphere_pass] = "R@ya1000"       # or %Q(mypasswordwithfunnycharacters)
knife[:vsphere_dc] = "Datacenter"
knife[:vsphere_insecure] = true
ssl_verify_mode    :verify_none

