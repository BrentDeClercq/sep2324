$computer = Get-ADComputer -Identity "CLIENT01"
$computer.DistinguishedName

$targetOU = "OU=Clients,OU=Computers,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"

Move-ADObject -Identity $computer.DistinguishedName -TargetPath $targetOU


$computer = Get-ADComputer -Identity "DC"
$computer.DistinguishedName

$targetOU = "OU=DomainControllers,OU=Computers,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"

Move-ADObject -Identity $computer.DistinguishedName -TargetPath $targetOU