$packageName = '7taskbartweaker'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'http://www.rammichael.com/downloads/7tt_setup.exe' 
Stop-Process -ProcessName 7+*
Install-ChocolateyPackage $packageName $fileType $silentArgs $url
