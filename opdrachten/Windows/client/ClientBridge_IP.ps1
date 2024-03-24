# Define IPv4 settings
$IPAddress = "192.168.106.2"
$SubnetMask = "255.255.255.128"
$DefaultGateway = "192.168.76.1"

# Get the network adapter interface for Ethernet 3
$NetworkAdapter = Get-NetAdapter | Where-Object { $_.Name -eq "Ethernet 3" }

if ($NetworkAdapter) {
    # Disable IPv6 for the network adapter
    Set-NetAdapterBinding -InterfaceAlias $NetworkAdapter.Name -ComponentID ms_tcpip6 -Enabled $false -Confirm:$false

    # Configure IPv4 settings
    $NetworkAdapter | New-NetIPAddress -IPAddress $IPAddress -PrefixLength 25 -DefaultGateway $DefaultGateway

    Write-Host "IPv4 settings configured successfully for $($NetworkAdapter.Name)"
} else {
    Write-Host "Network adapter 'Ethernet 3' not found."
}
