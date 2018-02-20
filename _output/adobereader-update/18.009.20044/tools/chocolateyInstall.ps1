$packageName = 'adobereader-update'
$installerPath = $env:TEMP
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1800920044/AcroRdrDCUpd1800920044_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum a92f6b67f83c0cf40cd0f2437f97bb7275eb9e7675be20fcfc066b26f6126b06 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force