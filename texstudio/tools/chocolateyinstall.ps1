$ErrorActionPreference = 'Stop';
$packageName= '{{PackageName}}'
$url        = '{{DownloadUrl}}' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
}

Install-ChocolateyPackage @packageArgs