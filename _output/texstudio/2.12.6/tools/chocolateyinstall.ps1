$ErrorActionPreference = 'Stop';
$packageName= 'texstudio'
$url = 'https://sourceforge.net/projects/texstudio/files/texstudio/TeXstudio 2.12.6/texstudio-2.12.6-win-qt5.9.1.exe/download'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
  Checksum 		= 'da9015aef3f05abee1670b7205c0d9c9461f2e476e3e9125680f29121455c0ae' 
  ChecksumType  = 'sha256'

}

Install-ChocolateyPackage @packageArgs