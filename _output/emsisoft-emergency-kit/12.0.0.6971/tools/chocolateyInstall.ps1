$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= '3b5da5e62a47450aee6a58fea02d10115d0a5d2144e9244f3b75ed86358e39f9'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs