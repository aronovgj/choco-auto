$packageName = 'nextcloud-client'
$url = 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-2.3.1.8-setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
  checksum 		= '7ab636fbd203922e49f270fa2c613a40a2f462f5e92322ae3f24d51899b31fc7'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs