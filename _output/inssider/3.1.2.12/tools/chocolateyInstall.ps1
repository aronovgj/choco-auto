$url = 'http://files01.techspot.com/temp/inSSIDer-installer.msi' 
$packageName = 'inssider'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
  url           = $url
  silentArgs    = '/passive'
  softwareName  = $packageName
  checksum      = '05c0442d092c5ad067aaa2dcbd4119866fe2bef01b22a5906ef6ae9e592d3d3e'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
