$packageName = 'geforce-game-ready-driver-win10'
$version = '376.19'
$fileType = 'exe'
$silentArgs = '-s -noreboot -clean'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/376.19/376.19-desktop-win10-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/376.19/376.19-desktop-win10-64bit-international-whql.exe"


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum b64c6844ba749dd8b7465a2b9c5d422e7560fce4ab358516e74791da82e8376a -ChecksumType 'sha256' -Checksum64 b64c6844ba749dd8b7465a2b9c5d422e7560fce4ab358516e74791da82e8376a -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
