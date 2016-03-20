$packageName = 'geforce-game-ready-driver'
$version = '364.51'
$fileType = 'exe'
$silentArgs = '-s -noreboot'

$WindowsVersion = (Get-WmiObject -Class Win32_OperatingSystem).Caption
if ( $WindowsVersion -match 'Windows 10' ) {
	$url = "http://us.download.nvidia.com/Windows/$version/$version-desktop-win10-32bit-international-whql.exe"
	$url64 = "http://us.download.nvidia.com/Windows/$version/$version-desktop-win10-64bit-international-whql.exe"
}
Else {
	$url = "http://us.download.nvidia.com/Windows/$version/$version-desktop-win8-win7-winvista-32bit-international-whql.exe"
	$url64 = "http://us.download.nvidia.com/Windows/$version/$version-desktop-win8-win7-winvista-64bit-international-whql.exe"
}

$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
	$url = $url64
}

New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver\nvidiadriver.zip"
$unpackDir = "${ENV:TEMP}\nvidiadriver"
Get-ChocolateyWebFile $packageName $unpackFile $url
Get-ChocolateyUnzip $unpackFile $unpackDir
$file = "${ENV:TEMP}\nvidiadriver\setup.exe"
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackDir -Recurse -Force
