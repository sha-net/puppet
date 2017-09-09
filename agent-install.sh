     release=`lsb_release -cs`
     environment="shavit"
     server="puppet-server"
     sudo wget https://apt.puppetlabs.com/puppetlabs-release-pc1-${release}.deb
     sudo dpkg -i puppetlabs-release-pc1-${release}.deb
     sudo apt-get update
     sudo apt-get -y install puppet-agent
     sudo echo "server = ${server}" >> /etc/puppetlabs/puppet/puppet.conf
     sudo echo "ceertname = shavit.test.il-tlv.staging.10" >> /etc/puppetlabs/puppet/puppet.conf
     sudo echo "environment = ${environment}" >> /etc/puppetlabs/puppet/puppet.conf
     sudo mkdir /etc/puppetlabs/code/environments/${environment}
     sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
