$packageName = 'geforce-game-ready-driver-win7'
$version = '375.70'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/375.70/375.70-desktop-win8-win7-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/375.70/375.70-desktop-win8-win7-64bit-international-whql.exe"


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum bc27cbbbbb8800579f8f909abffe5f01f921f56cdea40b04c7a7dfeacfb26cd3 -ChecksumType 'sha256' -Checksum64 fb6bc4f3b2bee7282a623817fd4520a85de49b8ecb55421f99080e794e7bd8b6 -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
#Remove-Item $unpackDir\Update.Core -Recurse -Force
#Remove-Item $unpackDir\Display.Update -Recurse -Force
#Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
