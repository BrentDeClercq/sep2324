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
# Get the vars
source /vagrant/vars.sh
#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

log "Starting server specific provisioning tasks on ${HOSTNAME}"

log "Start installatie DB"

source ${PROVISIONING_SCRIPTS}/db.sh

log "Web install"

# Network settings
sudo ifconfig eth1 $IP_WEB netmask $NETMASK_WEB
sudo systemctl restart NetworkManager

log "Installing Apache"
sudo dnf update -y
sudo dnf install httpd -y

log "Enabling httpd/Apache"
sudo systemctl enable --now httpd

log "Allow http in firewall"
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload


log "Installing CMS and Dependencies: Wordpress"

sudo dnf install php php-mysqlnd tar -y

cd /tmp
# Download wordpress
sudo curl https://wordpress.org/latest.tar.gz --output wordpress.tar.gz
tar -xf wordpress.tar.gz
# Copy wordpress to apache
sudo cp -r wordpress /var/www/html/
# Set permissions
sudo chown -R apache:apache /var/www/html/wordpress
sudo chcon -R -t httpd_sys_rw_content_t /var/www/html/wordpress
# Copy wordpress config to apache
sudo cp /vagrant/configs/wordpress/wordpress.conf /etc/httpd/conf.d/wordpress.conf


# Configure wordpress so it can reach the database
# Copy template
sudo cp /var/www/html/wordpress/wp-config-sample.php $wp_config_path

# Use sed to replace the database settings
sudo sed -i "s/define( 'DB_NAME', '.*' );/define( 'DB_NAME', '$db_name' );/" $wp_config_path

sudo sed -i "s/define( 'DB_USER', '.*' );/define( 'DB_USER', '$db_user' );/" $wp_config_path

sudo sed -i "s/define( 'DB_PASSWORD', '.*' );/define( 'DB_PASSWORD', '$db_user_passwd' );/" $wp_config_path

sudo sed -i "s/define( 'DB_HOST', '.*' );/define( 'DB_HOST', '$IP_DATABASE' );/" $wp_config_path

# Zorg ervoor dat httpd verbinding mag maken met een database
sudo setsebool -P httpd_can_network_connect_db on

# Restart apache
sudo systemctl restart httpd


# Network settings
sudo ifconfig eth1 $IP_WEB netmask $NETMASK_WEB
sudo systemctl restart NetworkManager

sudo ip route del default
sudo ip route add default via 192.168.106.241 dev eth1
