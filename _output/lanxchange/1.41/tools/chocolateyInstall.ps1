$packageName = 'lanxchange'
$url = 'https://github.com/tfg13/LanXchange/raw/master/releases/stable/lxc.zip' 
$fileName = "lxc.exe"
$linkName = "lxc.lnk"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = $url
  softwareName  = $packageName
  checksum      = '18fb4e05a8cf858baf1ff3b079be63eb6228424eb5de596f3cc604dbb8fa2102'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

#install start menu shortcut

$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $toolsDir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath