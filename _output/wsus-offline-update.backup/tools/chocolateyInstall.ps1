$packageName = 'wsus-offline-update'
$url = 'http://download.wsusoffline.net/wsusoffline1074.zip'
$destdir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum 1c1172c7f38555f1d63d0013c40759b1f7c02e762dcfc522af68442243120203 -ChecksumType 'sha256'

#install start menu shortcut
$fileNameGen = "UpdateGenerator.exe"
$fileNameInst = "UpdateInstaller.exe"
$linkNameGen = "UpdateGenerator.lnk"
$linkNameInst = "UpdateInstaller.lnk"
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePathGen = Join-Path $programs $linkNameGen
$shortcutFilePathInst = Join-Path $programs $linkNameInst
$targetPathGen = Join-Path "$destdir\wsusoffline" $fileNameGen
$targetPathInst = Join-Path "$destdir\wsusoffline\client" $fileNameInst
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePathGen -targetPath $targetPathGen
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePathInst -targetPath $targetPathInst