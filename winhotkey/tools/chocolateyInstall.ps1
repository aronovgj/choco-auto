$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
$url = '{{DownloadUrl}}' 
Stop-Process -ProcessName WinHotKey*
Install-ChocolateyPackage $packageName $fileType $silentArgs $url
