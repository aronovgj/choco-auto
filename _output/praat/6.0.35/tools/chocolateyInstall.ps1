$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6035_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6035_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum 2ec9a69fdd54107f458921a62dd705832c36efad24825f583b8663087d3b329b -ChecksumType 'sha256' -Checksum64 135fdbf85a1b57e1b09d5d819c806b7f497d3113fc3a35c4b2df68f7e4847dad -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir