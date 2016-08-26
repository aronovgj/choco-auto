$packageName = 'wavesurfer'
$url = 'http://sourceforge.net/projects/wavesurfer/files/wavesurfer/1.8.8p4/wavesurfer-1.8.8p4-win-i386.zip/download'
$fileName = "wavesurfer.exe"
$linkName = "wavesurfer.lnk"
$destdir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "$packageName" "$url" "$destdir" -Checksum 0dc701e380a8501fbcb04508a38e90a982b5663781e62d73e99a00afbc2a8817 -ChecksumType 'sha256'

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $destdir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath