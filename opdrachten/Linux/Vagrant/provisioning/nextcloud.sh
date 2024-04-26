#! /bin/bash
#
# Provisioning script for srv001

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

# Enable "Bash strict mode"
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't mask errors in piped commands

#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------

# Location of provisioning scripts and files
export readonly PROVISIONING_SCRIPTS="/vagrant/provisioning/"
# Location of files to be copied to this server
export readonly PROVISIONING_FILES="${PROVISIONING_SCRIPTS}/files/${HOSTNAME}"


#------------------------------------------------------------------------------
# "Imports"
#------------------------------------------------------------------------------

# Actions/settings common to all servers
source ${PROVISIONING_SCRIPTS}/common.sh
source "/vagrant/vars.sh"
#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

log "Starting server specific provisioning tasks on ${HOSTNAME}"

# Network settings
sudo ifconfig eth1 ${IP_NEXTCLOUD} netmask ${NETMASK_SERVERS}
sudo systemctl restart NetworkManager

# sudo ip route del default
# sudo ip route add default via 192.168.106.241 dev eth1


#!/bin/bash

log "Updating and installing packages..."
# Update system
sudo dnf update -y

# Install required packages
sudo dnf install -y httpd php php-ctype php-curl php-dom php-gd php-libxml php-mbstring php-posix php-session php-simplexml php-xmlreader php-xmlwriter php-zip php-zlib php-pdo_mysql
log "Packages installed"

sudo systemctl start httpd
sudo systemctl enable httpd

sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload


# sudo setenforce 0 
# sudo chown -R apache:apache /var/www/html/
# sudo chmod -R 755 /var/www/html/
# sudo chcon -R -t httpd_sys_rw_content_t /var/www/html/


# Download and extract Nextcloud
log "Downloading and extracting Nextcloud..."
wget https://download.nextcloud.com/server/releases/latest.tar.bz2 
sudo tar -xjf latest.tar.bz2 -C /var/www/html/
sudo chown -R apache:apache /var/www/html/nextcloud/
sudo chmod -R 755 /var/www/html/nextcloud/
log "Downloaded"

# # Configure Apache for Nextcloud
# echo "Configuring Apache for Nextcloud..."
# sudo cp /var/www/html/nextcloud/config/config.sample.php /var/www/html/nextcloud/config/config.php
# sudo sed -i "s/'dbtype' => 'sqlite3'/'dbtype' => 'mysql'/g" /var/www/html/nextcloud/config/config.php
# sudo sed -i "s/'dbhost' => .*,/'dbhost' => '$IP_DATABASE',/g" /var/www/html/nextcloud/config/config.php
# sudo sed -i "s/'dbname' => .*,/'dbname' => '$nc_db_name',/g" /var/www/html/nextcloud/config/config.php
# sudo sed -i "s/'dbuser' => .*,/'dbuser' => '$nc_db_user',/g" /var/www/html/nextcloud/config/config.php
# sudo sed -i "s/'dbpassword' => .*,/'dbpassword' => '$nc_db_user_passwd',/g" /var/www/html/nextcloud/config/config.php
 
# sudo rm /var/www/html/nextcloud/config/config.php
# sudo cp /vagrant/configs/nextcloud/config.php /var/www/html/nextcloud/config/config.php

# Set SELinux permissions
#sudo semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/data(/.*)?' 2>&1 /dev/null
#sudo semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/config(/.*)?' 2>&1 /dev/null
sudo restorecon -Rv /var/www/html/nextcloud/ 2>&1 /dev/null
sudo chmod -R 755 /var/www/html/nextcloud/

# Set up Apache virtual host
sudo tee /etc/httpd/conf.d/nextcloud.conf > /dev/null <<EOF
Alias /nextcloud "/var/www/html/nextcloud/"

<Directory /var/www/html/nextcloud/>
  Require all granted
  AllowOverride All
  Options FollowSymLinks MultiViews

 <IfModule mod_dav.c>
  Dav off
 </IfModule>
</Directory>
EOF
# Restart Apache
sudo systemctl restart httpd

sudo restorecon -Rv /var/www/html/nextcloud/ 2>&1 /dev/null

echo "Nextcloud installation completed successfully."
