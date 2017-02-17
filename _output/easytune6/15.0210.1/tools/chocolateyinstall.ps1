$ErrorActionPreference = 'Stop'; 

$packageName= 'easytune6'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.gigabyte.ru/utility/motherboard_utility_gbttools_gbt_et6.exe'
$archiveLocation = Join-Path $toolsDir 'easytune.zip'
$folderLocation = Join-Path $toolsDir 'Easytune6'
$fileLocation = Join-Path $folderLocation 'setup.exe'
$silentArgs = '/S /v/qn'
$fileType = 'exe'

Get-ChocolateyWebFile $packageName $archiveLocation $url -Checksum {checksum} -ChecksumType 'sha256'
Get-ChocolateyUnzip $archiveLocation $toolsDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $fileLocation 
Remove-Item $fileLocation -Force
Remove-Item $archiveLocation -Force
