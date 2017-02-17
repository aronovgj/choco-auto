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
Get-ChocolateyWebFile $packageName $unpackFile $url -Checksum 622fc9f65fcfebc23c85a18af7bacb4984c528505067b331dba1f28703db63ed -ChecksumType 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
$file = (Get-ChildItem -Path $unpackDir | Where-Object {$_.Name -match "MSIAfterburnerSetup.*.exe$"}).fullname

Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackFile -Recurse -Force
Remove-Item $file -Recurse -Force