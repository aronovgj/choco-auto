$packageName = '{{PackageName}}'
$fileType = 'exe'
$silentArgs = '/s'

$url = '{{DownloadUrl}}'

try {
	new-item "${env:temp}\nvidiadriver" -itemtype directory
	$unpackfile = "${env:temp}\nvidiadriver\nvidiadriver.zip"
	$unpackdir = "${env:temp}\nvidiadriver"
	Get-ChocolateyWebFile $packageName $unpackfile $url
	Get-ChocolateyUnzip $unpackfile $unpackdir
	$file = "${env:temp}\nvidiadriver\setup.exe"
	Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
	Remove-Item $unpackdir -Recurse -Force
} catch {
    throw $_.Exception 
}