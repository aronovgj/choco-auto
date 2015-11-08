$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6004_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6004_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64"

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir