$packageName = 'crystaldiskinfo'
$url = 'http://crystalmark.info/download/zz/CrystalDiskInfo6_7_5.zip'
$fileName = "DiskInfo.exe"
$linkName = "CrystalDiskInfo.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath