$packageName = 'adobereader-update'
$installerPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'ftp://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1501020060/AcroRdrDCUpd1501020060_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force