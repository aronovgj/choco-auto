$packageName = 'adobereader-update'
$installerPath = $env:TEMP
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1800920050/AcroRdrDCUpd1800920050_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum b5c746c86194eb568b246a716d69befcc905bfe41bfadd6c3bbf3ce4d7337b56 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force