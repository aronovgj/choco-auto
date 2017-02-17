$packageName = 'as-ssd'
$url = 'http://www.alex-is.de/progs/AS SSD Benchmark.zip'
$fileName = "AS SSD Benchmark.exe"
$linkName = "AS SSD.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum c494d2f8e844802577565ecd487c12333f1fdbb4ba68f547bda0425a4f090868 -ChecksumType 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath