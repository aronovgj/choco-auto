$ErrorActionPreference = 'Stop';
$packageName= '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' 
  silentArgs    = '/s' 
  url           = $url
  checksum 		= '{{checksum}}'
  checksumType	= 'sha256'
}

Install-ChocolateyPackage @packageArgs