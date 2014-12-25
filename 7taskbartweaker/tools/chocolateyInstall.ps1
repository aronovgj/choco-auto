$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/S'
$url = '{{DownloadUrl}}' 
Stop-Process -ProcessName 7+*
Install-ChocolateyPackage $packageName $fileType $silentArgs $url
