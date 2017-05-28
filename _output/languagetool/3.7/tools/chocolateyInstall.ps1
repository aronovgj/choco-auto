$packageName = 'languagetool'
$url = 'https://languagetool.org/download/LanguageTool-3.7.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum a97763a32e15b3f7d16e235b0137462d9699548d9d5a88b2f7764c21c04f2412 -ChecksumType 'sha256'

