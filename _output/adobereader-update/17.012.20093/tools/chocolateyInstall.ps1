$packageName = 'adobereader-update'
$installerPath = $env:TEMP
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1701220093/AcroRdrDCUpd1701220093_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum 77481f5de925dc655f26928185c7dbeabb715e3c5324ed492ce4d89d055ce900 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force