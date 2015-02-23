$packageName = 'virustotal-windows-uploader'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'https://www.virustotal.com/static/bin/vtuploader2.2.exe' 
Install-ChocolateyPackage $packageName $fileType $silentArgs $url