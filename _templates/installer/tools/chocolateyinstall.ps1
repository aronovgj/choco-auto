$ErrorActionPreference = 'Stop';
$packageName= '{{PackageName}}'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}' 
$url64      = '{{DownloadUrlx64}}' # REMOVE IF NOT NEEDED

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE' #CHANGE
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' #CHANGE
  url           = $url
  url64bit      = $url64 # REMOVE url64 IF NOT NEEDED
}

Install-ChocolateyPackage @packageArgs