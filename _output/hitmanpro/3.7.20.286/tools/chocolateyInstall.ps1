$packageName = 'hitmanpro'
$url = 'http://dl.surfright.nl/HitmanPro.exe'
$url64 = 'http://dl.surfright.nl/HitmanPro_x64.exe'
$linkName = 'hitmanpro.lnk'
$fileName = 'hitmanpro.exe'
$destDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $destDir $fileName
Get-ChocolateyWebFile $packageName $filePath $url $url64 -Checksum 82df28e8487a9df82b662a018f1c86b07e542715214859807e7a17a24d6831bf -ChecksumType 'sha256' -Checksum64 057c63428a2e2e2d95c3adb4205570b55fd2fe919f9354c51686e8e238c59e54 -ChecksumType64 'sha256'

#install start menu shortcut
$targetPath = (Get-ChildItem -Path $destDir | Where-Object {$_.Name -eq 'hitmanpro.exe'}).fullname
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#install gui
Set-Content -Path ("$targetPath.gui") -Value $null