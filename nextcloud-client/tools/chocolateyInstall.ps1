$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
  checksum 		= '{{checksum}}'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs