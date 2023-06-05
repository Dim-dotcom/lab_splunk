##!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2


## Ajoutez ici les commandes pour installer l'universal forwarder

tar -xvf splunkforwarder-9.0.1-82c987350fde-Linux-x86_64.tgz -C /opt

echo '[user_info]' > /opt/splunkforwarder/etc/system/local/user-seed.conf
echo 'USERNAME = admin' >> /opt/splunkforwarder/etc/system/local/user-seed.conf
echo 'PASSWORD = formation' >> /opt/splunkforwarder/etc/system/local/user-seed.conf

sed -i 's/^serverName = .*/serverNale = unversal_forwarder/' /opt/splunkforwarder/etc/system/local/user-seed.conf

sudo useradd splunk

sudo chown -R splunk:splunk /opt/splunkforwarder 

sudo /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --no-prompt

sudo /opt/splunkforwarder/bin/splunk add forward-server 192.168.33.11:9997

sudo /opt/splunkforwarder/bin/splunkadd monitor /var/log/apache2 -index main --sourcetype ApacheAccess 

sudo /opt/splunkforwarder/bin/splunk restart --accept-license --answer-yes --no-prompt