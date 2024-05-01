#! /bin/bash
#
# Provisioning script for enigma

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

# Enable "Bash strict mode"
set -o errexit   # abort on nonzero exit status
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
source /vagrant/vars.sh

#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

log "Starting server specific provisioning tasks on ${HOSTNAME}"

# Network settings
sudo ifconfig eth1 ${IP_TFTP} netmask ${NETMASK_TFTP}
sudo ifconfig eth2 ${IP_WEB} netmask ${NETMASK_WEB}

log "Installing tftp-server and tftp"
sudo dnf install -y tftp-server tftp
sudo cp /usr/lib/systemd/system/tftp.service /etc/systemd/system/tftp-server.service
sudo cp /usr/lib/systemd/system/tftp.socket /etc/systemd/system/tftp-server.socket

sudo tee /etc/systemd/system/tftp-server.service<<EOF
[Unit]
Description=Tftp Server
Requires=tftp-server.socket
Documentation=man:in.tftpd

[Service]
ExecStart=/usr/sbin/in.tftpd -c -p -s /var/lib/tftpboot
StandardInput=socket

[Install]
WantedBy=multi-user.target
Also=tftp-server.socket
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now tftp-server
sudo chmod 777 /var/lib/tftpboot

sudo firewall-cmd --add-service=tftp --permanent
sudo firewall-cmd --reload

# Test files
sudo touch  /var/lib/tftpboot/file{1..3}.txt
echo "Hello File 1" | sudo tee /var/lib/tftpboot/file1.txt
echo "Hello File 2" | sudo tee /var/lib/tftpboot/file2.txt
echo "Hello File 3" | sudo tee /var/lib/tftpboot/file3.txt

sudo cp /vagrant/configs/tftp/* /var/lib/tftpboot/
sudo systemctl restart tftp-server

# Install Apache and Wordpress
log "Installing Apache"
sudo dnf update -y
sudo dnf install httpd -y
log "Enabling httpd/Apache"
sudo systemctl enable --now httpd

# Allow http in firewall
log "Allowing http in firewall"
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload

# Install PHP and MySQL for Wordpress
log "Installing PHP and MySQL"
sudo dnf install php php-mysqlnd tar -y

# Download and configure Wordpress
log "Downloading Wordpress"
cd /tmp
sudo curl https://wordpress.org/latest.tar.gz --output wordpress.tar.gz
tar -xf wordpress.tar.gz
sudo cp -r wordpress /var/www/html/
sudo chown -R apache:apache /var/www/html/wordpress
sudo chcon -R -t httpd_sys_rw_content_t /var/www/html/wordpress
sudo cp /vagrant/configs/wordpress/wordpress.conf /etc/httpd/conf.d/wordpress.conf

# Configure Wordpress to connect to the database
log "Configuring Wordpress"
sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sudo sed -i "s/define( 'DB_NAME', '.*' );/define( 'DB_NAME', '$db_name' );/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/define( 'DB_USER', '.*' );/define( 'DB_USER', '$db_user' );/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/define( 'DB_PASSWORD', '.*' );/define( 'DB_PASSWORD', '$db_user_passwd' );/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/define( 'DB_HOST', '.*' );/define( 'DB_HOST', '$IP_DATABASE' );/" /var/www/html/wordpress/wp-config.php

# Allow Apache to connect to the database
sudo setsebool -P httpd_can_network_connect_db on

# Restart Apache
sudo systemctl restart httpd

log "Provisioning of ${HOSTNAME} complete"
