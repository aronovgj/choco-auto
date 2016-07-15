$packageName = 'languagetool'
$url = 'https://languagetool.org/download/LanguageTool-3.4.zip'
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"
