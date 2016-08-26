$packageName= '{{PackageName}}'
$url = '{{DownloadUrl}}' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = ''
  url           = $url
  checksum 		= '{{checksum}}'
  ChecksumType 	= 'sha256'
}

Start-Process 'AutoHotkey' $ahkFile
Install-ChocolateyPackage @packageArgs