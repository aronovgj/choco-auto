$packageName = '{{PackageName}}'
$fileType = 'msi'
$silentArgs = '/quiet'
$url = '{{DownloadUrl}}' 
Stop-Process -ProcessName evince*
Install-ChocolateyPackage $packageName $fileType $silentArgs $url
