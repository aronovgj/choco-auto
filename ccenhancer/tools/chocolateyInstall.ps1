$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

try {
	
	Install-ChocolateyZipPackage $packageName $url $unzipLocation

} catch {
	throw $_.Exception 
}
