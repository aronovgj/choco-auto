$ErrorActionPreference = 'Stop';
$packageName= 'texstudio'
$url        = 'http://netix.dl.sourceforge.net/project/texstudio/texstudio/TeXstudio 2.10.4/texstudio-2.10.4-win-qt5.5.1.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
}

Install-ChocolateyPackage @packageArgs