$packageName = 'adobereader-update'
$installerPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320053/AcroRdrDCUpd1502320053_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum bd3861f459b3c7a5f66fb622f431928d18995f56387babb2c41ec81523b2036b -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force