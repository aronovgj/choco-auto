$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= 'D38D6AAAD65B93D1C0D21A0DC7AD818910E7CF91099C641EB7572B5F2CAE211A'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs