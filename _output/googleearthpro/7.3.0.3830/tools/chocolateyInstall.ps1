$packageName= 'googleearthpro'
$url = 'https://dl.google.com/earth/client/advanced/current/GoogleEarthProWin.exe' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = 'OMAHA=1'
  url           = $url
  checksum 		= '7fd3e55928182acb049589841c27c9613ff2b47fda736efa03700da2125d1bbf'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs