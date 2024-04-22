##variabelen
$IPAddress = "192.168.106.2"
$SubnetMask = "255.255.255.128"
$DefaultGateway = "192.168.106.1"
$AdapterName = "Ethernet"

##aanpassingen in ipconfig
New-NetIPAddress -InterfaceAlias $AdapterName -IPAddress $IPAddress -PrefixLength "25" -DefaultGateway $DefaultGateway