$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= 'ac04659ee28b28ca97ea74309562302b00f946d95416ec0af4eda8e33b374767'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs