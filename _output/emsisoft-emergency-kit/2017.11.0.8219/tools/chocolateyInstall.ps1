$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= 'f938b452d329c84ab6d86c0ae17b98e38c6c4d2d1fd8922655d7bbe3ccb87cc5'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs