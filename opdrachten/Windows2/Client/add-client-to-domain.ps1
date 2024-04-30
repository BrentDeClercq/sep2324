##variabelen
$Credential = Get-Credential
$ComputerName = "CLIENT01"
$DomainName = "ad.g06-tenurit.internal"

##client toevoegen aan domein
Add-Computer -ComputerName $ComputerName -DomainName $DomainName -Credential $Credential -Restart -Force