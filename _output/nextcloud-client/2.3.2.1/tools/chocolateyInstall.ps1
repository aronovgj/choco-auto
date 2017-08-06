$packageName = 'nextcloud-client'
$url = 'https://download.nextcloud.com/desktop/releases/Windows/Nextcloud-2.3.2.1-setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
  checksum 		= '4761b840c09d6a4c0c51209cc08e5588636c27617b98ba8854d03b1ccef39087'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs