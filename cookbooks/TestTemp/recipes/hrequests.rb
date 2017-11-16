


template '/etc/new.conf' do
  owner "root"
  group "root"
  mode "0644"
  source "TestTemp.txt.erb"
  variables(


  # my_id: Chef::HTTP.new('https://172.16.15.18/').post('/api/sessions/', {'user-principal' => '{"userName":"administrator@System","password":"R@ya1000"}'},{'Accept' => 'application/*+xml;version=5.6'})
   

#   my_id: Chef::HTTP.new('http://services.groupkt.com/').get('/country/get/iso2code/IN') 
#
       my_id: Chef::HTTP.new('https://172.16.15.18/').post('/api/sessions/',{ 'user-principal' => '{"userName":"administrator@System","password":"R@ya1000"}', 'Accept' => 'application/*+xml;version=5.6', 'Content-Type' => 'application/json' }).to_json

        
 )
end
