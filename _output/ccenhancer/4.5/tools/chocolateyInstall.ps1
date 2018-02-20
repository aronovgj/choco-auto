$packageName = 'ccenhancer'
$url = 'https://singularlabs.com/download/10320/'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$fileName = "CCEnhancer.exe"
$linkName = "CCEnhancer.lnk"

# if upgrading. Else this is null and then it has to be checked again after upgrade.
$folder = Get-ChildItem $unzipLocation | Where-Object {$_.Name -match "CCEnhancer-.*"}
$folder = $folder.FullName

If ($folder){
	If (Test-Path $folder){
		Remove-Item $folder -Force -Recurse
	}
}
Install-ChocolateyZipPackage $packageName $url $unzipLocation -Checksum 50cd9e059a8c3a26c9587489bb45064fab01207cd3acadb8f19abee46fbaf98f -ChecksumType 'sha256'

#if fresh install
$folder = Get-ChildItem $unzipLocation | Where-Object {$_.Name -match "CCEnhancer-.*"}
$folder = $folder.FullName

$gui = Join-Path $folder "CCEnhancer.exe.gui"
New-Item $gui -type file -force

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $folder $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath