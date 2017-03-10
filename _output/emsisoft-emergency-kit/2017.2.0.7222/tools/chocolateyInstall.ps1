$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= '07d702cc943ddd1bae201108089a914acf0cf9c9e7f90cb10c3d9fbbcad63671'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs