$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6034_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6034_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum d1767c677181b19f91f90a670a2bc54ad9c6be50837a86f9bc68b9f06e460ed0 -ChecksumType 'sha256' -Checksum64 fecf4f6e6b2bb7bfc0f9e1f8037be17761a980fc130dee6d761663f63955c246 -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir