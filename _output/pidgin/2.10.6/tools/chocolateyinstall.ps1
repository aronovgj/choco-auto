$ErrorActionPreference = 'Stop';
$packageName= 'pidgin'
$url        = 'http://sourceforge.net/projects/pidgin/files/Pidgin/2.10.6/pidgin-2.10.6-offline.exe/download' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
  Checksum 		= 'df5f3e7ed4cb4c9d767f6fda817ce2a74120c099e98792ba8183ed5ae18eab39'
  ChecksumType 	= 'sha256'
}
Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs