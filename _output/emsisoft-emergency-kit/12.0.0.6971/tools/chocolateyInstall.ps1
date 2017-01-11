$ErrorActionPreference = 'Stop';
$packageName= 'emsisoft-emergency-kit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.emsisoft.com/EmsisoftEmergencyKit.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= 'db56cd344700ca1f26c5d24fbd1eb25627d14f52f0ddd402b921ab0358c88fe7'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs