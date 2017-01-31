#!/bin/bash -v
hostname=`hostname`
cd ~
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt-get update
apt-get -y install puppet-agent unzip
sed -i "s/^127.0.0.1 .*$/127.0.0.1 localhost $hostname/g" /etc/hosts
echo "server = puppet.aws-prod.XXXX.com" >> /etc/puppetlabs/puppet/puppet.conf
service puppet-agent restart
/opt/puppetlabs/bin/puppet agent -t
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
