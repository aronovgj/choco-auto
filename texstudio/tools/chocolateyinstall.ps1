$ErrorActionPreference = 'Stop';
$packageName= '{{PackageName}}'
$url = '{{DownloadUrl}}'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
  Checksum 		= '{{checksum}}' 
  ChecksumType  = 'sha256'

}

Install-ChocolateyPackage @packageArgs