$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= 'e7255ac00805f2347594f15e8a9ebc3e0167f12b9a875526a6f40412b68e5ac5'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs