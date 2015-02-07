$packageName = 'ccenhancer'
$url = 'https://singularlabs.com/download/10320/'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$executable = "CCEnhancer-4.2-mulitlingual\CCEnhancer-4.2.exe"
$targetFilePath = "$unzipLocation\$executable"

try {
	Install-ChocolateyZipPackage $packageName $url $unzipLocation
	Install-ChocolateyDesktopLink $targetFilePath
} catch {
	throw $_.Exception 
}
