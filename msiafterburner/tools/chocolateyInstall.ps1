$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/S'
$url = '{{DownloadUrl}}'

$unpackDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$unpackFile = Join-Path $unpackDir 'afterburner.zip'
$ProcessActive = Get-Process MSIAfterburner* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
	Stop-Process -ProcessName MSIAfterburner*
}
Get-ChocolateyWebFile $packageName $unpackFile $url -Checksum {{checksum}} -ChecksumType 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
$file = (Get-ChildItem -Path $unpackDir | Where-Object {$_.Name -match "MSIAfterburnerSetup[0-9]{3}.exe$"}).fullname

Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackFile -Recurse -Force
Remove-Item $file -Recurse -Force