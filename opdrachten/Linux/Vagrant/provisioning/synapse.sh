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
sudo ifconfig eth1 ${IP_ADDRESS} netmask ${NETMASK}
sudo systemctl restart NetworkManager

# sudo ip route del default
# sudo ip route add default via 192.168.106.241 dev eth1

#!/bin/bash

log "Updating and installing packages..."
# Update system
sudo dnf update -y

# Install required packages

sudo dnf install python3 python3-devel python3-psycopg2 libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2 libwebp-devel tcl-devel tk-devel redhat-rpm-config python36 virtualenv libffi-devel openssl-devel
sudo python3 -m ensurepip

sudo dnf group install "Development Tools"

sudo firewall-cmd --permanent --add-service http
sudo firewall-cmd --permanent --add-service https
sudo firewall-cmd --permanent --add-port=8448/tcp
sudo firewall-cmd --reload

log "Packages installed"

sudo systemctl start postgresq1


# Install Synapse home server and prepare environment

sudo mkdir -p ~/synapse
virtualenv -p python3 ~/synapse/env
source ~/synapse/env/bin/activate

sudo pip install --upgrade pip virtualenv six packaging appdirs

sudo pip install --upgrade setuptools
sudo dnf install epel-release
sudo pip install matrix-synapse

log "setuptools and synapse installed"

sudo systemctl start matrix-synapse
sudo systemctl enable matrix-synapse

# Configuring synapse