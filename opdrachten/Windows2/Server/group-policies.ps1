##Nieuwe group policy aanmaken
New-GPO -Name "RestrictWorkAccounts" -Comment "Avoid for work accounts to be able to log in to DC."

##GPO koppelen aan een OU
New-GPLink -Name "RestrictWorkAccounts" -Target "OU=DomainControllers,OU=Computers,OU=Tenurit,DC=ad,DC=g06-thematrix,DC=internal"
