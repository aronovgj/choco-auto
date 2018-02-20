$packageName = 'nextcloud-client'
$url = 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-2.3.3.1-setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
  checksum 		= 'a61fd80110df4f7673a88b962d1d1033d9800bdc91ea7183e26c880a3856d90d'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs