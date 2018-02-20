$packageName= 'googleearthpro'
$url = 'https://dl.google.com/earth/client/advanced/current/GoogleEarthProWin.exe' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = 'OMAHA=1'
  url           = $url
  checksum 		= 'a4fb2ae85a85b5e0f35de18053be93a8f76a7e6a701a00828dc1a82437d06260'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs