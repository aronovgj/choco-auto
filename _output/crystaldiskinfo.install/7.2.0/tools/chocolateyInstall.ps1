$packageName = 'crystaldiskinfo.install'
$url = 'https://en.osdn.net/dl/crystaldiskinfo/CrystalDiskInfo7_2_0.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = '18da0cf2a2f1c355e8e742c2d4080ff5c6b78e7f96e75a7616983555263cf639'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

