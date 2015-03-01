$packageName = '7-taskbar-tweaker'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'http://www.rammichael.com/downloads/7tt_setup.exe' 
Install-ChocolateyPackage $packageName $fileType $silentArgs $url
