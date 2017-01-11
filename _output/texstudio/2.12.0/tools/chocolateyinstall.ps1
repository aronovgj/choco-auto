$ErrorActionPreference = 'Stop';
$packageName= 'texstudio'
$url = 'https://sourceforge.net/projects/texstudio/files/texstudio/TeXstudio 2.12.0/texstudio-2.12.0-win-qt5.6.2.exe/download'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
  Checksum 		= '5209155e026d11ce7426f61e5ec5dbcfe645ca0b8c1d15a325bfb6d26f38c75f' 
  ChecksumType  = 'sha256'

}

Install-ChocolateyPackage @packageArgs