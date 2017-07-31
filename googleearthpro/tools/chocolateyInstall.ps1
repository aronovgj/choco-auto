$packageName= '{{PackageName}}'
$url = '{{DownloadUrl}}' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = 'OMAHA=1'
  url           = $url
  checksum 		= '{{checksum}}'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs
