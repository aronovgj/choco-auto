$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat6025_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat6025_win64.zip'
$fileName = "Praat.exe"
$linkName = "Praat.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64" -Checksum b16f333c570b67b6fc887120e80f9384861d7993182d155c33722dec0eb8777d -ChecksumType 'sha256' -Checksum64 88bb7114bdec397afef9b399ed25b6f9ad5a4202ba762557be90a519cd19a132 -ChecksumType64 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

#make usable in commandline
Install-ChocolateyPath $destdir