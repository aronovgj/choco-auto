$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= 'fc1deb415137b22707c1e3265ffccc324525078d3563be8ccffdf72f86478907'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs