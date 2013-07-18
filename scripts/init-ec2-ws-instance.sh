#!/bin/bash

# Update the repos
sudo apt-get update
# Install Apache2, PHP and Apache2 PHP Module
sudo apt-get install apache2 php5 libapache2-mod-php5 git

# Config the web server and deploy the web content
mkdir -p venture-site/public_html
cd venture-site/public_html
git clone https://github.com/stryker33/venture-site.git
cp -vrf venture-site/* ~/venture-site/public_html/
rm -vrf venture-site

cd $HOME
git clone https://github.com/stryker33/venture-config.git
cd venture-config
sudo cp -vf venture /etc/apache2/sites-available/
sudo a2dissite default && sudo a2ensite venture && sudo service apache2 restart

exit 0
