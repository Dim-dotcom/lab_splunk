## Ajoutez ici les commandes pour installer l'indexer
sudo tar -xvf splunk-9.0.1-82c987350fde-Linux-x86_64.tgz -C /opt
touch /opt/splunk/etc/system/local/user-seed.conf
echo '[user_info]' > /opt/splunk/etc/system/local/user-seed.conf
echo 'USERNAME = admin' >> /opt/splunk/etc/system/local/user-seed.conf
echo 'PASSWORD = formation' >> /opt/splunk/etc/system/local/user-seed.conf
sed -i 's/^serverName = .*/serverName = indexer/' /opt/splunk/etc/system/local/user-seed.conf

sudo useradd splunk 

sudo chown -R splunk:splunk /opt/splunk

sudo su splunk -c '/opt/splunk/bin/splunk enable boot-start --accept-license --answer-yes --no-prompt'

sudo su splunk -c '/opt/splunk/bin/splunk start'

sudo su splunk -c '/opt/splunk/bin/splunk enable listen 9997'

sudo su splunk -c '/opt/splunk/bin/splunk restart'