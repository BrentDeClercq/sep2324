# Variabele die de installatiestatus van de DNS-server feature opslaat
$dnsFeature = Get-WindowsFeature -Name DNS

# De naam van de zone die je wilt controleren
$zoneNaam = "ad.g06-tenurit.internal"
$zoneBestand = "ad.g06-tenurit.internal.dns"




# Controleer of de DNS-serverrol al is geïnstalleerd
if ($dnsFeature.Installed -eq $false) {
    # Als DNS niet is geïnstalleerd, installeer het dan
    Install-WindowsFeature -Name DNS
    Write-Host "DNS-serverrol wordt geinstalleerd."
} else {
    # Als DNS al is geïnstalleerd, voer een andere actie uit of doe niets
    Write-Host "DNS-serverrol is al geinstalleerd."
}

# Ophalen van de zone-informatie
$zoneInfo = Get-DnsServerZone -Name $zoneNaam -ErrorAction SilentlyContinue

# Controleer of de zone bestaat en een primaire zone is
if ($zoneInfo -ne $null -and $zoneInfo.ZoneType -eq "Primary") {
    Write-Host "De primaire zone '$zoneNaam' is al geinstalleerd."
} else {
	Add-DnsServerPrimaryZone -Name $zoneNaam -ZoneFile $zoneBestand
    Write-Host "De primaire zone '$zoneNaam' werd succesvol aangemaakt."
}


#=======================================================================================================================
# Reverse Lookup Zone
#=======================================================================================================================

$networkID = "192.168.106"
$arpaName = "106.168.192.in-addr.arpa"
$zoneExists = Get-DnsServerZone | Where-Object {$_.ZoneName -eq $arpaName}

if (-not $zoneExists) {
    Add-DnsServerPrimaryZone -NetworkID $networkID -ReplicationScope "Domain"  
    Write-Host "De reverse lookup zone voor $networkID werd succesvol aangemaakt."
}
else {
    Write-Host "De reverse lookup zone voor $networkID bestaat al."
}


#=======================================================================================================================
# A-record en PTR-record voor CLIENT01
#=======================================================================================================================

# Ophalen van het A-record
$recordNaam = "client01"
$record = Get-DnsServerResourceRecord -ZoneName $zoneNaam -Name $recordNaam -RRType "A" -ErrorAction SilentlyContinue

# Controleer of het A-record bestaat
if ($record -ne $null) {
    Write-Host "Het A-record '$recordNaam' voor de zone '$zoneNaam' is al geinstalleerd."
} else {
    Add-DnsServerResourceRecordA -Name $recordNaam -ZoneName $zoneNaam -IPv4Address "192.168.106.2" 
    Write-Host "Het A-record '$recordNaam' voor de zone '$zoneNaam' werd succesvol aangemaakt."
}

# Ophalen van het PTR-record
$recordNaam = "192.168.106.2"
$record = Get-DnsServerResourceRecord -ZoneName $arpaName -Name $recordNaam -RRType "PTR" -ErrorAction SilentlyContinue

# Controleer of het PTR-record bestaat
if ($record -ne $null) {
    Write-Host "Het PTR-record '$recordNaam' voor de zone '$arpaName' is al geinstalleerd."
} else {
    Add-DnsServerResourceRecordPtr -Name $recordNaam -ZoneName $arpaName -PtrDomainName "client01.ad.g06-tenurit.internal"
    Write-Host "Het PTR-record '$recordNaam' voor de zone '$arpaName' werd succesvol aangemaakt."
}

