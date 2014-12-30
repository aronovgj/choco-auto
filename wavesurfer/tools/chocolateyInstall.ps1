$packageName = '{{PackageName}}'
$url = 'http://sourceforge.net/projects/wavesurfer/files/wavesurfer/{{DownloadUrlx64}}/wavesurfer-{{DownloadUrlx64}}-win-i386.zip/download'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"
