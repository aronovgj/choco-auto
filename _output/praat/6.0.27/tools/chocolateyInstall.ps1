$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6027_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6027_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum 84ca0544e6f95f9d433e0cec466e06b6ac0df973503fbaa07eb99269121379a3 -ChecksumType 'sha256' -Checksum64 29658b16ad5838aee95ca0eb9f77c5a056f26764299ec62bdfa6d829259d8d6d -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir