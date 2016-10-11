$packageName = 'nextcloud-client'
$url = 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-2.2.3.4-setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
  checksum 		= '08254af4d21b5853c228508823963dd5f2885957fda45a6abfee527831f19593'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs