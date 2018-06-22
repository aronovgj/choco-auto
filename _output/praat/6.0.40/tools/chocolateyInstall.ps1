$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6040_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6040_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum 92e8a79997c75f562191765779cd0e661e216ade128b1f79b17893b5a7b62d73 -ChecksumType 'sha256' -Checksum64 138cc1ef395f420a4c00772f4a3065bdccf3fc4f440ba203a6ae505d03558aa9 -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir