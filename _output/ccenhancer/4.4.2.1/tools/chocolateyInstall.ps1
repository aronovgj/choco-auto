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
Install-ChocolateyZipPackage $packageName $url $unzipLocation -Checksum d5c2d4ade8b10dffa415d19ff4d0b3a31c8129b83c9a7db9594bcab71733d9f7 -ChecksumType 'sha256'

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