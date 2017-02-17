$packageName = 'geforce-game-ready-driver-win10'
$version = '378.66'
$fileType = 'exe'
$silentArgs = '-s -noreboot -clean'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/378.66/378.66-desktop-win10-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/378.66/378.66-desktop-win10-64bit-international-whql.exe"


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum 132daa7118de9d281868e69c45aa2f2d198d386ce4e979443205c2e645c51d13 -ChecksumType 'sha256' -Checksum64 132daa7118de9d281868e69c45aa2f2d198d386ce4e979443205c2e645c51d13 -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile -Recurse -Force