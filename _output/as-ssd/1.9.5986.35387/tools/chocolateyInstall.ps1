$packageName = 'as-ssd'
$url = 'http://www.alex-is.de/progs/AS SSD Benchmark.zip'
$fileName = "AS SSD Benchmark.exe"
$linkName = "AS SSD.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir"

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath