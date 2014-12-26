$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"
