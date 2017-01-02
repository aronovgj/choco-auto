$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"
$fileType = 'exe'

Start-Process 'AutoHotkey' $ahkFile

Install-ChocolateyPackage $packageName $fileType $url -Checksum {{checksum}} -ChecksumType 'sha256'
