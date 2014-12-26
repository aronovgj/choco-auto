$packageName = 'praat-x64'
$url = 'http://www.fon.hum.uva.nl/praat/praat5403_win64.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"
