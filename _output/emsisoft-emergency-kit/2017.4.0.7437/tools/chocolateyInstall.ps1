$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= '509f43b2ef3818171373b2f48219d1c44778bcbeb30a51d4991ba375b6d51541'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs