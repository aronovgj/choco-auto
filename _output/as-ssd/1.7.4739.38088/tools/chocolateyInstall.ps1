$packageName = 'as-ssd'
$url = 'http://www.alex-is.de/progs/AS SSD Benchmark.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"
