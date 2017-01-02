$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6022_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6022_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum 3c08ae778ae0022b46acdf4948970f8ce18a88d60687508d776176edd93f23ef -ChecksumType 'sha256' -Checksum64 0021cb5b4f6efcbb6308b51d818658d533dc96516ef60f06933977ba9b37bbde -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir