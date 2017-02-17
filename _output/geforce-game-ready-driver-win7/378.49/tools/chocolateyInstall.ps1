$packageName = 'geforce-game-ready-driver-win7'
$version = '378.49'
$fileType = 'exe'
$silentArgs = '-s -noreboot -clean'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\nvidiadriver.zip"
$setupFile = Join-Path "$unpackDir" "setup.exe"

$url = "http://us.download.nvidia.com/Windows/378.49/378.49-desktop-win8-win7-32bit-international-whql.exe"
$url64 = "http://us.download.nvidia.com/Windows/378.49/378.49-desktop-win8-win7-64bit-international-whql.exe"


Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -Checksum 618901aab11e4ef1d1155317c2c6414d8f461b0f7b83a903b718d7837cfd19ca -ChecksumType 'sha256' -Checksum64 589c6612384fe027ea95d6ea4f5985ec298a2347379bdb6bdd935c32e010c0b7 -ChecksumType64 'sha256'
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile -Recurse -Force
