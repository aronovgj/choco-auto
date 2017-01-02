$packageName = 'geforce-game-ready-driver-win10'
$version = '376.33'
$fileType = 'exe'
$silentArgs = '-s -noreboot -clean'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/376.33/376.33-desktop-win10-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/376.33/376.33-desktop-win10-64bit-international-whql.exe"


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum 4f616e8e60934d533a2101a5360b7c0c67baa5da1b1bc11b766a34b4fb5c0a4d -ChecksumType 'sha256' -Checksum64 4f616e8e60934d533a2101a5360b7c0c67baa5da1b1bc11b766a34b4fb5c0a4d -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
