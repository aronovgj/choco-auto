$packageName = 'as-ssd'
$url = 'http://www.alex-is.de/progs/AS SSD Benchmark.zip'
$fileName = "AS SSD Benchmark.exe"
$linkName = "AS SSD.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum ee1d8e33ceba5ec1a236c5ee0e4a7fc69bd69ee17a642f1391d31b0b4bd58d3c -ChecksumType 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath