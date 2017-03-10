$packageName = 'adobereader-update'
$installerPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = 'http://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320070/AcroRdrDCUpd1502320070_MUI.msp'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum da139d4fc50a8167ff59972bb6f2e3dd738a6b0fcd85c6de78a322c5cc0addb9 -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force