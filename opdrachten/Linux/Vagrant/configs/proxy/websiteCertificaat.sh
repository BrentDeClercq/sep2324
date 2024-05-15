#! /bin/bash

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

sudo chmod 755 /etc/nginx/ssl
sudo chown nginx:nginx /etc/nginx/ssl

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/g06-tenurit.internal.key -out /etc/nginx/ssl/g06-tenurit.internal.crt - -subj "/C=BE/ST=Oost-Vlaanderen/L=Gent/O=TenurIT/OU=./CN=g06-tenurit.internal"
certificaat_gevonden=false
# Loop until the certificate and private key files are extracted
while [ "$certificaat_gevonden" != true ]; do
    # Check if the certificate file exists in the specified folder on the proxy
    if [ -f /vagrant/Certificate.pfx ]; then
        echo "Certificaat gevonden, oud certificaat wordt verwijderd." 
        
        sudo rm /etc/nginx/ssl/g06-tenurit.internal.key
        sudo rm /etc/nginx/ssl/g06-tenurit.internal.crt


        echo "Certificaat en private key uitpakken"
        
        # private key uitpakken
        sudo openssl pkcs12 -in /vagrant/Certificate.pfx -nocerts -out /etc/nginx/ssl/g06-tenurit.internal.key -nodes
        
        # Certificaat uitpakken
        sudo openssl pkcs12 -in /vagrant/Certificate.pfx -clcerts -nokeys -out /etc/nginx/ssl/g06-tenurit.internal.crt -nodes
        
        echo "Certificate and private key extracted."
        
        certificaat_gevonden=true 
    else
        echo "Certificaat nog niet gevonden"
        sleep 10  # Wait for 10 seconds before checking again
    fi
done

# Certificaten voor de website

sudo chmod 644 /etc/nginx/ssl/g06-tenurit.internal.crt

sudo chown nginx:nginx /etc/nginx/ssl/g06-tenurit.internal.crt

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

sudo systemctl restart nginx
