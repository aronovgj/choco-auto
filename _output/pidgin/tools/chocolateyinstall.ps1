$ErrorActionPreference = 'Stop';
$packageName= 'pidgin'
$url        = 'http://sourceforge.net/projects/pidgin/files/Pidgin/2.11.0/pidgin-2.11.0-offline.exe/download' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
  Checksum 		= '22563315872c82e4ad6c3a186749a5685dc21fbbc622e7e64c1bd093a6ec0bc9'
  ChecksumType 	= 'sha256'
}
Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs