$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

Start-Process 'AutoHotkey' $ahkFile

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = ''
  url           = $url
  checksum 		= '{{checksum}}'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs
