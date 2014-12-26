$packageName = 'praat-x32'
$url = 'http://www.fon.hum.uva.nl/praat/praat5403_win32.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"
