$ErrorActionPreference = 'Stop';
$packageName= 'pidgin'
$url        = 'http://sourceforge.net/projects/pidgin/files/Pidgin/2.10.12/pidgin-2.10.12-offline.exe/download' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
}
Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue
Install-ChocolateyPackage @packageArgs