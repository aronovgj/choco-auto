$packageName = 'adobereader-update'
$installerPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1502020042/AcroRdrDCUpd1502020042_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum 4e850a805f190d25794f016317349755f88bbf158c504734c79661a5b34493e0 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force