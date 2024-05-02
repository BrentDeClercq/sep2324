##toestel hernoemen
Rename-Computer -NewName "CLIENT01"

##variabelen
$IPAddress = #"192.168.106.2"
$SubnetMask = #"255.255.255.248"
$DefaultGateway = #"192.168.106.242"
$AdapterName = #"Ethernet"

##aanpassingen in ipconfig
New-NetIPAddress -InterfaceAlias $AdapterName -IPAddress $IPAddress -PrefixLength "29" -DefaultGateway $DefaultGateway