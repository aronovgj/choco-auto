$packageName = 'wsus-offline-update'
$url = 'http://download.wsusoffline.net/wsusoffline108.zip'
$destdir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum 1e37a89799719305ece0c331e1d7d1b9531722bd77cbad780c01f625fb9dd91e -ChecksumType 'sha256'

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