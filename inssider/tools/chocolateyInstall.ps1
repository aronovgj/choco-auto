$url = '{{DownloadUrl}}' 
$packageName = '{{PackageName}}'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
  url           = $url
  silentArgs    = '/passive'
  softwareName  = $packageName
  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
