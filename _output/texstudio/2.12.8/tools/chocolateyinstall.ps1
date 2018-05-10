$ErrorActionPreference = 'Stop';
$packageName= 'texstudio'
$url = 'https://github.com/texstudio-org/texstudio/releases/download/2.12.8/texstudio-2.12.8-win-qt5.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/S'
  url           = $url
  Checksum 		= 'ecd810893253026f96533ce57b60c048afdf754bc315b43b2ba5dcac206d5fe3' 
  ChecksumType  = 'sha256'

}

Install-ChocolateyPackage @packageArgs