$packageName= 'googleearthpro'
$url = 'https://dl.google.com/earth/client/advanced/current/GoogleEarthProWin.exe' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = ''
  url           = $url
}

Start-Process 'AutoHotkey' $ahkFile
Install-ChocolateyPackage @packageArgs