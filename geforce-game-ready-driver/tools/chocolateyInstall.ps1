$packageName = '{{PackageName}}'
$version = '{{PackageVersion}}'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = Join-Path "$unpackDir" "nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$WindowsVersion = (Get-WmiObject -Class Win32_OperatingSystem).Caption
if ( $WindowsVersion -match 'Windows 10' ) {
	$url = "http://us.download.nvidia.com/Windows/$version/$version-desktop-win10-32bit-international-whql.exe"
	$url64 = "http://us.download.nvidia.com/Windows/$version/$version-desktop-win10-64bit-international-whql.exe"
}
Else {
	$url = "http://us.download.nvidia.com/Windows/$version/$version-desktop-win8-win7-winvista-32bit-international-whql.exe"
	$url64 = "http://us.download.nvidia.com/Windows/$version/$version-desktop-win8-win7-winvista-64bit-international-whql.exe"
}

Get-ChocolateyWebFile $packageName $unpackFile $url $url64
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Remove-Item $unpackDir\GFExperience* -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
