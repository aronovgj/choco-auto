$packageName = 'wsus-offline-update'
$url = 'http://download.wsusoffline.net/wsusoffline1091.zip'
$destdir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum 46cd9a106a273b31add8dc34a2a5b06a2dd47476c4e3ba0fba6a13e4c5dff7ab -ChecksumType 'sha256'

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