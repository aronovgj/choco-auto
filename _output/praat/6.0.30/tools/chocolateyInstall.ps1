$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6030_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6030_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum f688b33f2a77c11570ad4e34a24c0059ce1e5d3ef04ca08794409eeb36ebfc61 -ChecksumType 'sha256' -Checksum64 6fa81989fdb667db99a83b4d3e0dbf3d1e08ebc7645f7f10daacdb62737f3cb3 -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir