$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6023_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6023_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum 79b50b38a963a5501f8511ab5a087c6bae0861742316a3b043a1ae052234af99 -ChecksumType 'sha256' -Checksum64 2df28102113e6bb30cbff66d8013b49c37bccceca1823551957be607c9e70fda -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir