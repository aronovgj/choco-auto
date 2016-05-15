$packageName = 'crystaldiskinfo'
$forward = 'http://crystalmark.info/redirect.php?product=CrystalDiskInfo'
$fileName = "DiskInfo.exe"
$linkName = "CrystalDiskInfo.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
 
$url = ((Invoke-WebRequest -Uri $forward).Links | Where-Object {$_.href -like "/frs/redir.php*"} ).href[0] -replace 'amp;', ''

$url = 'http://osdn.jp' + $url

Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath