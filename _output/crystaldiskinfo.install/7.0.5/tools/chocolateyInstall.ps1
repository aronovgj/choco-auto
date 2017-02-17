$packageName = 'crystaldiskinfo.install'
$url = 'https://osdn.net/projects/crystaldiskinfo/downloads/65980/CrystalDiskInfo7_0_5.exe/' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = '1865ecced73647936621a04997595a3a7d30633be47e7e640214ea4f0c104ce5'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

