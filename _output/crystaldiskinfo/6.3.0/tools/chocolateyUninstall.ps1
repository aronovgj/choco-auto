$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "CrystalDiskInfo.lnk"
if(Test-Path $shortcutFilePath) {
    del $shortcutFilePath
}