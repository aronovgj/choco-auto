$linkName32 = "CrystalDiskInfox32.lnk"
$linkName64 = "CrystalDiskInfox64.lnk"
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath32 = Join-Path $programs $linkName32
$shortcutFilePath64 = Join-Path $programs $linkName64

if(Test-Path $shortcutFilePath32) {
	del $shortcutFilePath32
}
if(Test-Path $shortcutFilePath64) {
	del $shortcutFilePath64
}