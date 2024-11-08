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

# Certificaten voor de website
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


# Certificaten voor nextcloud
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nextcloud.g06-tenurit.internal.key -out /etc/nginx/ssl/nextcloud.g06-tenurit.internal.crt - -subj "/C=BE/ST=Oost-Vlaanderen/L=Gent/O=TenurIT/OU=./CN=nextcloud.g06-tenurit.internal"

sudo chmod 644 /etc/nginx/ssl/nextcloud.g06-tenurit.internal.crt
sudo chmod 755 /etc/nginx/ssl

sudo chown nginx:nginx /etc/nginx/ssl/nextcloud.g06-tenurit.internal.crt
sudo chown nginx:nginx /etc/nginx/ssl

sudo setsebool -P httpd_can_network_connect on

sudo echo "server {
    listen 80;
    listen 443 ssl http2; #enable HTTP/2 over TLS
    server_name nextcloud.g06-tenurit.internal www.nextcloud.g06-tenurit.internal;

    ssl_certificate '/etc/nginx/ssl/nextcloud.g06-tenurit.internal.crt';
    ssl_certificate_key '/etc/nginx/ssl/nextcloud.g06-tenurit.internal.key';
    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers PROFILE=SYSTEM;
    ssl_prefer_server_ciphers on;

    # Other SSL configuration...
    
    # Disable server tokens for this server block
    server_tokens off; # disables version info
    proxy_hide_header X-powered-By; # disables signature (nginx?)
    add_header X-Frame-Options SAMEORIGIN; # disables clickjacking 

    if (\$scheme != "https") {
    return 301 https://\$host\$request_uri;
    }

    location / {
        proxy_pass http://$IP_NEXTCLOUD;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}" | sudo tee /etc/nginx/conf.d/nextcloud.g06-tenurit.conf > /dev/null

# certificaten voor matrix
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/matrix.tenurit.com.key -out /etc/nginx/ssl/matrix.tenurit.com.crt - -subj "/C=BE/ST=Oost-Vlaanderen/L=Gent/O=TenurIT/OU=./CN=matrix.tenurit.com"

# sudo chmod 644 /etc/nginx/ssl/matrix.tenurit.com.crt
# sudo chown nginx:nginx /etc/nginx/ssl/matrix.tenurit.com.crt

# sudo echo "server {
#     listen 80;
#     listen 443 ssl;
#     server_name matrix.tenurit.com www.matrix.tenurit.com;

#     ssl_certificate  '/etc/nginx/ssl/matrix.tenurit.com.crt';
#     ssl_certificate_key '/etc/nginx/ssl/matrix.tenurit.com.key';
#     ssl_session_cache shared:SSL:1m;
#     ssl_session_timeout  10m;
#     ssl_ciphers PROFILE=SYSTEM;
#     ssl_prefer_server_ciphers on;


#     location / {
#         proxy_pass http://$IP_SYNAPSE:8008/;
#         proxy_set_header Host \$host;
#         proxy_set_header X-Real-IP \$remote_addr;
#         proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
#         proxy_set_header X-Forwarded-Proto \$scheme;
#     }
# }" | sudo tee /etc/nginx/conf.d/matrix.conf > /dev/null


# Firewall configuration
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=https --permanent
sudo firewall-cmd --reload

sudo systemctl restart nginx

sudo ip route del default
sudo ip route add default via 192.168.106.249 dev eth1
