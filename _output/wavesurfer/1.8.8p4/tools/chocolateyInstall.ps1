$packageName = 'wavesurfer'
$url = 'http://garr.dl.sourceforge.net/project/wavesurfer/wavesurfer/1.8.8p4/wavesurfer-1.8.8p4-win-i386.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"
