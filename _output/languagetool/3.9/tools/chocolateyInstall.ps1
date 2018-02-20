$packageName = 'languagetool'
$url = 'https://languagetool.org/download/LanguageTool-3.9.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum 75f265e1e18b345505a9b002f77a4368c41d36b396c53b7ef2e078698feb63ea -ChecksumType 'sha256'

