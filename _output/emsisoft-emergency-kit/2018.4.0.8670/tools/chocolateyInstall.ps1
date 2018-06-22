$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= 'de5c373d467125f6e2bb10d8bc2f7f1c3af39f135d559f0af435af8e22192a4f'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs