$packageName = 'hitmanpro'
$url = 'http://dl.surfright.nl/HitmanPro.exe'
$url64 = 'http://dl.surfright.nl/HitmanPro_x64.exe'
$linkName = 'hitmanpro.lnk'
$fileName = 'hitmanpro.exe'
$destDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $destDir $fileName
Get-ChocolateyWebFile $packageName $filePath $url $url64 -Checksum 9c5c50bba69a88e46eb9155311e131136546e7da28c3bb195e4a11677d6ec633 -ChecksumType 'sha256' -Checksum64 f45e2fd1f9525085c00a2ef90140c54257ea1125b42bc9b3c196a6885da8c6ec -ChecksumType64 'sha256'

#install start menu shortcut
$targetPath = (Get-ChildItem -Path $destDir | Where-Object {$_.Name -eq 'hitmanpro.exe'}).fullname
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#install gui
Set-Content -Path ("$targetPath.gui") -Value $null