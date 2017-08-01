$packageName = 'adobereader-update'
$installerPath = $env:TEMP
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1700920058/AcroRdrDCUpd1700920058_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum 747a4f85e072bd858494278a562201341c006d2c1f250547ca9dfa3185702be1 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force