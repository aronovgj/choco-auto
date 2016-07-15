$packageName = 'crystaldiskinfo'
$forward = 'http://crystalmark.info/redirect.php?product=CrystalDiskInfo'
$fileName32 = "DiskInfo32.exe"
$fileName64 = "DiskInfo64.exe"
$linkName32 = "CrystalDiskInfox32.lnk"
$linkName64 = "CrystalDiskInfox64.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$url = 'http://crystalmark.info/download/zz/CrystalDiskInfo7_0_0.zip'

Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath32 = Join-Path $programs $linkName32 
$shortcutFilePath64 = Join-Path $programs $linkName64
$targetPath32 = Join-Path $destdir $fileName32
$targetPath64 = Join-Path $destdir $fileName64
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath32 -targetPath $targetPath32
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath64 -targetPath $targetPath64