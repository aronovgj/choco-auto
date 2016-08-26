$packageName = 'rainmeter'
$url = 'https://github.com/rainmeter/rainmeter/releases/download/v3.3.2.2609/Rainmeter-3.3.2.exe'
$silentArgs = '/S /PORTABLE=0 /STARTUP=1'
$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
  $silentArgs = '/S /VERSION=64 /PORTABLE=0 /STARTUP=1'
}
$fileType = 'exe'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url -Checksum 2d4a8ad16a6959e3b0915a643d767f1b24e13ec6d071a40d0c62d5dce9db94ca -ChecksumType 'sha256'
