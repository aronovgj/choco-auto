$packageName = 'rainmeter'
$url = 'https://github.com/rainmeter/rainmeter/releases/download/v3.1.0.2290/Rainmeter-3.1.exe'
$silentArgs = '/S'
$fileType = 'exe'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url
