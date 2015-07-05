$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$url64 = '{{DownloadUrlx64}}'

$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
	$url = $url64
}

new-item "${env:temp}\nvidiadriver" -itemtype directory -Force
$unpackfile = "${env:temp}\nvidiadriver\nvidiadriver.zip"
$unpackdir = "${env:temp}\nvidiadriver"
Get-ChocolateyWebFile $packageName $unpackfile $url
Get-ChocolateyUnzip $unpackfile $unpackdir
$file = "${env:temp}\nvidiadriver\setup.exe"
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackdir -Recurse -Force
