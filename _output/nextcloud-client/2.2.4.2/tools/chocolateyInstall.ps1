$packageName = 'nextcloud-client'
$url = 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-2.2.4.2-setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
  checksum 		= '9dfd37a5f0a8afbc516002a9193596d7f323d19bb8169c99354afd7fe0a0d714'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs