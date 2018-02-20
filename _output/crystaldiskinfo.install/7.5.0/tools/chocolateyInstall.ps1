$packageName = 'crystaldiskinfo.install'
$url = 'https://en.osdn.net/dl/crystaldiskinfo/CrystalDiskInfo7_5_0.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = '2191a44f879918840d132f5c34b877f64c391ffba1533c784be124ca99bbf583'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

