# Define the download URL for RSAT
$RSATUrl = "https://www.microsoft.com/en-us/download/details.aspx?id=45520"

# Define the path to save the downloaded RSAT file
$DownloadPath = "$env:TEMP\WindowsTH-RSAT_WS_1803-x64.msu"

# Download RSAT
try {
    Write-Host "Downloading RSAT..."
    Invoke-WebRequest -Uri $RSATUrl -OutFile $DownloadPath -ErrorAction Stop
    Write-Host "RSAT downloaded successfully to: $DownloadPath"
}
catch {
    Write-Error "Failed to download RSAT. $_"
    exit 1
}

# Install RSAT
try {
    Write-Host "Installing RSAT..."
    Start-Process -FilePath "wusa.exe" -ArgumentList "/quiet", "/norestart", $DownloadPath -Wait -ErrorAction Stop
    Write-Host "RSAT installed successfully."
}
catch {
    Write-Error "Failed to install RSAT. $_"
    exit 1
}

# Remove the downloaded file
try {
    Remove-Item $DownloadPath -Force
    Write-Host "Downloaded file removed successfully."
}
catch {
    Write-Error "Failed to remove downloaded file. $_"
    exit 1
}
