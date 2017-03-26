$ErrorActionPreference = 'Stop';
$packageName= 'google-books-downloader'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.gbooksdownloader.com/gbooks.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url           = $url
  checksum 		= 'c1ba877f3b101557ed18f03e19dacadea435f29c83a769d94448ed0a4b50907a'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs