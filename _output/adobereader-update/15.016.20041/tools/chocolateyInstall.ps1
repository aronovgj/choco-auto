$packageName = 'adobereader-update'
$installerPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1501620041/AcroRdrDCUpd1501620041_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force