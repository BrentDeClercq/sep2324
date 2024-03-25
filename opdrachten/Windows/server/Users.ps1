New-ADUser -Name "Kenji De Coster" -GivenName "Kenji" -Surname "De Coster" -SamAccountName "KenjiDeCoster" -UserPrincipalName "KenjiDeCoster@g06-tenurit.internal" -AccountPassword (ConvertTo-SecureString "Tenur123@" -AsPlainText -Force) -Enabled $true

New-ADUser -Name "Brent De Clercq" -GivenName "Brent" -Surname "De Clercq" -SamAccountName "BrentDeClercq" -UserPrincipalName "BrentDeClercq@g06-tenurit.internal" -AccountPassword (ConvertTo-SecureString "Tenur123@" -AsPlainText -Force) -Enabled $true

New-ADUser -Name "Nobel Fiers" -GivenName "Nobel" -Surname "Fiers" -SamAccountName "NobelFiers" -UserPrincipalName "NobelFiers@g06-tenurit.internal" -AccountPassword (ConvertTo-SecureString "Tenur123@" -AsPlainText -Force) -Enabled $true

New-ADUser -Name "Julie De Witte" -GivenName "Julie" -Surname "De Witte" -SamAccountName "JulieDeWitte" -UserPrincipalName "JulieDeWitte@g06-tenurit.internal" -AccountPassword (ConvertTo-SecureString "Tenur123@" -AsPlainText -Force) -Enabled $true

New-ADUser -Name "Rayane Yousti" -GivenName "Rayane" -Surname "Yousti" -SamAccountName "RayaneYousti" -UserPrincipalName "RayaneYousti@g06-tenurit.internal" -AccountPassword (ConvertTo-SecureString "Tenur123@" -AsPlainText -Force) -Enabled $true


New-ADUser -Name "Client Test" -GivenName "Client" -Surname "Test" -SamAccountName "ClientTest" -UserPrincipalName "ClientTest@g06-tenurit.internal" -AccountPassword (ConvertTo-SecureString "Tenur123@" -AsPlainText -Force) -Enabled $true
