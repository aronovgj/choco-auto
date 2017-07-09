$packageName = 'wsus-offline-update'
$url = 'http://download.wsusoffline.net/wsusoffline110.zip'
$destdir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum 97ed0ce55ffe4a226a7a0798c89f2a07abff32c1f966add20006ab30e19c3378 -ChecksumType 'sha256'

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