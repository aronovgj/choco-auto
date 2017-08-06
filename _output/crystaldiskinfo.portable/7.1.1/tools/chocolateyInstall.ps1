$packageName = 'crystaldiskinfo.portable'
$url = 'https://en.osdn.net/dl/crystaldiskinfo/CrystalDiskInfo7_1_1.zip' 
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
  checksum      = '1fa89ce49fc0a67d5aec905b681df36dc8ae922b2fe2ceb74d21e0e7dbb46333'
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