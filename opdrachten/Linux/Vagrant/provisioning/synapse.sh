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
sudo ifconfig eth1 ${IP_SYNAPSE} netmask ${NETMASK_SERVERS}
sudo systemctl restart NetworkManager

# sudo ip route del default
# sudo ip route add default via 192.168.106.241 dev eth1

#!/bin/bash

log "Updating and installing packages..."
# Update system
sudo dnf update -y

# Install required packages

sudo dnf install python3 python3-devel python3-pip libffi-devel postgresql-devel openssl-devel -y
pip3 install virtualenv

sudo dnf group install "Development Tools" -y

sudo firewall-cmd --permanent --add-service http
sudo firewall-cmd --permanent --add-service https
sudo firewall-cmd --permanent --add-port=8448/tcp
sudo firewall-cmd --reload

log "Packages installed"

# Install Synapse home server and prepare environment
log "Installing setuptools..."

pip3 install --user virtualenv

mkdir -p ~/synapse
python3 -m venv ~/synapse/env
source ~/synapse/env/bin/activate

pip install --upgrade pip virtualenv six packaging appdirs

pip install --upgrade setuptools

log "setuptools installed"


# Configuring synapse
log "Installing and configuring synapse"

python3 -m venv ~/synapse/env
source ~/synapse/env/bin/activate
pip install -U matrix-synapse
~/synapse/env/bin/python3 -m pip install --upgrade pip
cd ~/synapse
python3 -m synapse.app.homeserver --server-name matrix.tenurit.com --config-path homeserver.yaml --generate-config --report-stats=yes
  
log "synapse installed and configurations are done"



# Enabling TLS

log "enabling TLS and installing..."

sudo dnf install -y epel-release
sudo dnf install -y snapd
sudo systemctl restart snapd

ls -l /run/snapd.socket
sudo snap install core
sudo snap refresh core

sudo ln -s /var/lib/snapd/snap /snap
sudo snap install --classic certbot
sudo ln -s  /snap/bin/certbot /usr/bin/certbot 

sudo dnf install nginx -y

sudo certbot --nginx --non-interactive --agree-tos -m rayane.yousti@student.hogent.be -d matrix.tenurit.com


log "TLS enabled"

# IPROUTE
sudo ifconfig eth1 ${IP_SYNAPSE} netmask ${NETMASK_SERVERS}
sudo ip route del default
sudo ip route add default via 192.168.106.241 eth1
sudo systemctl restart NetworkManager

echo "Synapse installation completed succesfully."

