$packageName = 'msiafterburner'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'http://download.msi.com/uti_exe/vga/MSIAfterburnerSetup.zip'

$unpackDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$unpackFile = Join-Path $unpackDir 'afterburner.zip'
$ProcessActive = Get-Process MSIAfterburner* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
	Stop-Process -ProcessName MSIAfterburner*
}
Get-ChocolateyWebFile $packageName $unpackFile $url -Checksum 2bbb85effddb8c294cbdb439f38fc028f221fcc6cc0eb53d0526ba7ab1f4fc3c -ChecksumType 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
$file = (Get-ChildItem -Path $unpackDir | Where-Object {$_.Name -match "MSIAfterburnerSetup.*.exe$"}).fullname

Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackFile -Recurse -Force
Remove-Item $file -Recurse -Force