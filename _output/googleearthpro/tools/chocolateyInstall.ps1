$packageName= 'googleearthpro'
$url = 'https://dl.google.com/earth/client/advanced/current/GoogleEarthProWin.exe' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = ''
  url           = $url
  checksum 		= '9f88ab96b64e73ff4ace1033c3d1d3a63771ea8129e06903318d3c22eb001772'
  ChecksumType 	= 'sha256'
}

Start-Process 'AutoHotkey' $ahkFile
Install-ChocolateyPackage @packageArgs