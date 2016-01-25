$packageName = 'crystaldiskinfo'
$url = 'http://sourceforge.jp/frs/redir.php?m=jaist&f=/crystaldiskinfo/64337/CrystalDiskInfo6_7_0.zip'
$fileName = "DiskInfo.exe"
$linkName = "CrystalDiskInfo.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath