$packageName = 'hitmanpro'
$url = 'http://dl.surfright.nl/HitmanPro.exe'
$url64 = 'http://dl.surfright.nl/HitmanPro_x64.exe'
$linkName = 'hitmanpro.lnk'
$fileName = 'hitmanpro.exe'
$destDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $destDir $fileName
Get-ChocolateyWebFile $packageName $filePath $url $url64 -Checksum b520e2d392c227315d31f87fdb295389a301a8716d5269116877a1887d8449bd -ChecksumType 'sha256' -Checksum64 4c6b5f9f3c0796b07c7d8e580c65c03f2e73800f3cf8644bba51205f8ea2608b -ChecksumType64 'sha256'

#install start menu shortcut
$targetPath = (Get-ChildItem -Path $destDir | Where-Object {$_.Name -eq 'hitmanpro.exe'}).fullname
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#install gui
Set-Content -Path ("$targetPath.gui") -Value $null