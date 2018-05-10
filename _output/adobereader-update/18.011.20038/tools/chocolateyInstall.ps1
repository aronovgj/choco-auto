$packageName = 'adobereader-update'
$installerPath = $env:TEMP
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1801120038/AcroRdrDCUpd1801120038_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum 560f58901ef185425c61785fb1073ef2141570e69b1bd4ddd21c2280f894ed61 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force