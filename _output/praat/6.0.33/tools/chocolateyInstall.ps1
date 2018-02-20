$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6033_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6033_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum 7810a144fe2db4e3f6ceac3e86d24d58c93affcbb1d1dbfd357e0476f375cbb6 -ChecksumType 'sha256' -Checksum64 2ddf8ed0058a8fe05bd7c0fa77deb5ff236ab3f06fc6e559557e083f4ce8a93e -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir