$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6037_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6037_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum a28a2faf5edc6c0e5154110f3cf55864ce455f2ba4f8857999eb0e77c227cac2 -ChecksumType 'sha256' -Checksum64 7f3082e3669c21483a7ce3b691470726f0d4e4ac3dac3172ca1e0ac31626ff7f -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir