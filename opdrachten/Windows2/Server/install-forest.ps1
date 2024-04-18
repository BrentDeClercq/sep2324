Install-ADDSForest `
    -DomainName "ad.g06-thematrix.internal" `
    -DomainNetBIOSName "TENURIT" `
    -DomainMode "WinThreshold" `
    -ForestMode "WinThreshold" `
    -InstallDNS:$true `
    -NoRebootOnCompletion:$false `
