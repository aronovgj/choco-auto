$packageName= 'googleearthpro'
$url = 'https://dl.google.com/earth/client/advanced/current/GoogleEarthProWin.exe' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = ''
  url           = $url
  checksum 		= '904eb9defcdb2b583ced47979dc1028a1c82fe1a270b5efdd88dab2dc32d0919'
  ChecksumType 	= 'sha256'
}

Start-Process 'AutoHotkey' $ahkFile
Install-ChocolateyPackage @packageArgs