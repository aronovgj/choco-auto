$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$url64 = 'http://www.fon.hum.uva.nl/praat/praat{{DownloadUrlx64}}.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" "$url64"
