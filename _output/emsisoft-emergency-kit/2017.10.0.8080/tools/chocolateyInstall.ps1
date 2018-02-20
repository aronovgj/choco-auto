$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= '9f96445e7bb1c64c25ea59b584cb2002ea79fac1d7dbf6629f8d5d0257617390'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs