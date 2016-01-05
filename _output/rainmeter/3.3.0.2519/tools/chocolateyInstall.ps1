$packageName = 'rainmeter'
$url = 'https://github.com/rainmeter/rainmeter/releases/download/v3.3.0.2519/Rainmeter-3.3.exe'
$silentArgs = '/S /PORTABLE=0 /STARTUP=1'
$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
  $silentArgs = '/S /VERSION=64 /PORTABLE=0 /STARTUP=1'
}
$fileType = 'exe'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url