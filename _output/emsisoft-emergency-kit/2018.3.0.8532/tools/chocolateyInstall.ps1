$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= '272042c8b2cd5535410e03ba6ba2a14e2466cce03706a8b61c6754150158c8a6'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs