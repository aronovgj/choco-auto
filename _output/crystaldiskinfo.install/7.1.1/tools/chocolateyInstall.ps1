$packageName = 'crystaldiskinfo.install'
$url = 'https://en.osdn.net/dl/crystaldiskinfo/CrystalDiskInfo7_1_1.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = 'aa8a4050131b59652a7344c34b782405ab17ed1599fdae8dcadb2dd182fef374'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

