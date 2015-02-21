$packageName = 'languagetool'
$url = 'https://languagetool.org/download/LanguageTool-2.8.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"
