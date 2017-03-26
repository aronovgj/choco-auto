$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}' 
$fileName = "myHotkey.exe"
$linkName = "myHotkey.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $destdir
  fileType      = 'zip'
  url           = $url
  softwareName  = $packageName
  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath