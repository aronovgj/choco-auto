$packageName= 'googleearthpro'
$url = 'https://dl.google.com/earth/client/advanced/current/GoogleEarthProWin.exe' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = 'OMAHA=1'
  url           = $url
  checksum 		= '232074ad00344d60f4f65b3bb900148ba1f50ef6a648b414e7cbb362d8137051'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs