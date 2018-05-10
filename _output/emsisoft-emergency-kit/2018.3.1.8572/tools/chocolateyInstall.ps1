$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= 'fb17f97a03e5453824cec6280570d63077bfeec80f389740a6a1f9c7fd38b39e'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs