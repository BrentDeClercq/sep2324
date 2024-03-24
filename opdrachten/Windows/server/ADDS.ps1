# ADDS intalleren
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# domeinnaam en wachtwoord
$DomainName = "g06-tenurit.internal"
$Password = ConvertTo-SecureString "Tenur123@" -AsPlainText -Force

# server promoveren naar dc
Install-ADDSForest `
    -DomainName $DomainName `
    -SafeModeAdministratorPassword $Password `
    -Force:$true `
    -NoRebootOnCompletion:$false
