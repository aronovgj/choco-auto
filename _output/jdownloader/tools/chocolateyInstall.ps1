$packageName = 'jdownloader'
$url = 'http://installer.jdownloader.org/ic/JD2SilentSetup_x86.exe'
$url64 = 'http://installer.jdownloader.org/ic/JD2SilentSetup_x64.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '-q'
  url           = $url
  url64bit		= $url64
  checksum 		= '3e2767491d8cb69fb1d9def6904a34b75f977919bb588af37dbb50c2cf60bc32'
  checksumType 	= 'sha256'
  checksum64     = 'd5ec2f7413f5494f829dc126a6076bb9e8765db4f5b0d64545649de67017df9b'
  checksumType64 = 'sha256'
  
}

Install-ChocolateyPackage @packageArgs
