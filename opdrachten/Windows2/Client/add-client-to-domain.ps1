##variabelen
$Credential = Get-Credential
$ComputerName = "DESKTOP-TU9QUJ7"
$DomainName = "ad.g06-tenurit.internal"

##client toevoegen aan domein
Add-Computer -ComputerName $ComputerName -DomainName $DomainName -Credential $Credential -Restart -Force