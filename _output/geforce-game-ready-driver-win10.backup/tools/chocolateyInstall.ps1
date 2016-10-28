$packageName = 'geforce-game-ready-driver-win10'
$version = '375.63'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/$version/$version-desktop-win10-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/$version/$version-desktop-win10-64bit-international-whql.exe"


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum fcdaee8afe1fcd21ce927302529ef8d7a0713f5e0ad428a367131c0f7f837af2 -ChecksumType 'sha256' -Checksum64 fcdaee8afe1fcd21ce927302529ef8d7a0713f5e0ad428a367131c0f7f837af2 -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
