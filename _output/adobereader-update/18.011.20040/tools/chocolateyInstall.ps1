$packageName = 'adobereader-update'
$installerPath = $env:TEMP
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1801120040/AcroRdrDCUpd1801120040_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum 96f78ad09502b7029f5609d18e834001d57a8d8aa2ebd5f3fbba4838c2465e9e -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force