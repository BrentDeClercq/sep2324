Install-WindowsFeature -Name ADCS-Cert-Authority -IncludeManagementTools

Install-AdcsCertificationAuthority -CAType EnterpriseRootCA

# Maak een nieuwe sjabloon voor het webservercertificaat
New-AdcsTemplate -TemplateType Server -TemplateName "WebServerTemplate"
# Vraag een certificaat aan op basis van het sjabloon
Submit-AdcsCertificateRequest -Template "WebServerTemplate" -SubjectName "CN=g06-tenurit.internal" -DNSName "g06-tenurit.internal" -CertStoreLocation "Z:\certificaat"

# Exporteer het CA-certificaat naar een .cer-bestand
$cert = Get-ChildItem -Path Cert:\LocalMachine\Root\<CA_Certificate_Thumbprint>
Export-Certificate -Cert $cert -FilePath C:\Path\To\CA_Certificate.crt

# Exporteer de privésleutel van het CA-certificaat naar een .pvk-bestand
Export-PfxCertificate -Cert $cert -FilePath C:\Path\To\CA_PrivateKey.pfx -Password (ConvertTo-SecureString -String "YourPassword" -AsPlainText -Force)

iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/microsoft/winget-cli/releases/download/v1.0.12673/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle'))

winget install OpenSSL.Light

# Convert .pfx to .key
openssl pkcs12 -in C:\Path\To\CA_PrivateKey.pfx -nocerts -out C:\Path\To\CA_PrivateKey.key -nodes -passin pass:YourPassword

# Use SCP to transfer the certificate file from Windows Server VM to reverse proxy
scp C:\Path\To\Certificate.pfx user@reverse-proxy:/path/to/destination/

New-GPO -Name "Distribute CA Certificate"

New-GPLink -Name "Distribute CA Certificate" -Target "OU=YourOU,DC=YourDomain,DC=com"

Import-Certificate -FilePath C:\Path\To\CA_Certificate.cer -CertStoreLocation Cert:\LocalMachine\Root -GPOName "Distribute CA Certificate"

# gpupdate /force op client om gpo te refreshen


