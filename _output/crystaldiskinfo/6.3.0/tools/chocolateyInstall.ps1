$packageName = 'crystaldiskinfo'
$url = 'http://sourceforge.jp/frs/redir.php?m=jaist&f=/crystaldiskinfo/62506/CrystalDiskInfo6_3_0.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "CrystalDiskInfo.lnk"
$targetPath = Join-Path $destdir "DiskInfo.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath