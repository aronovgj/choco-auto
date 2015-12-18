$packageName = '{{PackageName}}'
$installerPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = '{{DownloadUrl}}'
Get-ChocolateyWebFile $packageName $filePath $url
#no support for msp files
Start-ChocolateyProcessAsAdmin $args 'msiexec'