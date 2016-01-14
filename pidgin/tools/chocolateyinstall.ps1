$ErrorActionPreference = 'Stop';
$packageName= '{{PackageName}}'
$url        = 'http://sourceforge.net/projects/pidgin/files/Pidgin/{{PackageVersion}}/pidgin-{{PackageVersion}}-offline.exe/download' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
}
Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue
Install-ChocolateyPackage @packageArgs