$packageName = 'languagetool'
$url = 'https://languagetool.org/download/LanguageTool-3.5.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum 643029da89041ccfb48772deaf0dd0e16942de2d381c5dc8ae9372f1b043bcab -ChecksumType 'sha256'

