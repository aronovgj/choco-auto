$packageName = 'languagetool'
$url = 'https://languagetool.org/download/LanguageTool-4.1.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum 350ae3584d72dfc769f63adbf46a438e3a66ad86c9cdd4dd0c3e3c44ed38b31e -ChecksumType 'sha256'

