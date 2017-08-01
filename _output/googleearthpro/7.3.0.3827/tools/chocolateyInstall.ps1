$packageName= 'googleearthpro'
$url = 'https://dl.google.com/earth/client/advanced/current/GoogleEarthProWin.exe' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = ''
  url           = $url
  checksum 		= '404c5ef1faa7cf272b9575db50d21b034697ace73f628dc40490bdafb5e2ee88'
  ChecksumType 	= 'sha256'
}

Start-Process 'AutoHotkey' $ahkFile
Install-ChocolateyPackage @packageArgs