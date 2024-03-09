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
source /vagrant/vars.sh
#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

log "Starting server specific provisioning tasks on ${HOSTNAME}"

# Network settings
sudo ifconfig eth1 $IP_TFTP netmask $NETMASK_TFTP

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