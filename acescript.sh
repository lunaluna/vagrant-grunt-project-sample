#!/usr/bin/env bash

# Update the box
# --------------
# Downloads the package lists from the repositories
# and "updates" them to get information on the newest
# versions of packages and their dependencies
apt-get update

# Install Vim
apt-get install -y vim

# Apache
# ------
# Install
apt-get install -y apache2
# Add ServerName to httpd.conf
echo "ServerName localhost" > /etc/apache2/httpd.conf
# Setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
  DocumentRoot "/vagrant/www/dev"
  ServerName localhost
  <Directory "/vagrant/www/dev">
    AllowOverride All
    Require all granted
  </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-enabled/000-default
# Enable mod_rewrite
a2enmod rewrite
# Restart apache
service apache2 restart

# PHP 5.4
# -------
apt-get install -y libapache2-mod-php5
# Add add-apt-repository binary
apt-get install -y python-software-properties
# Install PHP 5.4
add-apt-repository ppa:ondrej/php5
# Update
apt-get update

# PHP stuff
# ---------
# Command-Line Interpreter
apt-get install -y php5-cli
# MySQL database connections directly from PHP
apt-get install -y php5-mysql
# cURL is a library for getting files from FTP, GOPHER, HTTP server
apt-get install -y php5-curl
# Module for MCrypt functions in PHP
apt-get install -y php5-mcrypt
# Module for json functions in PHP
apt-get install -y php5-json
# activate mcrypt (bug)
php5enmod mcrypt
service apache2 restart

# Install cURL
# ------------
apt-get install -y curl

# Install Git
# -----------
apt-get install -y git-core

# Install Ruby
# -----------

sudo apt-get install -y ruby1.9.3

sudo apt-get install rubygems

sudo gem install rubygems-update
sudo gem update

# Install Sass
# -----------
gem install sass

# Install Compass
# -----------
gem install compass

# Install Node js
# ---------------
apt-get install -y python-software-properties python g++ make
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs

# Upgrade NPM
# -----------
npm update -g npm

# Install Grunt
# -------------
npm install -g grunt-cli
