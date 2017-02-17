$packageName = 'languagetool'
$url = 'https://languagetool.org/download/LanguageTool-3.6.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum fc66aa5515f93c16f9195bf57e84b117929574ea9b8a335d0a38f4c66d132353 -ChecksumType 'sha256'

