$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6039_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6039_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum 330557eb1774c20d5d270c08eb8b5bb35db78ed1bdce4c5f16866a2f8d6162c5 -ChecksumType 'sha256' -Checksum64 bb86d830d70a02d78811c9c2f105a636a23f0420c8c6444c077c719dfa34b1f4 -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir