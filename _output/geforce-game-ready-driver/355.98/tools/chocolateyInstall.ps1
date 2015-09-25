$packageName = 'geforce-game-ready-driver'
$url = 'http://us.download.nvidia.com/Windows/355.98/355.98-desktop-win8-win7-winvista-32bit-international-whql.exe'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$url64 = 'http://us.download.nvidia.com/Windows/355.98/355.98-desktop-win8-win7-winvista-64bit-international-whql.exe'

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
