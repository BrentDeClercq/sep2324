Install-ADDSForest `
    -DomainName "ad.g06-tenurit.internal" `
    -DomainNetBIOSName "TENURIT" `
    -DomainMode "WinThreshold" `
    -ForestMode "WinThreshold" `
    -InstallDNS:$true `
    -NoRebootOnCompletion:$false `

Install-WindowsFeature -Name DNS -IncludeManagementTools

 