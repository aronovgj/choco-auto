$ErrorActionPreference = 'Stop';
$packageName= '{{PackageName}}'
# misusing DownloadUrlx64 as qt version
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