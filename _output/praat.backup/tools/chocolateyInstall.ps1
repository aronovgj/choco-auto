$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6019_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6019_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum 0843bdde247b1ed01c68f740c95b5852d03a89fe8dff20893f0e144d4699a6db -ChecksumType 'sha256' -Checksum64 bf234acdc9a8ab6c7c3674d220c581853b16d84860776fc1b67a631800b38786 -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir