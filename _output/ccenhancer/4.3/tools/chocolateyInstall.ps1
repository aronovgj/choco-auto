$packageName = 'ccenhancer'
$url = 'https://singularlabs.com/download/10320/'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage $packageName $url $unzipLocation
