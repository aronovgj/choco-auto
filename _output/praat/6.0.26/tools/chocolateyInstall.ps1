$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6026_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6026_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum 747132e9bcb543ef9c7f2a4e11088206c729c028c5d966d20a31183e4472069b -ChecksumType 'sha256' -Checksum64 b6fef605e97e06e8348a9d98aac7c159d3d5eeaac89a3aba6c0383ac1d6d312a -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir