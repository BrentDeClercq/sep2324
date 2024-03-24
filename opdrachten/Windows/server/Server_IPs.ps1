# Configure IP address settings for the second adapter
$SecondAdapterIPAddress = "192.168.76.10"
$SecondAdapterSubnetMask = "255.255.255.0"
$SecondAdapterDefaultGateway = "192.168.76.1"
$SecondAdapterDNS = "127.0.0.1"

# Configure IP address settings for the third adapter
$ThirdAdapterIPAddress = "192.168.106.242"
$ThirdAdapterSubnetMask = "255.255.255.248"
$ThirdAdapterDefaultGateway = "192.168.106.241"
$ThirdAdapterDNS = "127.0.0.1"

# Configure second adapter
$SecondAdapter = Get-NetAdapter -Name "Ethernet 2"
if ($SecondAdapter) {
    Set-NetIPAddress -InterfaceIndex $SecondAdapter.ifIndex -IPAddress $SecondAdapterIPAddress -PrefixLength 24 -DefaultGateway $SecondAdapterDefaultGateway
    Set-DnsClientServerAddress -InterfaceIndex $SecondAdapter.ifIndex -ServerAddresses $SecondAdapterDNS
    Write-Output "Configured IP settings for second adapter 'Ethernet 2'"
} else {
    Write-Output "Adapter 'Ethernet 2' not found."
}

# Configure third adapter
$ThirdAdapter = Get-NetAdapter -Name "Ethernet 3"
if ($ThirdAdapter) {
    Set-NetIPAddress -InterfaceIndex $ThirdAdapter.ifIndex -IPAddress $ThirdAdapterIPAddress -PrefixLength 29 -DefaultGateway $ThirdAdapterDefaultGateway
    Set-DnsClientServerAddress -InterfaceIndex $ThirdAdapter.ifIndex -ServerAddresses $ThirdAdapterDNS
    Write-Output "Configured IP settings for third adapter 'Ethernet 3'"
} else {
    Write-Output "Adapter 'Ethernet 3' not found."
}
