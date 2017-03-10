$ErrorActionPreference = 'Stop';
$packageName= 'pidgin'
$url        = 'http://sourceforge.net/projects/pidgin/files/Pidgin/2.12.0/pidgin-2.12.0-offline.exe/download' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
  Checksum 		= 'eda8a422c8d99a1d136a807d0363c9609c05d9f909f6313efb4e2f34f606b484'
  ChecksumType 	= 'sha256'
}
Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs