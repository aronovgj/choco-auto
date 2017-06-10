$packageName = '{{PackageName}}'
$installerPath = $env:TEMP
$filePath = Join-Path $installerPath 'acroreadupdater.msp'
$args = "/p $filePath /quiet"
$url = '{{DownloadUrl}}'
Get-ChocolateyWebFile $packageName $filePath $url -Checksum {{checksum}} -ChecksumType 'sha256'
#no support for msp files: https://github.com/chocolatey/choco/issues/509
Start-ChocolateyProcessAsAdmin $args 'msiexec'
Remove-Item $filePath -Force