$packageName = 'crystaldiskinfo.install'
$url = 'https://osdn.net/projects/crystaldiskinfo/downloads/68126/CrystalDiskInfo7_1_0.exe/' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = 'e73e7b13fe10f9135da2992b897b63a4960abf6b587aaef9e49f8562a9214bc2'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

