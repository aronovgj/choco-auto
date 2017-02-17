$ErrorActionPreference = 'Stop';
$packageName= 'texstudio'
$url = 'https://sourceforge.net/projects/texstudio/files/texstudio/TeXstudio 2.12.2/texstudio-2.12.2-win-qt5.6.2.exe/download'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
  Checksum 		= '5a0112bc6eaa9a3fb463932045bfb670713b92bdb92766861804906463c317d8' 
  ChecksumType  = 'sha256'

}

Install-ChocolateyPackage @packageArgs