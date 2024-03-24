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

# sudo echo "server {
#     listen 80;
#     server_name 'g06-tenurit.internal';

#     location / {
#         proxy_pass http://$IP_WEB:80;
#         proxy_set_header Host \$host;
#         proxy_set_header X-Real-IP \$remote_addr;
#         proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
#         proxy_set_header X-Forwarded-Proto \$scheme;
#     }
# }" | sudo tee /etc/nginx/conf.d/g06-tenurit.conf > /dev/null

# # sudo nginx -t (checkt voor syntax fouten in dit bestand)

# sudo systemctl reload nginx

# Certificaten

sudo mkdir -p /etc/nginx/ssl/
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/g06-tenurit.internal.key -out /etc/nginx/ssl/g06-tenurit.internal.crt - -subj "/C=BE/ST=Oost-Vlaanderen/L=Gent/O=TenurIT/OU=./CN=g06-tenurit.internal"

sudo chmod 644 /etc/nginx/ssl/g06-tenurit.internal.crt
sudo chmod 755 /etc/nginx/ssl

sudo chown nginx:nginx /etc/nginx/ssl/g06-tenurit.internal.crt
sudo chown nginx:nginx /etc/nginx/ssl

sudo setsebool -P httpd_can_network_connect on

sudo echo "server {
    listen 80;
    listen 443 ssl http2; #enable HTTP/2 over TLS
    server_name g06-tenurit.internal www.g06-tenurit.internal;

    ssl_certificate '/etc/nginx/ssl/g06-tenurit.internal.crt';
    ssl_certificate_key '/etc/nginx/ssl/g06-tenurit.internal.key';
    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers PROFILE=SYSTEM;
    ssl_prefer_server_ciphers on;

    # Other SSL configuration...
    
    # Disable server tokens for this server block
    server_tokens off; # disables version info
    proxy_hide_header X-powered-By; # disables signature (nginx?)
    add_header X-Frame-Options SAMEORIGIN; # disables clickjacking 


    location / {
        proxy_pass http://$IP_WEB:80;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}" | sudo tee /etc/nginx/conf.d/g06-tenurit.conf > /dev/null

# Firewall configuration
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=https --permanent
sudo firewall-cmd --reload

sudo systemctl restart nginx

curl -s https://raw.githubusercontent.com/Feriman22/portscan-protection/master/portscan-protection.sh | sudo bash /dev/stdin -i