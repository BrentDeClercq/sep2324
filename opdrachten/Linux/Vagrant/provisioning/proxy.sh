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
sudo systemctl restart NetworkManager

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

# Certificaten

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout g06-tenurit.internal.key -out g06-tenurit.internal.crt - -subj "/C=BE/ST=Oost-vlaanderen/L=Gent/O=TenurIT/OU=./CN=g06-tenurit.internal"

# sudo nano /etc/nginx/conf.d/g06-tenurit.conf

#server {
#    listen 443 ssl;
#    server_name g06-tenurit.internal www.g06-tenurit.internal;

#    ssl_certificate /home/vagrant/g06-tenurit.internal.crt;
#    ssl_certificate_key /home/vagrant/g06-tenurit.internal.key;

#sudo mkdir -p /etc/nginx/ssl/
#sudo mv /home/vagrant/g06-tenurit.internal.crt /etc/nginx/ssl/
#sudo mv /home/vagrant/g06-tenurit.internal.key /etc/nginx/ssl/
#etc/nginx/ssl

#sudo chmod 644 /etc/nginx/ssl/g06-tenurit.internal.crt
#sudo chmod 755 /etc/nginx/ssl

#sudo chown nginx:nginx /etc/nginx/ssl/g06-tenurit.internal.crt
#sudo chown nginx:nginx /etc/nginx/ssl

#sudo sudo setsebool -P httpd_can_network_connect 1
#sudo setsebool -P httpd_can_network_connect_https 1




    # Other SSL configuration...

#    location / {
#        proxy_pass http://192.168.106.250:80;
#        proxy_set_header Host $host;
#        proxy_set_header X-Real-IP $remote_addr;
#        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#        proxy_set_header X-Forwarded-Proto $scheme;
#    }
#}

#sudo chown nginx:nginx /home/vagrant/g06-tenurit.internal.crt

# sudo systemctl restart nginx
