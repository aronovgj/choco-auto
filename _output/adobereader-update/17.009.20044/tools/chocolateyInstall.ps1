$packageName = 'adobereader-update'
$installerPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1700920044/AcroRdrDCUpd1700920044_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum 49c4d8ca7f4e2a07500454fb3c5aeb1837d9386010763130f4edfcf787b6a94a -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force