##variabelen
$IPAddress = "192.168.106.2"
$SubnetMask = "255.255.255.128"
$DefaultGateway = "192.168.106.1"
$AdapterName = "Ethernet"

##ip-adressen verwijderen
Remove-NetIPAddress -InterfaceAlias $AdapterName
Remove-NetRoute -InterfaceAlias $AdapterName

##aanpassingen in ipconfig
New-NetIPAddress -InterfaceAlias $AdapterName -IPAddress $IPAddress -PrefixLength "25" -DefaultGateway $DefaultGateway