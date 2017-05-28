$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6029_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6029_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum a1f528ed8ca4a26f6de5c8c99e7c2385ce381067fd219b764cacf6c66240507e -ChecksumType 'sha256' -Checksum64 1660932d28365ad4dfdabea8a9bbee9b7d125396ba69967936c2e81102f3467d -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir