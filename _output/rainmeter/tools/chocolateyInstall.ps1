$packageName = 'rainmeter'
$url = 'https://github.com/rainmeter/rainmeter/releases/download/v4.0.0.2746/Rainmeter-4.0.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

Start-Process 'AutoHotkey' $ahkFile

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = ''
  url           = $url
  checksum 		= '31b9d58b65c6ffac9450c33469dbec2e6463b6855b6d917daa8ee51c5d6d4753'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs
