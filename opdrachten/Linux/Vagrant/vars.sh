#---------------------------------------------------------
# Network settings SEP
#---------------------------------------------------------

# Database
IP_DATABASE="192.168.106.243"
NETMASK_DATABASE="255.255.255.248"

# Web
IP_WEB="192.168.106.244"
NETMASK_WEB="255.255.255.248"

# TFTP
IP_TFTP="192.168.106.234"
NETMASK_TFTP="255.255.255.248"

# TFTP - test
IP_TFTP_TEST="192.168.106.235"

# Proxy
IP_PROXY="192.168.106.250"
NETMASK_PROXY="255.255.255.252"

# Nextcloud
IP_NEXTCLOUD="192.168.106.245"
NETMASK_SERVERS="255.255.255.248"

# Synapse
IP_SYNAPSE="192.168.106.246"
NETMASK_SERVERS="255.255.255.248"
IP_SYNAPSE_NMCLI="192.168.106.246/29"

#---------------------------------------------------------
# Network settings Brent
#---------------------------------------------------------

# Database
# IP_DATABASE="192.168.7.10"
# NETMASK_DATABASE="255.255.252.0"

# Web
# IP_WEB="192.168.7.11"
# NETMASK_WEB="255.255.252.0"

# Proxy
# IP_PROXY="192.168.7.12"
# NETMASK_PROXY="255.255.252.0"

# Nextcloud
# IP_NEXTCLOUD="192.168.7.13"
# NETMASK_SERVERS="255.255.252.0"

#---------------------------------------------------------
# Network settings Kenji
#---------------------------------------------------------

# # Database
# IP_DATABASE="192.168.0.147"
# NETMASK_DATABASE="255.255.255.0"

# # Web
# IP_WEB="192.168.0.155"
# NETMASK_WEB="255.255.255.0"

# # Proxy
# IP_PROXY="192.168.0.105"
# NETMASK_PROXY="255.255.255.0"

#---------------------------------------------------------
# Database
#---------------------------------------------------------
db_name="wp"
db_user="tenurit"
db_user_passwd="tenurIT.2024"
db_root_passwd="tenurIT.2023"

db_bind_address=$IP_DATABASE
db_config_path="/etc/my.cnf.d/mariadb-server.cnf"

#---------------------------------------------------------
# Webserver
#---------------------------------------------------------
wp_config_path="/var/www/html/wordpress/wp-config.php"


#---------------------------------------------------------
# Nextcloud
#---------------------------------------------------------
nc_db_name="nextcloud"
nc_db_user="next"
nc_db_user_passwd="cloud"

# Synapse
#---------------------------------------------------------
s_db_name="synapse"
s_db_user="syn"
s_db_user_passwd="apse"
