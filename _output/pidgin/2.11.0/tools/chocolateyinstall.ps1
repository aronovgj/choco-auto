$ErrorActionPreference = 'Stop';
$packageName= 'pidgin'
$url        = 'http://sourceforge.net/projects/pidgin/files/Pidgin/2.11.0/pidgin-2.11.0-offline.exe/download' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
}
Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs