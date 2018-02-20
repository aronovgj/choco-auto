$packageName= 'googleearthpro'
$url = 'https://dl.google.com/earth/client/advanced/current/GoogleEarthProWin.exe' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = 'OMAHA=1'
  url           = $url
  checksum 		= 'cc1569ca7a7614c2586ad46360cfd3d002333eba2e572e3a2759cac051e6d196'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs