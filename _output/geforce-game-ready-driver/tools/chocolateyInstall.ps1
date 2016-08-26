$packageName = 'geforce-game-ready-driver'
$version = '372.54'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
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

Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum b4642f1a50d3fe5769e0d13267899a8d9811ca96537e943b1794098bdf2496f8 -ChecksumType 'sha256' -Checksum64 b2628cd252b5ca4c77ca4f72b4de6596cade3177af3a198b7674c0555d2d3b6d -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Remove-Item $unpackDir\GFExperience* -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
