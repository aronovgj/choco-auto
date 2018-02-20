$packageName = 'crystaldiskinfo.install'
$url = 'https://en.osdn.net/dl/crystaldiskinfo/CrystalDiskInfo7_5_1.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = '3b0ed637655ada93849510e2a9b70b828e4851dece5091c587be16bf467b3f9f'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

