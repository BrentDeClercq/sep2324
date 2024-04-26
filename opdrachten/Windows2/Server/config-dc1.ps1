##toestel nieuwe naam geven
Rename-Computer -NewName "DC1"

##variabelen
$IPAddress = "192.168.106.242"
$SubnetMask = "255.255.255.248"
$DefaultGateway = "192.168.106.242"
$AdapterName = "Ethernet"

##ip-adressen verwijderen
Remove-NetIPAddress -InterfaceAlias $AdapterName
Remove-NetRoute -InterfaceAlias $AdapterName

##aanpassingen in ipconfig
New-NetIPAddress -InterfaceAlias $AdapterName -IPAddress $IPAddress -PrefixLength "29" -DefaultGateway $DefaultGateway