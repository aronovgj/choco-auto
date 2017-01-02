$packageName = 'rainmeter'
$url = 'https://github.com/rainmeter/rainmeter/releases/download/v4.0.0.2746/Rainmeter-4.0.exe'
$silentArgs = '/S /PORTABLE=0 /STARTUP=1'
$osBitness = Get-ProcessorBits
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"
$fileType = 'exe'

Start-Process 'AutoHotkey' $ahkFile

Install-ChocolateyPackage $packageName $fileType $silentArgs $url -Checksum 31b9d58b65c6ffac9450c33469dbec2e6463b6855b6d917daa8ee51c5d6d4753 -ChecksumType 'sha256'
