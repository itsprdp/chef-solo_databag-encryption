 
# This is where you will store a copy of your key on the chef-client
#secret = Chef::EncryptedDataBagItem.load_secret("/etc/chef/encrypted_data_bag_secret")
 
# This decrypts the data bag contents of "mysecrets->marioworld" and uses the key defined at variable "secret"
#luigi_keys = Chef::EncryptedDataBagItem.load("mysecrets", "marioworld", secret)
 
file "/tmp/databag" do
     content "Test file"
     owner "root"
     mode  "0644"
     action :create
end

mysql_creds = Chef::EncryptedDataBagItem.load("passwords", "mysql")
root_pw = mysql_creds["root"]
monitoring_pw = mysql_creds["monitoring"]
Chef::Log.info("The root mysql password is: ‘#{root_pw}’")
Chef::Log.info("The mysql monitoring password is: ‘#{monitoring_pw}’")