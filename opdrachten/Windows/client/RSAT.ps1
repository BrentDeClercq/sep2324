# Define the download URL for RSAT
$RSATUrl = "https://download.microsoft.com/download/1/D/8/1D8B5022-B4D8-4C6B-9B40-E3B7A91A41A3/WindowsTH-RSAT_WS_1803-x64.msu"

# Define the path to save the downloaded RSAT file
$DownloadPath = "$env:TEMP\RSAT_WS_1803-x64.msu"

# Download RSAT
Invoke-WebRequest -Uri $RSATUrl -OutFile $DownloadPath

# Install RSAT
Start-Process -FilePath "wusa.exe" -ArgumentList "/quiet", "/norestart", $DownloadPath -Wait

# Remove the downloaded file
Remove-Item $DownloadPath -Force