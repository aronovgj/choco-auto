$packageName = 'languagetool'
$url = 'https://languagetool.org/download/LanguageTool-4.0.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum 0e8c40f3731213fdd3260cc1b8637401ac5f25bf1ddba756d129225f5eeaa1c5 -ChecksumType 'sha256'

