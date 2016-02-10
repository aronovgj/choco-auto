$ErrorActionPreference = 'Stop';
$packageName= '{{PackageName}}'
# misusing DownloadUrlx64 as qt version
$url = 'http://sourceforge.net/projects/texstudio/files/texstudio/TeXstudio%20{{PackageVersion}}/texstudio-{{PackageVersion}}-win-qt{{DownloadUrlx64}}.exe/download' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT'
  url           = $url
}

Install-ChocolateyPackage @packageArgs