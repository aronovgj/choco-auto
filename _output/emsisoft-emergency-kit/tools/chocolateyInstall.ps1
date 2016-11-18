$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= 'c2c5ea0afa011923c777929fdc222d17210217f141b004ad4ea950dfbe500bf0'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs