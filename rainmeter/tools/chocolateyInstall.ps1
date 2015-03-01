$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$silentArgs = '/S'
$fileType = 'exe'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url
