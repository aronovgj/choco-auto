$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6031_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6031_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum d90e1e52583ff6d224d255ec361656e25cd0ff3e54cd13e48e6bc5d477ba43c9 -ChecksumType 'sha256' -Checksum64 e54097dc527909f3aad72dd16916f5f5d58942e6403bbc005af65262e6479d2d -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir