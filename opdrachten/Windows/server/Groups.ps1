# Admins en Clients aanmaken
New-ADGroup -Name "Admins" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "Clients" -GroupScope Global -GroupCategory Security
