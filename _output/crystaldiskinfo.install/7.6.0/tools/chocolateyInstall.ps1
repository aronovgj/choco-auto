$packageName = 'crystaldiskinfo.install'
$url = 'https://osdn.net/projects/crystaldiskinfo/downloads/69241/CrystalDiskInfo7_6_0.exe/' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = '7245ae12858b28cdd4f95e018409db79616b8580b1c59c5d75e96abee68ceaf3'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

