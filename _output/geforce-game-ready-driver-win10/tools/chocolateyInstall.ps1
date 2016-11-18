$packageName = 'geforce-game-ready-driver-win10'
$version = '375.86'
$fileType = 'exe'
$silentArgs = '-s -noreboot -clean'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/375.86/375.86-desktop-win10-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/375.86/375.86-desktop-win10-64bit-international-whql.exe"


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum daf98746cc8a11760b2b985e8d642675bd141c1d96ab4e453b9da2d1f0a62373 -ChecksumType 'sha256' -Checksum64 daf98746cc8a11760b2b985e8d642675bd141c1d96ab4e453b9da2d1f0a62373 -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
