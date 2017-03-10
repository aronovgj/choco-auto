$packageName = 'geforce-game-ready-driver-win10'
$version = '378.78'
$fileType = 'exe'
$silentArgs = '-s -noreboot -clean'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/378.78/378.78-desktop-win10-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/378.78/378.78-desktop-win10-64bit-international-whql.exe"


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum b7e613196815ccb9c9f93a30fdc96ffb66ba92c74faee45fdd75e5951feeccac -ChecksumType 'sha256' -Checksum64 b7e613196815ccb9c9f93a30fdc96ffb66ba92c74faee45fdd75e5951feeccac -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile -Recurse -Force