$packageName = 'languagetool'
$url = 'https://languagetool.org/download/LanguageTool-3.8.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum e910a4ea0f0000409ba91220cbf56ae0f23c814efab5d2845f8059cbb918453c -ChecksumType 'sha256'

