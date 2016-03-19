$packageName = '{{PackageName}}'
$version = '{{PackageVersion}}'
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

$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = Join-Path "$unpackDir" "nvidiadriver.zip"
Get-ChocolateyWebFile $packageName $unpackFile $url $url64
Get-ChocolateyUnzip $unpackFile $unpackDir
$file = Join-Path "$unpackDir" "setup.exe"
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackDir -Recurse -Force
