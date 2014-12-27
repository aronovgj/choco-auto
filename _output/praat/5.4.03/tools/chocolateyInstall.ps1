$packageName = 'praat'
$url = 'http://www.fon.hum.uva.nl/praat/praat5403_win32.zip'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat5403_win64.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64"
