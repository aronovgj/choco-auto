$packageName = 'adobereader-update'
$installerPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1501720053/AcroRdrDCUpd1501720053_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum 1c46c345e277e09f74a7606cba18b6efbe43515ef294aff4d5d5b7a482c53474 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force