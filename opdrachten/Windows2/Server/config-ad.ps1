## ===========================================================================================================
## STAP 1: Nagaan of Organizational Units al bestaan, zo niet worden deze aangemaakt:
## ===========================================================================================================

Import-Module ActiveDirectory

# Root OU aanmaken

$ouName = "Tenurit"
$domain = "DC=ad,DC=g06-tenurit,DC=internal"
$ouPath = "OU=$ouName,$domain"

# Controleer of de OU bestaat
$ouExists = Get-ADOrganizationalUnit -Filter 'DistinguishedName -eq $ouPath' -ErrorAction SilentlyContinue

if ($ouExists) {
    Write-Host "De OU '$ouName' bestaat al."
} else {
    # Maak de OU aan als deze niet bestaat
    New-ADOrganizationalUnit -Name $ouName -Path $domain
    Write-Host "OU '$ouName' is aangemaakt in het domein '$domain'."
}


# Array van OU's die je wilt controleren/aanmaken 1e graad
$ouNames = @("Users", "Computers")
$domain = "OU=TenurIT,DC=ad,DC=g06-tenurit,DC=internal"

foreach ($ouName in $ouNames) {
    $ouPath = "OU=$ouName,$domain"

    # Controleer of de OU bestaat
    $ouExists = Get-ADOrganizationalUnit -Filter 'DistinguishedName -eq $ouPath' -ErrorAction SilentlyContinue

    if ($ouExists) {
        Write-Host "De OU '$ouName' bestaat al in het path '$domain'."
    } else {
        # Maak de OU aan als deze niet bestaat
        New-ADOrganizationalUnit -Name $ouName -Path $domain
        Write-Host "OU '$ouName' is bijgevoegd in het path '$domain'."
    }
}

# Array van OU's die je wilt controleren/aanmaken 2e graad
$ouNames = @("Admins", "WorkAccounts")
$domain = "OU=Users,OU=TenurIT,DC=ad,DC=g06-tenurit,DC=internal"

foreach ($ouName in $ouNames) {
    $ouPath = "OU=$ouName,$domain"

    # Controleer of de OU bestaat
    $ouExists = Get-ADOrganizationalUnit -Filter 'DistinguishedName -eq $ouPath' -ErrorAction SilentlyContinue

    if ($ouExists) {
        Write-Host "De OU '$ouName' bestaat al in het path '$domain'."
    } else {
        # Maak de OU aan als deze niet bestaat
        New-ADOrganizationalUnit -Name $ouName -Path $domain
        Write-Host "OU '$ouName' is bijgevoegd in het path '$domain'."
    }
}

# Array van OU's die je wilt controleren/aanmaken 2e graad
$ouNames = @("DomainControllers", "Clients")
$domain = "OU=Computers,OU=TenurIT,DC=ad,DC=g06-tenurit,DC=internal"

foreach ($ouName in $ouNames) {
    $ouPath = "OU=$ouName,$domain"

    # Controleer of de OU bestaat
    $ouExists = Get-ADOrganizationalUnit -Filter 'DistinguishedName -eq $ouPath' -ErrorAction SilentlyContinue

    if ($ouExists) {
        Write-Host "De OU '$ouName' bestaat al in het path '$domain'."
    } else {
        # Maak de OU aan als deze niet bestaat
        New-ADOrganizationalUnit -Name $ouName -Path $domain
        Write-Host "OU '$ouName' is bijgevoegd in het path '$domain'."
    }
}

## ===========================================================================================================
## STAP 2: Aanmaken van Users (Brent+Julie worden geconfigureerd als admins)
## ===========================================================================================================

# Definieer de gebruikersnaam die je wilt controleren

$username = "kenjidecoster"
$userExists = Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue

if ($userExists) {
    Write-Host "De gebruiker '$username' bestaat al."
} else {
    Write-Host "De gebruiker '$username' wordt aangemaakt."
    New-ADUser -Name "Kenji De Coster" -GivenName "Kenji" -Surname "De Coster" -SamAccountName "kenjidecoster" -UserPrincipalName "kenji.decoster@tenurit.internal" -AccountPassword (ConvertTo-SecureString -AsPlainText "Kenji2024!" -Force) -Enabled $true -Path "OU=WorkAccounts,OU=Users,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
}

$username = "nobelfiers"
$userExists = Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue

if ($userExists) {
    Write-Host "De gebruiker '$username' bestaat al."
} else {
    Write-Host "De gebruiker '$username' wordt aangemaakt."
    New-ADUser -Name "Nobel Fiers" -GivenName "Nobel" -Surname "Fiers" -SamAccountName "nobelfiers" -UserPrincipalName "nobel.fiers@tenurit.internal" -AccountPassword (ConvertTo-SecureString -AsPlainText "Nobel2024!" -Force) -Enabled $true -Path "OU=WorkAccounts,OU=Users,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
}

$username = "rayaneyousti"
$userExists = Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue

if ($userExists) {
    Write-Host "De gebruiker '$username' bestaat al."
} else {
    Write-Host "De gebruiker '$username' wordt aangemaakt."
    New-ADUser -Name "Rayane Yousti" -GivenName "Rayane" -Surname "Yousi" -SamAccountName "rayaneyousti" -UserPrincipalName "rayane.yousti@tenurit.internal" -AccountPassword (ConvertTo-SecureString -AsPlainText "Rayane2024!" -Force) -Enabled $true -Path "OU=WorkAccounts,OU=Users,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
}

$username = "juliedewitte"
$userExists = Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue

if ($userExists) {
    Write-Host "De gebruiker '$username' bestaat al."
} else {
    Write-Host "De gebruiker '$username' wordt aangemaakt."
    New-ADUser -Name "Julie De Witte" -GivenName "Julie" -Surname "De Witte" -SamAccountName "juliedewitte" -UserPrincipalName "julie.dewitte@tenurit.internal" -AccountPassword (ConvertTo-SecureString -AsPlainText "Julie2024!" -Force) -Enabled $true -Path "OU=Admins,OU=Users,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
    Add-ADGroupMember -Identity "Domain Admins" -Members "juliedewitte"
}

$username = "brentdeclercq"
$userExists = Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue

if ($userExists) {
    Write-Host "De gebruiker '$username' bestaat al."
} else {
    Write-Host "De gebruiker '$username' wordt aangemaakt."
    New-ADUser -Name "Brent De Clercq" -GivenName "Brent" -Surname "De Clercq" -SamAccountName "brentdeclercq" -UserPrincipalName "brent.declercq@tenurit.internal" -AccountPassword (ConvertTo-SecureString -AsPlainText "Brent2024!" -Force) -Enabled $true -Path "OU=Admins,OU=Users,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
    Add-ADGroupMember -Identity "Domain Admins" -Members "brentdeclercq"
}


## ===========================================================================================================
## STAP 3: Aanmaken van Computers 
## ===========================================================================================================

# Checken client
$computerName = "CLIENT01"
$OUPath = "OU=Clients,OU=Computers,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
$computer = Get-ADComputer -Identity $computerName

# Zoek naar de computer in de specifieke OU
$computerExists = Get-ADComputer -Filter "Name -eq '$computerName'" -SearchBase $OUPath -ErrorAction SilentlyContinue

if ($computerExists) {
    Write-Host "De computer '$computerName' bestaat al in de OU '$OUPath'."
} else {
    Write-Host "De computer '$computerName' wordt aangemaakt in de OU '$OUPath'."
    Move-ADObject -Identity $computer.DistinguishedName -TargetPath $OUPath
}

# Checken DC
$computerName = "DC1"
$OUPath = "OU=DomainControllers,OU=Computers,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
$computer = Get-ADComputer -Identity $computerName

# Zoek naar de computer in de specifieke OU
$computerExists = Get-ADComputer -Filter "Name -eq '$computerName'" -SearchBase $OUPath -ErrorAction SilentlyContinue

if ($computerExists) {
    Write-Host "De computer '$computerName' bestaat al in de OU '$OUPath'."
} else {
    Write-Host "De computer '$computerName' wordt aangemaakt in de OU '$OUPath'."
    Move-ADObject -Identity $computer.DistinguishedName -TargetPath $OUPath
}

# Checken DC2
$computerName = "DC2"
$OUPath = "OU=DomainControllers,OU=Computers,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
$computer = Get-ADComputer -Identity $computerName

# Zoek naar de computer in de specifieke OU
$computerExists = Get-ADComputer -Filter "Name -eq '$computerName'" -SearchBase $OUPath -ErrorAction SilentlyContinue

if ($computerExists) {
    Write-Host "De computer '$computerName' bestaat al in de OU '$OUPath'."
} else {
    Write-Host "De computer '$computerName' wordt aangemaakt in de OU '$OUPath'."
    Move-ADObject -Identity $computer.DistinguishedName -TargetPath $OUPath
}

## ===========================================================================================================
## STAP 4: Instellen group policies
## ===========================================================================================================

# Group policy aanmaken zodanig dat niet-administrators niet kunnen aanloggen op de domeincontroller

# Importeer de Group Policy module
Import-Module GroupPolicy

# Naam van de GPO die je wilt controleren en eventueel aanmaken
$gpoName = "RestrictWorkAccounts"

# Controleer of de GPO bestaat
$gpoExists = Get-GPO -Name $gpoName -ErrorAction SilentlyContinue

if ($gpoExists) {
    Write-Host "De GPO '$gpoName' bestaat al."
} else {
    # Maak de GPO aan als deze niet bestaat
    New-GPO -Name $gpoName -Comment "Avoid for work accounts to be able to log in to DC."
    New-GPLink -Name "RestrictWorkAccounts" -Target "OU=DomainControllers,OU=Computers,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
    Write-Host "GPO '$gpoName' is succesvol aangemaakt."

