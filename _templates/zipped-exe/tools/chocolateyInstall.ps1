$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$url64 = '{{DownloadUrlx64}}' #REMOVE IF NOT NEEDED
$fileName = 'FILENAME.exe' #CHANGE
$linkName = 'LINKNAME.lnk' #CHANGE
$destDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$targetPath = Join-Path $destDir $fileName
Install-ChocolateyZipPackage "$packageName" "$url" "$destDir" "$url64" #REMOVE url64 IF NOT NEEDED

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

# create gui file
Set-Content -Path ("$targetPath.gui") -Value $null