$packageName = 'wavesurfer'
$url = 'http://sourceforge.net/projects/wavesurfer/files/wavesurfer/1.8.8p4/wavesurfer-1.8.8p4-win-i386.zip/download'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"
