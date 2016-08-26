$packageName = '{{PackageName}}'
$fileType = 'msi'
$silentArgs = '/quiet'
$url = '{{DownloadUrl}}' 
#update will fail if evince is on
$ProcessActive = Get-Process evince* -ErrorAction SilentlyContinue
if($ProcessActive -ne $null)
{
    Stop-Process -ProcessName evince*
}
Install-ChocolateyPackage $packageName $fileType $silentArgs $url -Checksum {{checksum}} -ChecksumType 'sha256'
