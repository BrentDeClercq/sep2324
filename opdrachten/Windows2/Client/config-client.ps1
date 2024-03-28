# Nagaan of RSAT reeds geïnstalleerd is:

Set-ExecutionPolicy RemoteSigned

#$installedFeatures = Get-WindowsCapability -Online | Where-Object { $_.Name -like 'Rsat*' -and $_.State -eq 'NotPresent' }
$installedFeatures = Get-WindowsCapability -Online | Where-Object { $_.Name -like 'Rsat*' -and $_.State -eq 'Installed' }


if ($installedFeatures -eq $null) {
    Write-Host "RSAT tools are not installed. Installing..."

    # RSAT tools installeren: 
    Get-WindowsCapability -Online | Where-Object { $_.Name -like "RSAT*" } | Add-WindowsCapability -Online

    Write-Host "RSAT tools have been installed."
} 
else {
    Write-Host "RSAT tools are already installed."
}

pause