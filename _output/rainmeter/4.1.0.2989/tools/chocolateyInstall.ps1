$packageName = 'rainmeter'
$url = 'https://github.com/rainmeter/rainmeter/releases/download/v4.1.0.2989/Rainmeter-4.1.exe'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = "$toolsDir\button.ahk"

Start-Process 'AutoHotkey' $ahkFile

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  silentArgs    = ''
  url           = $url
  checksum 		= '5351c37bc348f6ff32bf1b1df1910f1088cf79d0b1abd4ddf8550f41d8b3de69'
  ChecksumType 	= 'sha256'
}

Install-ChocolateyPackage @packageArgs
