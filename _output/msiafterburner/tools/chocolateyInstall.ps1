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
Get-ChocolateyWebFile $packageName $unpackFile $url -Checksum 940923ae2f994ec40c28bceaf03202e7172e42b7b728a93ceeece9e7c6c6d853 -ChecksumType 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
$file = (Get-ChildItem -Path $unpackDir | Where-Object {$_.Name -match "MSIAfterburnerSetup[0-9]{3}.exe$"}).fullname

Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackFile -Recurse -Force
Remove-Item $file -Recurse -Force