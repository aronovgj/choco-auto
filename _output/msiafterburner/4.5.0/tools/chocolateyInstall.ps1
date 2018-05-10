$packageName = 'msiafterburner'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'http://download.msi.com/uti_exe//vga/MSIAfterburnerSetup.zip'

$unpackDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$unpackFile = Join-Path $unpackDir 'afterburner.zip'
$ProcessActive = Get-Process MSIAfterburner* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
	Stop-Process -ProcessName MSIAfterburner*
}
Get-ChocolateyWebFile $packageName $unpackFile $url -Checksum 9ee61b6070cb84a56079f86b68c5b73f62162019bd50ac553ca6d60feb70bba0 -ChecksumType 'sha256'
Get-ChocolateyUnzip -fileFullPath $unpackFile -destination $unpackDir
$file = (Get-ChildItem -Path $unpackDir -Recurse | Where-Object {$_.Name -match "MSIAfterburnerSetup.*.exe$"}).fullname

Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackFile -Recurse -Force
Remove-Item $file -Recurse -Force