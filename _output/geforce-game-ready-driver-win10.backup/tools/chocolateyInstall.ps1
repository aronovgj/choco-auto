$packageName = 'geforce-game-ready-driver-win10'
$version = '375.70'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/375.70/375.70-desktop-win10-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/375.70/375.70-desktop-win10-64bit-international-whql.exe"


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum 4f41263bd25be9bc1dd0ae7fded90782c31bf2bd70c9d1ad73485f74bf84d5f3 -ChecksumType 'sha256' -Checksum64 4f41263bd25be9bc1dd0ae7fded90782c31bf2bd70c9d1ad73485f74bf84d5f3 -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
#Remove-Item $unpackDir\Update.Core -Recurse -Force
#Remove-Item $unpackDir\Display.Update -Recurse -Force
#Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
