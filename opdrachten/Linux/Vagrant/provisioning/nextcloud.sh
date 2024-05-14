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


# Download and extract Nextcloud
log "Downloading and extracting Nextcloud..."
if ! [ -f "/home/vagrant/latest.tar.bz2" ]; then
  wget -q https://download.nextcloud.com/server/releases/latest.tar.bz2
  sudo tar -xjf latest.tar.bz2 -C /var/www/html/
fi

sudo chown -R apache:apache /var/www/html/nextcloud/
sudo chmod -R 755 /var/www/html/nextcloud/

log "Downloaded, extracted and moved"


log "Copying configs"

sudo rm -r /var/www/html/nextcloud/config/
sudo cp -r /vagrant/configs/nextcloud/* /var/www/html/nextcloud/

log "Change configs according to vars"
sudo sed -i "s/'dbtype' => .*,/'dbtype' => 'mysql',/g" /var/www/html/nextcloud/config/config.php
sudo sed -i "s/'dbhost' => .*,/'dbhost' => '$IP_DATABASE',/g" /var/www/html/nextcloud/config/config.php
sudo sed -i "s/'dbname' => .*,/'dbname' => '$nc_db_name',/g" /var/www/html/nextcloud/config/config.php
sudo sed -i "s/'dbuser' => .*,/'dbuser' => '$nc_db_user',/g" /var/www/html/nextcloud/config/config.php
sudo sed -i "s/'dbpassword' => .*,/'dbpassword' => '$nc_db_user_passwd',/g" /var/www/html/nextcloud/config/config.php

sudo chown -R apache:apache /var/www/html/
sudo chmod -R 755 /var/www/html/
sudo chcon -R -t httpd_sys_rw_content_t /var/www/html/

# Set SELinux permissions
log "Selinux settings"

sudo setsebool -P httpd_can_network_connect_db on
# sudo semanage fcontext -d '/var/www/html/nextcloud(/.*)?'
# sudo semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud(/.*)?'

if ! semanage fcontext -l | grep -q '/var/www/html/nextcloud(/.*)?'; then
  sudo semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud(/.*)?'
fi

sudo restorecon -Rv /var/www/html/nextcloud/ 2>&1 /dev/null
sudo chmod -R 755 /var/www/html/nextcloud/

# Set up Apache 
sudo tee /etc/httpd/conf.d/nextcloud.conf > /dev/null <<EOF
Alias / "/var/www/html/nextcloud/"

<Directory /var/www/html/nextcloud/>
    Require all granted
    AllowOverride All
    Options FollowSymLinks MultiViews

    <IfModule mod_dav.c>
        Dav off
    </IfModule>
</Directory>
EOF

sudo -u apache php /var/www/html/nextcloud/occ files:scan --all

# Restart Apache
sudo systemctl restart httpd

sudo restorecon -Rv /var/www/html/nextcloud/ 2>&1 /dev/null




sudo ifconfig eth1 ${IP_NEXTCLOUD} netmask ${NETMASK_SERVERS}
sudo ip route del default
sudo ip route add default via 192.168.106.241 dev eth1
sudo systemctl restart NetworkManager

echo "Nextcloud installation completed successfully."