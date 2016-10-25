$packageName = 'jdownloader'
$url = 'http://installer.jdownloader.org/ic/JD2SilentSetup_x86.exe'
$url64 = 'http://installer.jdownloader.org/ic/JD2SilentSetup_x64.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '-q'
  url           = $url
  url64bit		= $url64
  checksum 		= '{{checksum}}'
  checksumType 	= 'sha256'
  checksum64     = '{{checksumx64}}'
  checksumType64 = 'sha256'
  
}

Install-ChocolateyPackage @packageArgs
