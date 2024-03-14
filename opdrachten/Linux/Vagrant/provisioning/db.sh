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
# Functions
#------------------------------------------------------------------------------

# Predicate that returns exit status 0 if the database root password
# is not set, a nonzero exit status otherwise.
is_mysql_root_password_empty() {
    mysqladmin --user=root status > /dev/null 2>&1
}


#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

log "Starting server specific provisioning tasks on ${HOSTNAME}"

# Network settings
sudo ifconfig eth1 $IP_DATABASE netmask $NETMASK_DATABASE
sudo systemctl restart NetworkManager


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

# # -----------------------------------------------
# # Database secure installation
# # -----------------------------------------------

# spawn mysql_secure_installation

# expect "Enter current password for root"
# send "vagrant"

# expect "Switch to unix_socket authentication"
# send "n"

# expect "Change the root password?"
# send "y"

# expect "New password"
# send "$db_root_passwd\r"

# expect "Re-enter new password"
# send "$db_root_passwd\r"

# expect "Remove anonymous users"
# send "y"

# expect "Disallow root login remotely"
# send "n" # misschien in de toekomst op 'y'

# expect "Remove test database"
# send "y"

# expect "Reload privilege tables now"
# send "y"

# # Exit the expect script
# expect eof


# # -----------------------------------------------
# # Database add user and database
# # -----------------------------------------------

# # Spawn the MySQL command line client
# spawn mysql -u root -p

# # Expect the password prompt
# expect "Enter password:"

# # Send the root password
# send "$db_password\r"

# # Expect the MySQL prompt
# expect "mysql>"

# # Construct the SQL query to create a new user
# set create_user_query "CREATE USER '$db_user'@'localhost' IDENTIFIED BY '$db_user_passwd';"

# # Send the SQL query to create the user
# send "$create_user_query\r"

# # Construct the SQL query to create a new database
# set create_database_query "CREATE DATABASE IF NOT EXISTS $db_name;"

# # Send the SQL query to create the database
# send "$create_database_query\r"

# # Expect the MySQL prompt
# expect "mysql>"

# # Construct the SQL query to grant privileges to the user on the new database
# set grant_privileges_query "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'localhost';"

# # Send the SQL query to grant privileges
# send "$grant_privileges_query\r"

# # Expect the MySQL prompt again
# expect "mysql>"

# # Flush privileges to apply changes
# send "FLUSH PRIVILEGES;\r"

# # Expect the MySQL prompt again
# expect "mysql>"

# # Exit the MySQL client
# send "exit\r"

# # Exit the expect script
# expect eof


if is_mysql_root_password_empty; then
mysql <<_EOF_
  SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${db_root_passwd}');
  DELETE FROM mysql.user WHERE User='';
  DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
  DROP DATABASE IF EXISTS test;
  DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
  FLUSH PRIVILEGES;
_EOF_
fi

log "Creating database and user"

mysql --user=root --password="${db_root_passwd}" << _EOF_
CREATE DATABASE IF NOT EXISTS ${db_name};
GRANT ALL ON ${db_name}.* TO '${db_user}'@'%' IDENTIFIED BY '${db_user_passwd}';
FLUSH PRIVILEGES;
_EOF_

