$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6032_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6032_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum c096df646d633eedb720ff74710345e802d157d2800006eac90bd59df89a648a -ChecksumType 'sha256' -Checksum64 892880b01757025272d4926b73d08490bf5761a94b3cad20bbd5004ea3614ff1 -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir