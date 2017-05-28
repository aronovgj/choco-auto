$ErrorActionPreference = 'Stop';
$packageName= 'texstudio'
$url = 'https://sourceforge.net/projects/texstudio/files/texstudio/TeXstudio 2.12.4/texstudio-2.12.4-win-qt5.6.2.exe/download'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
  Checksum 		= '9971da103949d00ce3d28c133dfd3c20d0ff8920d96eb1589e667c443ea921fc' 
  ChecksumType  = 'sha256'

}

Install-ChocolateyPackage @packageArgs