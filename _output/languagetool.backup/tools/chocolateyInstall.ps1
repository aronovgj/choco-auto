$packageName = 'languagetool'
$url = 'https://languagetool.org/download/LanguageTool-3.4.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum ff36380c5807c5bdc67d222c5f2adeeb0a047a02661885c29cd8297443846c9c -ChecksumType 'sha256'

