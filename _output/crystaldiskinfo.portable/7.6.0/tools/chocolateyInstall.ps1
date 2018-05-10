$packageName = 'crystaldiskinfo.portable'
$url = 'https://osdn.net/projects/crystaldiskinfo/downloads/69241/CrystalDiskInfo7_6_0.zip/' 
$fileName32 = "DiskInfo32.exe"
$fileName64 = "DiskInfo64.exe"
$linkName = "CrystalDiskInfo.lnk"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = $url
  softwareName  = $packageName
  checksum      = '2868c95723da0362e01f9575831e960e5205dd04382f7cc55d778b99de896896'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#install start menu shortcut
$fileName = $fileName32
$is64bit = Get-ProcessorBits 64
if ($is64bit) {
  $fileName = $fileName64
}

$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $toolsDir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath