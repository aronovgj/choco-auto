$packageName = 'ccenhancer'
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$shortcut_to_remove = "CCEnhancer-4.2.exe.lnk"

try {

	Remove-Item "$desktop\$shortcut_to_remove"	
} catch {
	throw $_.Exception 
}