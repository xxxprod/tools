Write-Output ". $(Get-Item .\PSProfile.ps1 | ForEach-Object { $_.FullName })" > "C:\Users\tgr\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"