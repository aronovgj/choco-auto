$ErrorActionPreference = 'Stop';
$packageName= 'texstudio'
# misusing DownloadUrlx64 as qt version
$url = 'http://sourceforge.net/projects/texstudio/files/texstudio/TeXstudio%202.11.0/texstudio-2.11.0-win-qt5.5.1.exe/download' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
}

Install-ChocolateyPackage @packageArgs