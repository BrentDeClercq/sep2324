# Define IPv4 settings
$IPAddress = "192.168.76.11"
$SubnetMask = "255.255.255.0"
$DefaultGateway = "192.168.76.20"
$PreferredDNS = "192.168.76.10"

# Get the network adapter interface
$NetworkAdapter = Get-NetAdapter | Where-Object { $_.Name -eq "Ethernet 2" }

if ($NetworkAdapter) {
    # Disable IPv6 for the network adapter
    Set-NetAdapterBinding -InterfaceAlias $NetworkAdapter.Name -ComponentID ms_tcpip6 -Enabled $false -Confirm:$false

    # Configure IPv4 settings
    $NetworkAdapter | New-NetIPAddress -IPAddress $IPAddress -PrefixLength 24 -DefaultGateway $DefaultGateway

    # Set DNS server
    $NetworkAdapter | Set-DnsClientServerAddress -ServerAddresses $PreferredDNS

    Write-Host "IPv4 settings configured successfully for $($NetworkAdapter.Name)"
} else {
    Write-Host "Network adapter 'TenurNAT' not found."
}
