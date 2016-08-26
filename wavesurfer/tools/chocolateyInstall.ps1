$packageName = '{{PackageName}}'
$url = 'http://sourceforge.net/projects/wavesurfer/files/wavesurfer/1.8.8p4/wavesurfer-1.8.8p4-win-i386.zip/download'
$fileName = "wavesurfer.exe"
$linkName = "wavesurfer.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum {{checksum}} -ChecksumType 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath