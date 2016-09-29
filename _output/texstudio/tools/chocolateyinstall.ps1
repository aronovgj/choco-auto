$ErrorActionPreference = 'Stop';
$packageName= 'texstudio'
# misusing DownloadUrlx64 as qt version
$url = 'http://netix.dl.sourceforge.net/project/texstudio/texstudio/TeXstudio 2.11.2/texstudio-2.11.2-win-qt5.6.1.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
  Checksum 		= '1b352349bb13d7ed0eff74822d1e71b4168b3f5c26ae000d9e97a3784d7cf4ae' 
  ChecksumType  = 'sha256'

}

Install-ChocolateyPackage @packageArgs