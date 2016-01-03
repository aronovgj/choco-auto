$ErrorActionPreference = 'Stop'; 

$packageName= '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}'
$archiveLocation = Join-Path $toolsDir 'easytune.zip'
$folderLocation = Join-Path $toolsDir 'Easytune6'
$fileLocation = Join-Path $folderLocation 'setup.exe'
$silentArgs = '/S /v/qn'
$fileType = 'exe'

Get-ChocolateyWebFile $packageName $archiveLocation $url
Get-ChocolateyUnzip $archiveLocation $toolsDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $fileLocation 
Remove-Item $fileLocation -Force
Remove-Item $archiveLocation -Force
