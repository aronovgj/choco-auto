$ErrorActionPreference = 'Stop';
$packageName= '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url           = $url
  checksum 		= '{{checksum}}'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs