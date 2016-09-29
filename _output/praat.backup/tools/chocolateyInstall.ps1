$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6020_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6020_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum 743cbcf111d345f229310ab231847612745eedf5a54edda50c5b175be2e62c73 -ChecksumType 'sha256' -Checksum64 51522821a5a0b7792aa9c05a2a8d8003c331aecb57469f4b673e0e32f3329799 -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir