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
sudo ifconfig eth1 $IP_PROXY netmask $NETMASK_PROXY

log "Installing proxy"

sudo dnf update -y
sudo dnf install nginx -y
sudo systemctl enable --now nginx

sudo tee /etc/nginx/conf.d/your_domain.conf<<EOF

server {
    listen 80;
    server_name g06-tenurit.internal;

    location / {
        proxy_pass http://192.168.106.250;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

# sudo nginx -t (checkt voor syntax fouten in dit bestand)

sudo systemctl reload nginx

