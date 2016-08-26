$ErrorActionPreference = 'Stop';
$packageName= 'texstudio'
# misusing DownloadUrlx64 as qt version
$url = 'http://sourceforge.net/projects/texstudio/files/texstudio/TeXstudio%202.11.0/texstudio-2.11.0-win-qt5.5.1.exe/download' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
  Checksum 		= '8281e8b932958e9f0347e24e33992d786488285b12536bf6589739c452a438d5' 
  ChecksumType  = 'sha256'

}

Install-ChocolateyPackage @packageArgs