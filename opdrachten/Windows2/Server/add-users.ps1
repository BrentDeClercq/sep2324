##Users aanmaken
New-ADUser -Name "Kenji De Coster" -GivenName "Kenji" -Surname "De Coster" -SamAccountName "kenjidecoster" -UserPrincipalName "kenji.decoster@tenurit.internal" -AccountPassword (ConvertTo-SecureString -AsPlainText "Kenji2024!" -Force) -Enabled $true -Path "OU=WorkAccounts,OU=Users,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
New-ADUser -Name "Nobel Fiers" -GivenName "Nobel" -Surname "Fiers" -SamAccountName "nobelfiers" -UserPrincipalName "nobel.fiers@tenurit.internal" -AccountPassword (ConvertTo-SecureString -AsPlainText "Nobel2024!" -Force) -Enabled $true -Path "OU=WorkAccounts,OU=Users,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
New-ADUser -Name "Rayane Yousti" -GivenName "Rayane" -Surname "Yousi" -SamAccountName "rayaneyousti" -UserPrincipalName "rayane.yousti@tenurit.internal" -AccountPassword (ConvertTo-SecureString -AsPlainText "Rayane2024!" -Force) -Enabled $true -Path "OU=WorkAccounts,OU=Users,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"

##Admins aanmaken
New-ADUser -Name "Julie De Witte" -GivenName "Julie" -Surname "De Witte" -SamAccountName "juliedewitte" -UserPrincipalName "julie.dewitte@tenurit.internal" -AccountPassword (ConvertTo-SecureString -AsPlainText "Julie2024!" -Force) -Enabled $true -Path "OU=Admins,OU=Users,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"
New-ADUser -Name "Brent De Clercq" -GivenName "Brent" -Surname "De Clercq" -SamAccountName "brentdeclercq" -UserPrincipalName "brent.declercq@tenurit.internal" -AccountPassword (ConvertTo-SecureString -AsPlainText "Brent2024!" -Force) -Enabled $true -Path "OU=Admins,OU=Users,OU=Tenurit,DC=ad,DC=g06-tenurit,DC=internal"

##Users toevoegen aan groep
Add-ADGroupMember -Identity "Domain Admins" -Members "juliedewitte"
Add-ADGroupMember -Identity "Domain Admins" -Members "brentdeclercq"