$packageName = 'adobereader-update'
$installerPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320056/AcroRdrDCUpd1502320056_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum 58b742c048a314de774dfba95f395dca94259fe2aa49fe44cdec7faf24d6fd37 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force