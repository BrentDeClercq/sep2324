##toestel nieuwe naam geven
#Rename-Computer -NewName "DC2"

##variabelen
$IPAddress = "192.168.106.244"
$SubnetMask = "255.255.255.248"
$DefaultGateway = "192.168.106.241"
$AdapterName = "Ethernet"

##ip-adressen verwijderen
#Remove-NetIPAddress -InterfaceAlias $AdapterName
#Remove-NetRoute -InterfaceAlias $AdapterName

##aanpassingen in ipconfig
#New-NetIPAddress -InterfaceAlias $AdapterName -IPAddress $IPAddress -PrefixLength "29" -DefaultGateway $DefaultGateway

##DNS server instellen
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("192.168.106.242")
