$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= '015d9d6897359fcfe0b69d2aa0077ed5c6c8774bec2900ed7e7eea35fdeca06b'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs