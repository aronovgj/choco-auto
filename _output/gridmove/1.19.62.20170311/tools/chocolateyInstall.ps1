$packageName = 'gridmove'
$url = 'http://www.jgpaiva.dcmembers.com/CS/GridMove/GridMoveSetup.exe' 

Stop-Process -ProcessName gridmove*
$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = $packageName
  checksum      = 'ef377079bcd6215f07aaba72c74c17a33cf2e5eb3eeed538fc2d0084670295d2'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs