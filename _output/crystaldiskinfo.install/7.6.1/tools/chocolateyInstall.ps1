$packageName = 'crystaldiskinfo.install'
$url = 'https://osdn.net/projects/crystaldiskinfo/downloads/69241/CrystalDiskInfo7_6_1.exe/' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = 'd3a197e4ff8f8aa070d5e2f7b52381a05ea0888e5b73104251212693fa9a8174'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

