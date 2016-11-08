$packageName = 'crystaldiskinfo.install'
$url = 'https://osdn.net/projects/crystaldiskinfo/downloads/65980/CrystalDiskInfo7_0_4-en.exe/' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = '1800282d848c5136d29fa28435e5151e05f797f19094fca9c294e4c2d10cf9af'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

