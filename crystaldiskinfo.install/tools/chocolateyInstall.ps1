$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

