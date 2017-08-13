$packageName = 'adobereader-update'
$installerPath = $env:TEMP
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1701220095/AcroRdrDCUpd1701220095_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum 664aebf0bf31cfd841196cd7e323726f8a1deb6e2f74bb8ec938425f85e44623 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force