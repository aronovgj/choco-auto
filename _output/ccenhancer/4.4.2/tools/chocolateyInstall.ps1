$packageName = 'ccenhancer'
$url = 'https://singularlabs.com/download/10320/'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$fileName = "CCEnhancer.exe"
$linkName = "CCEnhancer.lnk"


$folder = Get-ChildItem $unzipLocation | Where-Object {$_.Name -match "CCEnhancer*"}

If ($folder){
	If (Test-Path $folder){
		Remove-Item $folder
	}
}
Install-ChocolateyZipPackage $packageName $url $unzipLocation -Checksum b707bc14672cb39093e1a0e67b3f31dce8532f51c2f4a79ef2bf12597b6ea5e6 -ChecksumType 'sha256'

$installDir = Join-Path $unzipLocation $folder
$gui = Join-Path $installDir "CCEnhancer.exe.gui"
New-Item $gui -type file -force

#install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs $linkName 
$targetPath = Join-Path $installDir $fileName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath