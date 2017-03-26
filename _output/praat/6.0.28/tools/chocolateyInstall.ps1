$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6028_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6028_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum b346cb44fb5bfddbf7cbb4d37254749ff4397522e0333d75ee31f3bc0b39d745 -ChecksumType 'sha256' -Checksum64 e05c8dcef9aade4dccf7e22274a47c7741007408d728678f45647f6cb485a608 -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir