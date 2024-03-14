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
sudo ifconfig eth1 $IP_DATABASE netmask $NETMASK_DATABASE

log "Installing MariaDB server"

sudo dnf install -y mariadb-server

sudo systemctl enable --now mariadb


# Firewall settings
sudo firewall-cmd --zone=public --add-port=22/tcp --permanent
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent

sudo firewall-cmd --reload

# Connections
if [ -f "${db_config_path}" ] && [ -r "${db_config_path}" ]; then

    sudo sed -i "s/^bind-address\s*=.*$/bind-address = ${db_bind_address}/" /etc/my.cnf.d/mariadb-server.cnf

    sudo systemctl restart mariadb
    echo "Het bind-address in mariadb-server.cnf is gewijzigd naar ${db_bind_address}"
else
    echo "Fout: Kan mariadb-server.cnf niet vinden of het is niet leesbaar."
fi