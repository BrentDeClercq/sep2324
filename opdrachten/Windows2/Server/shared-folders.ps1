##Nieuwe mappen aanmaken
New-Item -Path "C:\SharedFolders" -ItemType Directory

##Alle gebruikers specifieren:
New-Item -Path "C:\SharedFolders\juliedewitte" -ItemType Directory
New-Item -Path "C:\SharedFolders\kenjidecoster" -ItemType Directory
New-Item -Path "C:\SharedFolders\nobelfiers" -ItemType Directory
New-Item -Path "C:\SharedFolders\rayaneyousti" -ItemType Directory
New-Item -Path "C:\SharedFolders\brentdeclercq" -ItemType Directory

##Permissies van alle folders compleet verwijderen en terug toekennen:
$folderPath = "C:\SharedFolders\juliedewitte"
$acl = Get-Acl $folderPath
$acl.SetAccessRuleProtection($true, $false) 
Set-Acl -Path $folderPath -AclObject $acl

$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("juliedewitte", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.AddAccessRule($accessRule)
Set-Acl -Path $folderPath -AclObject $acl


$folderPath = "C:\SharedFolders\kenjidecoster"
$acl = Get-Acl $folderPath
$acl.SetAccessRuleProtection($true, $false) 
Set-Acl -Path $folderPath -AclObject $acl

$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("kenjidecoster", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.AddAccessRule($accessRule)
Set-Acl -Path $folderPath -AclObject $acl


$folderPath = "C:\SharedFolders\nobelfiers"
$acl = Get-Acl $folderPath
$acl.SetAccessRuleProtection($true, $false) 
Set-Acl -Path $folderPath -AclObject $acl

$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("nobelfiers", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.AddAccessRule($accessRule)
Set-Acl -Path $folderPath -AclObject $acl


$folderPath = "C:\SharedFolders\rayaneyousti"
$acl = Get-Acl $folderPath
$acl.SetAccessRuleProtection($true, $false) 
Set-Acl -Path $folderPath -AclObject $acl

$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("rayaneyousti", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.AddAccessRule($accessRule)
Set-Acl -Path $folderPath -AclObject $acl


$folderPath = "C:\SharedFolders\brentdeclercq"
$acl = Get-Acl $folderPath
$acl.SetAccessRuleProtection($true, $false) 
Set-Acl -Path $folderPath -AclObject $acl

$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("brentdeclercq", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.AddAccessRule($accessRule)
Set-Acl -Path $folderPath -AclObject $acl

