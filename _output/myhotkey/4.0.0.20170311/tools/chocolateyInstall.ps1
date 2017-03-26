$packageName = 'myhotkey'
$url = 'https://www.magentacloud.de/api/sharelink/download?id=JLRsoo71' 
$fileName = "myHotkey.exe"
$linkName = "myHotkey.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $destdir
  fileType      = 'zip'
  url           = $url
  softwareName  = $packageName
  checksum      = '0d2e69223b2115d95b4cf8708a70b2ee6391e85af44966881b1bb8e1b299d3ed'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath