$ErrorActionPreference = 'Stop'; 

$packageName= '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}'
$url64      = '{{DownloadUrlx64}}' # REMOVE IF NOT NEEDED
$archiveLocation = Join-Path $toolsDir 'NAME_OF_ARCHIVE.zip' # CHANGE
$fileLocation = Join-Path $toolsDir 'NAME_OF_INSTALLER.exe' # CHANGE
$silentArgs = '-s -noreboot' # CHANGE
$fileType = 'exe' # CHANGE

Get-ChocolateyWebFile $packageName $archiveLocation $url $url64 # REMOVE url64 IF NOT NEEDED
Get-ChocolateyUnzip $archiveLocation $toolsDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $fileLocation 
Remove-Item $fileLocation -Force
Remove-Item $archiveLocation -Force
