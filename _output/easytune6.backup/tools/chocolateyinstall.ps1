$ErrorActionPreference = 'Stop'; 

$packageName= 'easytune6'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'ftp://download.gigabyte.ru/utility/motherboard_utility_gbttools_gbt_et6.exe'
$archiveLocation = Join-Path $toolsDir 'easytune.zip'
$folderLocation = Join-Path $toolsDir 'Easytune6'
$fileLocation = Join-Path $folderLocation 'setup.exe'
$silentArgs = '/S /v/qn'
$fileType = 'exe'

Get-ChocolateyWebFile $packageName $archiveLocation $url -Checksum 79b12cfdfded2d35329232b001ba7694fed6f543d69a6869b002fde6f5b5df33 -ChecksumType 'sha256'
Get-ChocolateyUnzip $archiveLocation $toolsDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $fileLocation 
Remove-Item $fileLocation -Force
Remove-Item $archiveLocation -Force
