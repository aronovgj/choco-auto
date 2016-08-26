$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= 'c6c49f327afb9bfdd63d942cfc98d66a62483160ae33c449c2d4a8b03885143d'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs