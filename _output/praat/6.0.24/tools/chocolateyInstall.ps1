$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6024_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6024_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum d11164e6b13db80e2be33e3ea3ca9a5f0bdbefcb34e3d6a1fbb43a610d27d55e -ChecksumType 'sha256' -Checksum64 f9e1fe72775b85ab1afd54dd0410c5863433f9be216cc1f59ab4dae7cb12bf4b -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir