$packageName = 'adobereader-update'
$installerPath = $env:TEMP
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1701220098/AcroRdrDCUpd1701220098_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum 10222fada8b75469fac6d2d556170957dc464c956f336e8b3ff7a93638ffd370 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force