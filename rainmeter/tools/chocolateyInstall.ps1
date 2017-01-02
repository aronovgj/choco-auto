$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$silentArgs = '/S /PORTABLE=0 /STARTUP=1'
$osBitness = Get-ProcessorBits
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"
$fileType = 'exe'

Start-Process 'AutoHotkey' $ahkFile

Install-ChocolateyPackage $packageName $fileType $silentArgs $url -Checksum {{checksum}} -ChecksumType 'sha256'
