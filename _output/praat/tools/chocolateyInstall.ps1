$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6021_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6021_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum c153ba5ed48f79114288cce1c950f67be5267f41bbeb062567ef1adb10d0953f -ChecksumType 'sha256' -Checksum64 6be5e15c3608ecc4288b5852cb3fca697a474087ff8a3994bc4eea3a136c8afc -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir