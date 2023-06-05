## Ajoutez ici les commandes pour installer le search_head
wget -O splunk-9.0.1-82c987350fde-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.0.1/linux/splunk-9.0.1-82c987350fde-Linux-x86_64.tgz"


sudo tar -xvf splunk-9.0.1-82c987350fde-Linux-x86_64.tgz -C /opt
touch /opt/splunk/etc/system/local/user-seed.conf
echo '[user_info]' > /opt/splunk/etc/system/local/user-seed.conf
echo 'USERNAME = admin' >> /opt/splunk/etc/system/local/user-seed.conf
echo 'PASSWORD = formation' >> /opt/splunk/etc/system/local/user-seed.conf
sed -i 's/^serverName = .*/serverName = search_head/' /opt/splunk/etc/system/local/user-seed.conf
echo "-------SERVER NAME AND USER CREATION DONE-------"




sudo /opt/splunk/bin/splunk enable boot-start --accept-license --answer-yes --no-prompt
sudo useradd splunk 
echo "-------SPLUNK USER CREATED-------"

sudo chown -R splunk:splunk /opt/splunk
echo "-------GAVE APPROPRIATE RIGHTS-------"

sudo su splunk -c '/opt/splunk/bin/splunk add search-server https://192.168.33.11:8089 -auth admin:formation -remote'

sudo su splunk -c '/opt/splunk/bin/splunk restart --accept-license --answer-yes --no-prompt'